import 'package:flutter/material.dart';

class ThemeApp {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff4b0082),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.indigo[50],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
          horizontal: 48,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white, fontSize: 45),
      titleSmall: TextStyle(color: Colors.white, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 35),
    ),
  );
}
