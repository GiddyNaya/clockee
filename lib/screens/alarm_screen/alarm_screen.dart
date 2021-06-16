import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:clockee/constants/theme_data.dart';
import 'package:clockee/services/alarm_scheduler.dart';
import 'package:clockee/utils/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:clockee/stores/alarm_status/alarm_status.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:clockee/widgets/rounded_button.dart';
import 'package:wakelock/wakelock.dart';

import '../../main.dart';

class AlarmScreen extends StatelessWidget {
  final ObservableAlarm? alarm;

  const AlarmScreen({Key? key, required this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); // fullscreen
    final now = DateTime.now();
    final format = DateFormat('Hm');
    final snoozeTimes = [5, 10, 15, 20];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Container(
              width: 325,
              height: 325,
              decoration: ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(
                          color: CustomColors.sdPrimaryBgLightColor,
                          style: BorderStyle.solid,
                          width: 10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.alarm,
                    color: CustomColors.sdPrimaryColor,
                    size: 32,
                  ),
                  Text(
                    format.format(now),
                    style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w900,
                        color: CustomColors.sdPrimaryColor),
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      alarm!.name!,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: CustomColors.sdPrimaryColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () async {
              await rescheduleAlarm(5);
            },
            child: text("Snooze", textColor: CustomColors.sdPrimaryColor),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: snoozeTimes
                .map((minutes) => RoundedButton(
                      "+$minutes\m",
                      fontSize: 24,
                      onTap: () async {
                        await rescheduleAlarm(minutes);
                      },
                    ))
                .toList(),
          ),
          SizedBox(
            height: 45,
          ),
          RoundedButton("Dismiss", fontSize: 45, onTap: () async {
            await dismissCurrentAlarm();
          }),
        ],
      ),
    );
  }

  Future<void> dismissCurrentAlarm() async {
    mediaHandler.stopMusic();
    Wakelock.disable();

    AlarmStatus().isAlarm = false;
    AlarmStatus().alarmId = -1;
    SystemNavigator.pop();
  }

  Future<void> rescheduleAlarm(int minutes) async {
    // Re-schedule alarm
    var checkedDay = DateTime.now();
    var targetDateTime = DateTime(checkedDay.year, checkedDay.month,
        checkedDay.day, alarm!.hour!, alarm!.minute!);
    await AlarmScheduler()
        .newShot(targetDateTime.add(Duration(minutes: minutes)), alarm!.id!);
    dismissCurrentAlarm();
  }
}
