import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EditAlarmHead extends StatelessWidget {
  final ObservableAlarm alarm;

  EditAlarmHead({required this.alarm});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Title:'),
              TextField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: TextEditingController(text: alarm.name),
                maxLength: 60,
                style: TextStyle(fontSize: 18),
                onChanged: (newName) => alarm.name = newName,
              )
            ],
          ),
        ),
        Observer(
          builder: (context) => NeumorphicSwitch(
            value: alarm.active!,
            onChanged: (value) {
              alarm.active = !alarm.active!;
            },
            style: NeumorphicSwitchStyle(
              activeTrackColor: Colors.green,
              inactiveTrackColor: CustomColors.sdShadowDarkColor,
            ),
          ),
        )
      ],
    );
  }
}
