// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_status.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlarmStatus on _AlarmStatus, Store {
  final _$isAlarmAtom = Atom(name: '_AlarmStatus.isAlarm');

  @override
  bool get isAlarm {
    _$isAlarmAtom.reportRead();
    return super.isAlarm;
  }

  @override
  set isAlarm(bool value) {
    _$isAlarmAtom.reportWrite(value, super.isAlarm, () {
      super.isAlarm = value;
    });
  }

  @override
  String toString() {
    return '''
isAlarm: ${isAlarm}
    ''';
  }
}
