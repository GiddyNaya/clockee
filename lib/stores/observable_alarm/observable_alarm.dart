import 'package:clockee/stores/song_info/song_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'observable_alarm.g.dart';

@JsonSerializable()
class ObservableAlarm extends ObservableAlarmBase with _$ObservableAlarm {
  ObservableAlarm(
      {id,
      name,
      hour,
      minute,
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday,
      volume,
      progressiveVolume,
      active})
      : super(
            id: id,
            name: name,
            hour: hour,
            minute: minute,
            monday: monday,
            tuesday: tuesday,
            wednesday: wednesday,
            thursday: thursday,
            friday: friday,
            saturday: saturday,
            sunday: sunday,
            volume: volume,
            progressiveVolume: progressiveVolume,
            active: active);

  ObservableAlarm.dayList(id, name, hour, minute, volume, progressiveVolume,
      active, weekdays, musicIds, musicPaths)
      : super(
            id: id,
            name: name,
            hour: hour,
            minute: minute,
            volume: volume,
            progressiveVolume: progressiveVolume,
            active: active,
            monday: weekdays[0],
            tuesday: weekdays[1],
            wednesday: weekdays[2],
            thursday: weekdays[3],
            friday: weekdays[4],
            saturday: weekdays[5],
            sunday: weekdays[6],
            musicPaths: musicPaths);

  factory ObservableAlarm.fromJson(Map<String, dynamic> json) =>
      _$ObservableAlarmFromJson(json);

  Map<String, dynamic> toJson() => _$ObservableAlarmToJson(this);
}

abstract class ObservableAlarmBase with Store {
  int? id = -1;

  @observable
  String? name;

  @observable
  int? hour = 0;

  @observable
  int? minute = 0;

  @observable
  bool? monday = false;

  @observable
  bool? tuesday = false;

  @observable
  bool? wednesday = false;

  @observable
  bool? thursday = false;

  @observable
  bool? friday = false;

  @observable
  bool? saturday = false;

  @observable
  bool? sunday = false;

  @observable
  double? volume = 0;

  @observable
  bool? progressiveVolume = false;

  @observable
  bool? active = false;

  /// Field holding the paths of the soundfiles that should be loaded.
  /// musicIds cannot be used in the alarm callback because of a weird
  /// interaction between flutter_audio_query and android_alarm_manager
  /// See Stack Overflow post here: https://stackoverflow.com/q/60203223/6707985
  List<String>? musicPaths;

  @observable
  @JsonKey(ignore: true)
  ObservableList<SongInfo> trackInfo = ObservableList();

  ObservableAlarmBase({
    this.id,
    this.name,
    this.hour,
    this.minute,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.volume,
    this.progressiveVolume,
    this.active,
    this.musicPaths,
  });

  @action
  void removeSong(SongInfo info) {
    trackInfo.remove(info);
    // trackInfo = trackInfo;
  }

  @action
  addSong(SongInfo info) {
    // Stupid enough for dart sdk.
    // Since we are using null safety, calling firstWhere on an iterable
    // will throw an exception when no item matched given conditions.
    // We could better off include the package:collection lib and make use of
    // firstWhereOrNull but who adds a whole package just to use a single function.
    // https://github.com/dart-lang/sdk/issues/42947
    try {
      // To prevent duplicate entries... We check if an item already exist
      var existingItem =
          trackInfo.firstWhere((element) => element.filePath == info.filePath);
      //...Fuck yeah it does if it passes through.
    } catch (e) {
      // An exception indicates no item was found matching our condition.
      trackInfo.add(info); // Hence we add record
      updateMusicPaths();
    }
  }

  @action
  void reorder(int oldIndex, int newIndex) {
    final path = trackInfo[oldIndex];
    trackInfo.removeAt(oldIndex);
    trackInfo.insert(newIndex, path);
    trackInfo = trackInfo;
  }

  @action
  loadTracks() async {
    if (musicPaths!.isEmpty) {
      trackInfo = ObservableList();
      return;
    }

    final musicPathOffine =
        musicPaths!.where((element) => !element.startsWith("http"));
    final musicPathOnline =
        musicPaths!.where((element) => element.startsWith("http"));
    List<SongInfo> songs = [];
    // Add offline songs to list
    for (var path in musicPathOffine) {
      var title = "";
      if (path.contains("/"))
        title = path.split("/").last;
      else
        title = path.split("\\").last;
      songs.add(SongInfo(title: title, filePath: path, isOnline: false));
    }
    // Add online songs to list
    for (var path in musicPathOnline) {
      var title = path.split("/").last;
      songs.add(SongInfo(title: title, filePath: path, isOnline: true));
    }
    trackInfo = ObservableList.of(songs);
  }

  updateMusicPaths() {
    musicPaths = trackInfo.map((SongInfo info) => info.filePath).toList();
  }

  List<bool> get days {
    return [
      monday!,
      tuesday!,
      wednesday!,
      thursday!,
      friday!,
      saturday!,
      sunday!
    ];
  }

  // Good enough for debugging for now
  toString() {
    return "active: $active, music offline: $musicPaths";
  }
}
