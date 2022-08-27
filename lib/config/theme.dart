import 'package:flutter/material.dart';

/// [lightTheme] Defines LIGHT theme color scheme.
ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
      color: Color(0xff672CBC),
    )),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    textTheme: _textLightTheme(),
    colorScheme: _colorSchemeLightTheme(),
  );
}

TextTheme _textLightTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      height: 1.75,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}

ColorScheme _colorSchemeLightTheme() {
  return const ColorScheme(
    primary: Color(0xff672CBC),
    secondary: Color(0xff672CBC),
    primaryContainer: Color(0xffF9B091),
    secondaryContainer: Colors.purpleAccent,
    tertiaryContainer: Color(0x89f6ea63),
    onTertiaryContainer: Color(0xff854503),
    background: Color(0xf2f8f8f8),
    surface: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    brightness: Brightness.light,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    onSurface: Colors.purple,
  );
}

/// [darkTheme] Defines DARK theme color scheme.
ThemeData darkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    scaffoldBackgroundColor: const Color(0xFF091945),
    fontFamily: 'Poppins',
    textTheme: _textdarkTheme(),
    colorScheme: _colorSchemedarkTheme(),
  );
}

TextTheme _textdarkTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      height: 1.75,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}

ColorScheme _colorSchemedarkTheme() {
  return const ColorScheme(
    primary: Colors.white,
    secondary: Color(0xff672CBC),
    primaryContainer: Color(0xffF9B091),
    secondaryContainer: Colors.purpleAccent,
    tertiaryContainer: Color(0x89f6ea63),
    onTertiaryContainer: Color(0xff854503),
    background: Colors.black,
    surface: Color(0xFF091945),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    brightness: Brightness.dark,
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    onSurface: Colors.white,
  );
}
