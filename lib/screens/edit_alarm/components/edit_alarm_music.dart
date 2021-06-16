import 'dart:io';

import 'package:clockee/constants/global.dart';
import 'package:clockee/main.dart';
import 'package:clockee/stores/song_info/song_info.dart';
import 'package:clockee/widgets/single_input_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clockee/screens/edit_alarm/components/music_list_item.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:clockee/utils/widget_helper.dart';

enum SelectionMode { OFFLINE, ONLINE }

class EditAlarmMusic extends StatelessWidget {
  final ObservableAlarm? alarm;

  const EditAlarmMusic({Key? key, this.alarm}) : super(key: key);

  void openOnlineMusicSelectionDialog(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => SingleInputDialog(
        title: "Online Audio/Stream",
        subtitle: "Supports: mp3, wav, m4a, aac, hls, dash",
        hintText: "http://...",
        labelText: "Stream url",
        actionText: "Add Stream",
        onSubmit: (text) {
          // Add audio link to sound path list
          print("text: $text");
          print("text ext: ${text.split(".").last}");
          if (text.trim().isNotEmpty &&
              text.contains(".") &&
              text.startsWith("http") &&
              (audioFormats.contains(text.split(".").last) ||
                  livestreamFormats.contains(text.split(".").last))) {
            print("text added $text");
            alarm!
                .addSong(SongInfo(title: text, filePath: text, isOnline: true));
            alarm!.loadTracks();
          }
        },
      ),
    );
  }

  Future<void> openOfflineMusicSelectionDialog(context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);

    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.path != null) {
        alarm!.addSong(SongInfo(
            title: file.name + " ${file.extension}", filePath: file.path!));
        alarm!.loadTracks();
      }
    } else {
      // User canceled the picker
    }
  }

  // void openPlaylistSelectionDialog(context) async {
  //   final audioQuery = FlutterAudioQuery();
  //   final playlists = await audioQuery.getPlaylists();

  //   showDialog(
  //     context: context,
  //     builder: (context) =>
  //         PlaylistSelectionDialog(alarm: alarm, playlists: playlists),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PopupMenuButton<SelectionMode>(
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.deepPurple,
              ),
              Expanded(
                child: text('Add Sounds'),
              )
            ],
          ),
          itemBuilder: (_) {
            return [
              {"text": "Local media", "value": SelectionMode.OFFLINE},
              {"text": "Online stream", "value": SelectionMode.ONLINE},
            ]
                .map((item) => PopupMenuItem<SelectionMode>(
                    value: item["value"] as SelectionMode,
                    child: Text(item["text"] as String)))
                .toList();
          },
          onSelected: (selection) async {
            switch (selection) {
              case SelectionMode.OFFLINE:
                await openOfflineMusicSelectionDialog(context);
                break;
              case SelectionMode.ONLINE:
                openOnlineMusicSelectionDialog(context);
                break;
            }
          },
        ),
        SizedBox.fromSize(
          size: Size.fromHeight(300),
          child: Observer(
            builder: (context) {
              final musicListItems = alarm!.trackInfo
                  .map((info) => MusicListItem(
                        alarm: alarm!,
                        musicInfo: info,
                        key: Key(info.filePath),
                      ))
                  .toList();

              // return ReorderableListView(
              //   children: musicListItems,
              //   onReorder: this.alarm!.reorder,
              // );

              return ReorderableListView.builder(
                onReorder: this.alarm!.reorder,
                itemBuilder: (context, index) {
                  final musicListItem = musicListItems[index];

                  return Dismissible(
                    key: Key(musicListItem.key.toString()),
                    child: musicListItem,
                    onDismissed: (_) async {
                      await mediaHandler.stopMusic();
                      this.alarm!.removeSong(musicListItem.musicInfo);
                      musicListItems.removeAt(index);
                    },
                  );
                },
                itemCount: musicListItems.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
