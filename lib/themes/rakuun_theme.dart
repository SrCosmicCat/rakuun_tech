import 'package:flutter/material.dart';

final ThemeData rakuunTheme = ThemeData(
    canvasColor: Color.fromRGBO(253, 248, 254, 1.0),
    fontFamily: 'Inter',
    primaryColor: const Color.fromRGBO(13, 51, 93, 1.0),
    highlightColor: const Color.fromRGBO(29, 145, 195, 1.0),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
      headlineMedium: TextStyle(
        fontFamily: 'LeagueSpartan-SemiBold',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(253, 248, 254, 1.0),
      ),
      bodyMedium: TextStyle(fontSize: 15.0),
      labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(29, 145, 195, 1.0),
      ),
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
          shadowColor: Colors.blueGrey.shade100,
          elevation: 3,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          foregroundColor: const Color.fromRGBO(253, 248, 254, 1.0),
          backgroundColor: const Color.fromRGBO(13, 51, 93, 1.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: const Size(double.infinity, 50)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: Color.fromRGBO(29, 145, 195, 1.0),
          ),
          shadowColor: Colors.blueGrey.shade100,
          elevation: 3,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          foregroundColor: const Color.fromRGBO(29, 145, 195, 1.0),
          backgroundColor: Color.fromRGBO(253, 248, 254, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: Color.fromRGBO(29, 145, 195, 1.0),
              )),
          minimumSize: Size(double.infinity, 50)),
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: MaterialStateProperty.all(
        Color.fromRGBO(253, 248, 254, 1.0),
      ),
      side: MaterialStateProperty.all(BorderSide(
        width: 2,
        color: Color.fromRGBO(29, 145, 195, 1.0),
      )),
      
    ),
    );
