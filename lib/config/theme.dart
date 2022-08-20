import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
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
    secondary: Color(0xff0f821a),
    primaryContainer: Color(0xffF9B091),
    secondaryContainer: Color.fromARGB(255, 67, 66, 66),
    tertiaryContainer: Color(0x89f6ea63),
    onTertiaryContainer: Color(0xff854503),
    background: Color(0xf2f8f8f8),
    surface: Colors.red,
    onPrimary: Color(0xff672CBC),
    onSecondary: Colors.white,
    brightness: Brightness.light,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    onSurface: Colors.purple,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Poppins',
    textTheme: _textdarkTheme(),
    colorScheme: _colorSchemedarkTheme(),
  );
}

TextTheme _textdarkTheme() {
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

ColorScheme _colorSchemedarkTheme() {
  return const ColorScheme(
    primary: Color(0xff672CBC),
    secondary: Color(0xff0f821a),
    primaryContainer: Color(0xffF9B091),
    secondaryContainer: Color.fromARGB(255, 67, 66, 66),
    tertiaryContainer: Color(0x89f6ea63),
    onTertiaryContainer: Color(0xff854503),
    background: Color(0xf2f8f8f8),
    surface: Colors.red,
    onPrimary: Color(0xff672CBC),
    onSecondary: Colors.white,
    brightness: Brightness.dark,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    onSurface: Colors.purple,
  );
}
