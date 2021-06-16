import 'package:clockee/constants/theme_data.dart';
import 'package:clockee/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:clockee/widgets/dialog_container/dialog_container.dart';
import 'package:clockee/screens/edit_alarm/components/edit_alarm_days.dart';
import 'package:clockee/screens/edit_alarm/components/edit_alarm_head.dart';
import 'package:clockee/screens/edit_alarm/components/edit_alarm_music.dart';
import 'package:clockee/screens/edit_alarm/components/edit_alarm_slider.dart';
import 'package:clockee/screens/edit_alarm/components/edit_alarm_time.dart';
import 'package:clockee/services/alarm_list_manager.dart';
import 'package:clockee/services/alarm_scheduler.dart';
import 'package:clockee/utils/widget_helper.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EditAlarm extends StatelessWidget {
  final ObservableAlarm? alarm;
  final AlarmListManager? manager;

  EditAlarm({this.alarm, this.manager});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('onWillPop $alarm');
        await manager!.saveAlarm(alarm!);
        await AlarmScheduler().scheduleAlarm(alarm!);
        return true;
      },
      child: DialogContainer(
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              'Set Alarm',
              style:
                  TextStyle(color: CustomColors.sdPrimaryColor, fontSize: 28),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (context) => Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  // boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: this.alarm!.active! ? 2 : 1,
                  intensity: this.alarm!.active! ? 9 : 2,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      EditAlarmHead(alarm: this.alarm!),
                      Divider(),
                      EditAlarmTime(alarm: this.alarm!),
                      Divider(),
                      text("repeat", fontSize: CustomFontSize.textSizeSmall),
                      EditAlarmDays(alarm: this.alarm!),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      EditAlarmMusic(alarm: this.alarm!),
                      Divider(),
                      Row(children: [
                        Expanded(child: EditAlarmSlider(alarm: this.alarm!)),
                        SimpleButton("Done", onPressed: () async {
                          await manager!.saveAlarm(alarm!);
                          await AlarmScheduler().scheduleAlarm(alarm!);
                          Navigator.pop(context);
                        })
                      ])
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
