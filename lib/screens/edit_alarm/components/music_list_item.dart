import 'package:clockee/stores/song_info/song_info.dart';
import 'package:flutter/material.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';

import '../../../main.dart';

class MusicListItem extends StatelessWidget {
  final SongInfo musicInfo;
  final ObservableAlarm alarm;

  const MusicListItem({Key? key, required this.musicInfo, required this.alarm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.music_note),
        Expanded(child: Text(this.musicInfo.title)),
        ValueListenableBuilder(
          valueListenable: playingSoundPath,
          builder: (context, value, widget) {
            return IconButton(
                icon: value == musicInfo.filePath
                    ? Icon(Icons.pause)
                    : Icon(
                        Icons.play_arrow,
                      ),
                onPressed: () async {
                  // toggle player
                  if (value == musicInfo.filePath)
                    await mediaHandler.stopMusic();
                  else
                    await mediaHandler.playSingle(alarm, musicInfo.filePath);
                  //this.alarm.removeItem(musicInfo);
                });
          },
        ),
      ],
    );
  }
}
