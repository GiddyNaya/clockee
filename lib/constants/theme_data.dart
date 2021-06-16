import 'package:flutter/material.dart';

class CustomColors {
  static Color primaryTextColor = Color(0xFF393F74); //Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = Color(0xFF2D2F41);
  static Color navBackgroundColor = Color(0x9D2D2F41);
  static Color menuBackgroundColor = Color(0xFF242634);
  static Color accentColor = Color(0xFFC279FB);

  static Color clockBG = Color(0x00CDD1D1); // Color(0xFF444974);
  static Color clockOutline = Color(0x00CDD1D1);
  static Color secHandColor = Colors.orange[300]!;
  static Color minHandStatColor = Color(0xFF748EF6);
  static Color minHandEndColor = Color(0xFF77DDFF);
  static Color hourHandStatColor = Color(0xFFC279FB);
  static Color hourHandEndColor = Color(0xFFEA74AB);

  static Color sdTextPrimaryColor = Color(0xFF000000);
  static Color sdTextSecondaryColor = Color(0xFF4D4C4C);

  static Color sdPrimaryColor = Color(0xFF393F74);
  static Color sdPrimaryColorLight = Color(0xFF6679CC);
  static Color sdPrimaryBgLightColor = Color(0xFFE2D4F5);
  static Color sdSecondaryColorRed = Color(0xFFFF5C5C);
  static Color sdSecondaryColorYellow = Color(0xFFFFA635);
  static Color sdSecondaryColorGreen = Color(0xFF5DE094);
  static Color sdIconColor = Color(0xFFA6A7AA);
  static Color sdSmokeColorLight = Color(0xFFE8EAEE);
  static Color sdSmokeColor = Color(0xFFCDD1D1);
  static Color sdShadowColor = Color(0x95E9EBF0);
  static Color sdShadowDarkColor = Color(0x95A3A3A5);
  static Color sdAppBackgroundColor = Color(0xFFE3E6E9);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}

class CustomFontSize {
  static double textSizeSmall = 12.0;
  static double textSizeSMedium = 14.0;
  static double textSizeMedium = 16.0;
  static double textSizeLargeMedium = 18.0;
  static double textSizeNormal = 20.0;
  static double textSizeLarge = 24.0;
  static double textSizeXLarge = 30.0;
  static double textSizeXXLarge = 35.0;
}
