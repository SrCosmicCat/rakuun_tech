import 'package:flutter/material.dart';

final ThemeData rakuunTheme = ThemeData(
  fontFamily: 'Inter',
  primaryColor: const Color.fromRGBO(13, 51, 93, 1.0),
  highlightColor:  const Color.fromRGBO(29, 145, 195, 1.0),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, ),
    headlineMedium: TextStyle(
        fontFamily: 'LeagueSpartan',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    bodyMedium: TextStyle(fontSize: 15.0),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Color.fromRGBO(13, 51, 93, 1.0),
    )),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(29, 145, 195, 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size(double.infinity, 50)),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
        foregroundColor: const Color.fromRGBO(13, 51, 93, 1.0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(double.infinity, 50)),
  ),
);
