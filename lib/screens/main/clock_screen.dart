import 'dart:async';

import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

import '../../widgets/clockview.dart';

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneName = now.timeZoneName;
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: NeumorphicText(
              "Clock",
              style: NeumorphicStyle(
                depth: 3,
                intensity: 14,
              ),
              textStyle: NeumorphicTextStyle(
                  fontSize: 52, //customize size here
                  fontWeight: FontWeight.w900
                  // AND others usual text style properties (fontFamily, fontWeight, ...)
                  ),
            ),
          ),
          // Text(
          //           'Clockee',
          //           style: TextStyle(
          //               fontFamily: 'avenir',
          //               fontWeight: FontWeight.w700,
          //               color: CustomColors.primaryTextColor,
          //               fontSize: 24),
          //         ),
          //       ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DigitalClockWidget(),
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: CustomColors.primaryTextColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: Neumorphic(
                margin: EdgeInsets.all(14),
                style: NeumorphicStyle(
                  depth: 2,
                  intensity: 5,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    depth: 14,
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  margin: EdgeInsets.all(20),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -8,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        //the click center
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: -1,
                            boxShape: NeumorphicBoxShape.circle(),
                          ),
                          margin: EdgeInsets.all(65),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Stack(
                            children: <Widget>[
                              //those childs are not "good" for a real clock, but will fork for a sample
                              Align(
                                alignment: Alignment.topCenter,
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment(-0.5, -0.5),
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment(0.5, -0.5),
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment(-0.5, 0.5),
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment(0.5, 0.5),
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: _createDot(context),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: _createDot(context),
                              ),
                              ClockView(
                                size: MediaQuery.of(context).size.height / 4,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryTextColor,
                      fontSize: 24),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: CustomColors.primaryTextColor,
                    ),
                    SizedBox(width: 16),
                    Text(
                      timeZoneName + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: CustomColors.primaryTextColor,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDot(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          depth: -10,
          boxShape: NeumorphicBoxShape.circle(),
          color: CustomColors.sdShadowColor),
      child: SizedBox(
        height: 10,
        width: 10,
      ),
    );
  }
}

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  late Timer timer;

  @override
  void initState() {
    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var perviousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute)
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('=====>digital clock updated');
    return Text(
      formattedTime,
      style: TextStyle(
          fontWeight: FontWeight.w900,
          color: CustomColors.primaryTextColor,
          fontSize: 64),
    );
  }
}
