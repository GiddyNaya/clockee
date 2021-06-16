import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clockee/screens/edit_alarm/edit_alarm.dart';
import 'package:clockee/services/alarm_list_manager.dart';
import 'package:clockee/stores/alarm_list/alarm_list.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

const dates = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

class AlarmItem extends StatelessWidget {
  final ObservableAlarm alarm;
  final AlarmListManager? manager;

  const AlarmItem({Key? key, required this.alarm, this.manager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditAlarm(alarm: this.alarm, manager: manager!))),
      child: Observer(
        builder: (context) => Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            // boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: alarm.active! ? 2 : 0,
            intensity: alarm.active! ? 0.9 : 0.1,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.label_outline,
                            color: alarm.active!
                                ? CustomColors.sdPrimaryColor
                                : CustomColors.sdShadowDarkColor,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              alarm.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: CustomColors.sdPrimaryColor),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${alarm.hour.toString().padLeft(2, '0')}:${alarm.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.sdPrimaryColor),
                      ),
                      DateRow(alarm: alarm)
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: NeumorphicSwitch(
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
            ),
          ),
        ),
      ),
    );
  }
}

class DateRow extends StatelessWidget {
  final ObservableAlarm alarm;
  final List<bool> dayEnabled;

  DateRow({
    Key? key,
    required this.alarm,
  })  : dayEnabled = [
          alarm.monday!,
          alarm.tuesday!,
          alarm.wednesday!,
          alarm.thursday!,
          alarm.friday!,
          alarm.saturday!,
          alarm.sunday!
        ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(150, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dates.asMap().entries.map((indexStringPair) {
          final dayString = indexStringPair.value;
          final index = indexStringPair.key;
          return Text(
            dayString,
            style: TextStyle(
                color: dayEnabled[index]
                    ? CustomColors.sdPrimaryColor
                    : CustomColors.sdPrimaryColor.withOpacity(0.5),
                fontWeight:
                    dayEnabled[index] ? FontWeight.bold : FontWeight.normal),
          );
        }).toList(),
      ),
    );
  }
}
