import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Theme
const Color primary = Color(0xff91DDCF);
const Color secondary = Color(0xffF7F9F2);

// Text
const Color primaryText = Color(0xff35374B);
const Color secondaryText = Color(0xff595959);

// TextTheme
var textTheme = const TextTheme(
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontFamily: "League_Spartan",
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: "League_Spartan",
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: "League_Spartan",
  ),
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "LibreBaskerville",
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: "LibreBaskerville",
  ),
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontFamily: "LibreBaskerville",
  ),
);

var statusBarLight = const SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
);

var statusBarDark = const SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  statusBarColor: Colors.transparent,
);

// light theme -----------------------------------------------------------------
var lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: statusBarLight,
    ));

// darkTheme -------------------------------------------------------------------
var darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: statusBarDark,
    ));
