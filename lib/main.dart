import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';
import 'package:clockee/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'constants/theme_data.dart';
import 'enums.dart';
import 'models/menu_info.dart';
import 'screens/alarm_screen/alarm_screen.dart';
import 'services/alarm_polling_worker.dart';
import 'services/file_proxy.dart';
import 'services/life_cycle_listener.dart';
import 'services/media_handler.dart';
import 'stores/alarm_list/alarm_list.dart';
import 'stores/alarm_status/alarm_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';
import 'utils/schedule_notifications.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

AlarmList list = AlarmList();
MediaHandler mediaHandler = MediaHandler();
var playingSoundPath = ValueNotifier<String>("");
NotificationAppLaunchDetails? notificationAppLaunchDetails;
ScheduleNotifications notifications = ScheduleNotifications(
    'clockee_notification',
    'Clockee Alarm Notication',
    'Alerts on scheduled alarm events',
    appIcon: 'notification_logo');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final alarms = await new JsonFileStorage().readList();
  list.setAlarms(alarms);
  list.alarms.forEach((alarm) {
    alarm.loadTracks();
  });
  WidgetsBinding.instance!.addObserver(LifeCycleListener(list));

  await AndroidAlarmManager.initialize();

  runApp(MyApp());

  AlarmPollingWorker().createPollingWorker();

  final externalPath = await getExternalStorageDirectory();
  print(externalPath!.path);
  if (!externalPath.existsSync()) externalPath.create(recursive: true);
}

void restartApp() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Clockee',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
          defaultTextColor: Color(0xFF303E57),
          accentColor: Color(0xFF7B79FC),
          variantColor: CustomColors.sdAppBackgroundColor,
          baseColor: CustomColors.sdAppBackgroundColor, // Color(0xFFF8F9FC),
          depth: 8,
          intensity: 0.5,
          lightSource: LightSource.topLeft),
      home: Observer(builder: (context) {
        AlarmStatus status = AlarmStatus();
        print('status.isAlarm ${status.isAlarm}');
        print('list.alarms.length ${list.alarms.length}');
        if (status.isAlarm) {
          final id = status.alarmId;
          final alarm = list.alarms.firstWhere((alarm) => alarm.id == id,
              orElse: () => ObservableAlarm());

          mediaHandler.playMusic(alarm);
          Wakelock.enable();

          return Material(
              child: NeumorphicBackground(child: AlarmScreen(alarm: alarm)));
        }
        return ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock, icon: Icons.timelapse),
          child: Material(
            child: NeumorphicBackground(
              child: MainScreen(alarms: list),
            ),
          ),
        );
      }),
    );
  }
}
