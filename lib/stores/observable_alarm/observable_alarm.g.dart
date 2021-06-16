// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObservableAlarm _$ObservableAlarmFromJson(Map<String, dynamic> json) {
  return ObservableAlarm(
    id: json['id'],
    name: json['name'],
    hour: json['hour'],
    minute: json['minute'],
    monday: json['monday'],
    tuesday: json['tuesday'],
    wednesday: json['wednesday'],
    thursday: json['thursday'],
    friday: json['friday'],
    saturday: json['saturday'],
    sunday: json['sunday'],
    volume: json['volume'],
    progressiveVolume: json['progressiveVolume'],
    active: json['active'],
  )..musicPaths =
      (json['musicPaths'] as List<dynamic>?)?.map((e) => e as String).toList();
}

Map<String, dynamic> _$ObservableAlarmToJson(ObservableAlarm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hour': instance.hour,
      'minute': instance.minute,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'volume': instance.volume,
      'progressiveVolume': instance.progressiveVolume,
      'active': instance.active,
      'musicPaths': instance.musicPaths,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObservableAlarm on ObservableAlarmBase, Store {
  final _$nameAtom = Atom(name: 'ObservableAlarmBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$hourAtom = Atom(name: 'ObservableAlarmBase.hour');

  @override
  int? get hour {
    _$hourAtom.reportRead();
    return super.hour;
  }

  @override
  set hour(int? value) {
    _$hourAtom.reportWrite(value, super.hour, () {
      super.hour = value;
    });
  }

  final _$minuteAtom = Atom(name: 'ObservableAlarmBase.minute');

  @override
  int? get minute {
    _$minuteAtom.reportRead();
    return super.minute;
  }

  @override
  set minute(int? value) {
    _$minuteAtom.reportWrite(value, super.minute, () {
      super.minute = value;
    });
  }

  final _$mondayAtom = Atom(name: 'ObservableAlarmBase.monday');

  @override
  bool? get monday {
    _$mondayAtom.reportRead();
    return super.monday;
  }

  @override
  set monday(bool? value) {
    _$mondayAtom.reportWrite(value, super.monday, () {
      super.monday = value;
    });
  }

  final _$tuesdayAtom = Atom(name: 'ObservableAlarmBase.tuesday');

  @override
  bool? get tuesday {
    _$tuesdayAtom.reportRead();
    return super.tuesday;
  }

  @override
  set tuesday(bool? value) {
    _$tuesdayAtom.reportWrite(value, super.tuesday, () {
      super.tuesday = value;
    });
  }

  final _$wednesdayAtom = Atom(name: 'ObservableAlarmBase.wednesday');

  @override
  bool? get wednesday {
    _$wednesdayAtom.reportRead();
    return super.wednesday;
  }

  @override
  set wednesday(bool? value) {
    _$wednesdayAtom.reportWrite(value, super.wednesday, () {
      super.wednesday = value;
    });
  }

  final _$thursdayAtom = Atom(name: 'ObservableAlarmBase.thursday');

  @override
  bool? get thursday {
    _$thursdayAtom.reportRead();
    return super.thursday;
  }

  @override
  set thursday(bool? value) {
    _$thursdayAtom.reportWrite(value, super.thursday, () {
      super.thursday = value;
    });
  }

  final _$fridayAtom = Atom(name: 'ObservableAlarmBase.friday');

  @override
  bool? get friday {
    _$fridayAtom.reportRead();
    return super.friday;
  }

  @override
  set friday(bool? value) {
    _$fridayAtom.reportWrite(value, super.friday, () {
      super.friday = value;
    });
  }

  final _$saturdayAtom = Atom(name: 'ObservableAlarmBase.saturday');

  @override
  bool? get saturday {
    _$saturdayAtom.reportRead();
    return super.saturday;
  }

  @override
  set saturday(bool? value) {
    _$saturdayAtom.reportWrite(value, super.saturday, () {
      super.saturday = value;
    });
  }

  final _$sundayAtom = Atom(name: 'ObservableAlarmBase.sunday');

  @override
  bool? get sunday {
    _$sundayAtom.reportRead();
    return super.sunday;
  }

  @override
  set sunday(bool? value) {
    _$sundayAtom.reportWrite(value, super.sunday, () {
      super.sunday = value;
    });
  }

  final _$volumeAtom = Atom(name: 'ObservableAlarmBase.volume');

  @override
  double? get volume {
    _$volumeAtom.reportRead();
    return super.volume;
  }

  @override
  set volume(double? value) {
    _$volumeAtom.reportWrite(value, super.volume, () {
      super.volume = value;
    });
  }

  final _$progressiveVolumeAtom =
      Atom(name: 'ObservableAlarmBase.progressiveVolume');

  @override
  bool? get progressiveVolume {
    _$progressiveVolumeAtom.reportRead();
    return super.progressiveVolume;
  }

  @override
  set progressiveVolume(bool? value) {
    _$progressiveVolumeAtom.reportWrite(value, super.progressiveVolume, () {
      super.progressiveVolume = value;
    });
  }

  final _$activeAtom = Atom(name: 'ObservableAlarmBase.active');

  @override
  bool? get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool? value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$trackInfoAtom = Atom(name: 'ObservableAlarmBase.trackInfo');

  @override
  ObservableList<SongInfo> get trackInfo {
    _$trackInfoAtom.reportRead();
    return super.trackInfo;
  }

  @override
  set trackInfo(ObservableList<SongInfo> value) {
    _$trackInfoAtom.reportWrite(value, super.trackInfo, () {
      super.trackInfo = value;
    });
  }

  final _$loadTracksAsyncAction = AsyncAction('ObservableAlarmBase.loadTracks');

  @override
  Future loadTracks() {
    return _$loadTracksAsyncAction.run(() => super.loadTracks());
  }

  final _$ObservableAlarmBaseActionController =
      ActionController(name: 'ObservableAlarmBase');

  @override
  void removeSong(SongInfo info) {
    final _$actionInfo = _$ObservableAlarmBaseActionController.startAction(
        name: 'ObservableAlarmBase.removeSong');
    try {
      return super.removeSong(info);
    } finally {
      _$ObservableAlarmBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addSong(SongInfo info) {
    final _$actionInfo = _$ObservableAlarmBaseActionController.startAction(
        name: 'ObservableAlarmBase.addSong');
    try {
      return super.addSong(info);
    } finally {
      _$ObservableAlarmBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reorder(int oldIndex, int newIndex) {
    final _$actionInfo = _$ObservableAlarmBaseActionController.startAction(
        name: 'ObservableAlarmBase.reorder');
    try {
      return super.reorder(oldIndex, newIndex);
    } finally {
      _$ObservableAlarmBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
hour: ${hour},
minute: ${minute},
monday: ${monday},
tuesday: ${tuesday},
wednesday: ${wednesday},
thursday: ${thursday},
friday: ${friday},
saturday: ${saturday},
sunday: ${sunday},
volume: ${volume},
progressiveVolume: ${progressiveVolume},
active: ${active},
trackInfo: ${trackInfo}
    ''';
  }
}
