import 'package:clockee/constants/theme_data.dart';
import 'package:clockee/enums.dart';
import 'package:clockee/models/menu_info.dart';
import 'package:clockee/screens/main/alarm_list_screen.dart';
import 'package:clockee/stores/alarm_list/alarm_list.dart';
// import 'package:clockee/views/alarm_page.dart';
import 'package:clockee/screens/main/clock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

// import '../main.dart';
List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: 'Clock', icon: Icons.timelapse),
  MenuInfo(MenuType.alarm, title: 'Alarm', icon: Icons.alarm),
];

class MainScreen extends StatefulWidget {
  final AlarmList alarms;

  const MainScreen({Key? key, required this.alarms}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // _requestPermissions();
    // _configureSelectNotificationSubject();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); // fullscreen
    return Scaffold(
      // backgroundColor: CustomColors.pageBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock)
                  return ClockScreen();
                else if (value.menuType == MenuType.alarm)
                  return AlarmListScreen(alarms: widget.alarms);
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'New Page\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32))),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            color: currentMenuInfo.menuType == value.menuType
                ? NeumorphicTheme.isUsingDark(context)
                    ? Colors.black87
                    : Colors.white70
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: <Widget>[
                NeumorphicButton(
                  padding: EdgeInsets.all(18),
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                    shape: NeumorphicShape.flat,
                    depth: 2,
                    intensity: 0.7,
                  ),
                  child: Icon(
                    currentMenuInfo.icon,
                    color: CustomColors.sdPrimaryColor,
                  ),
                  onPressed: () {
                    //...
                    var menuInfo =
                        Provider.of<MenuInfo>(context, listen: false);
                    menuInfo.updateMenu(currentMenuInfo);
                  },
                ),
                SizedBox(height: 16),
                Text(
                  currentMenuInfo.title,
                  style: TextStyle(
                      color: CustomColors.primaryTextColor, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void _requestPermissions() {
  //   flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           IOSFlutterLocalNotificationsPlugin>()
  //       ?.requestPermissions(
  //         alert: true,
  //         badge: true,
  //         sound: true,
  //       );
  //   flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           MacOSFlutterLocalNotificationsPlugin>()
  //       ?.requestPermissions(
  //         alert: true,
  //         badge: true,
  //         sound: true,
  //       );
  // }

  // void _configureSelectNotificationSubject() {
  //   selectNotificationSubject.stream.listen((String payload) async {
  //     //  await Navigator.pushNamed(context, '/secondPage');
  //     print("Notification payload: $payload");
  //   });
  // }
}
