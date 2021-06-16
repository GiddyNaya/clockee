import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EditAlarmDays extends StatelessWidget {
  final ObservableAlarm? alarm;

  const EditAlarmDays({Key? key, this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            WeekDayToggle(
              text: 'Mo',
              current: alarm!.monday!,
              onToggle: (monday) => alarm!.monday = monday,
            ),
            WeekDayToggle(
              text: 'Tu',
              current: alarm!.tuesday!,
              onToggle: (tuesday) => alarm!.tuesday = tuesday,
            ),
            WeekDayToggle(
              text: 'We',
              current: alarm!.wednesday!,
              onToggle: (wednesday) => alarm!.wednesday = wednesday,
            ),
            WeekDayToggle(
              text: 'Th',
              current: alarm!.thursday!,
              onToggle: (thursday) => alarm!.thursday = thursday,
            ),
            WeekDayToggle(
              text: 'Fr',
              current: alarm!.friday!,
              onToggle: (friday) => alarm!.friday = friday,
            ),
            WeekDayToggle(
              text: 'Sa',
              current: alarm!.saturday!,
              onToggle: (saturday) => alarm!.saturday = saturday,
            ),
            WeekDayToggle(
              text: 'Su',
              current: alarm!.sunday!,
              onToggle: (sunday) => alarm!.sunday = sunday,
            ),
          ],
        ),
      ),
    );
  }
}

class WeekDayToggle extends StatelessWidget {
  final Function? onToggle;
  final bool current;
  final String text;

  const WeekDayToggle(
      {Key? key, this.onToggle, this.current = false, this.text = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize = 18.0;
    const size = 25.0;

    return GestureDetector(
      child: SizedBox.fromSize(
        size: Size.fromRadius(size),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: this.current ? 2 : 0,
            intensity: this.current ? 0.7 : 0,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Container(
            width: size,
            height: size,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                this.text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight:
                      this.current ? FontWeight.bold : FontWeight.normal,
                  color: this.current
                      ? CustomColors.sdPrimaryColor
                      : CustomColors.sdPrimaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () => this.onToggle!(!this.current),
    );
  }
}
