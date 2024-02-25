import 'package:flutter/material.dart';

class MyThemeData {
  static ThemeData myThemeLight = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      color: Color(0xFF39A552),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24))),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF39A552),
      primary: const Color(0xFF39A552),
    ),
    useMaterial3: true,
  );
}
