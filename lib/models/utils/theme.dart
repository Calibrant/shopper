
import 'package:flutter/material.dart';

final kDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(),
);

final kLightTheme = ThemeData(colorScheme: ColorScheme.fromSwatch()).copyWith(
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    color: Color(0xFF0C40A6),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xff0C40A6),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
      ),
    ),
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff212121),
    ),
    subtitle2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Color(0xff212121),
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Color(0xff363636),
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff363636),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Color(0xFF0C40A6),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF0C40A6),
    selectedIconTheme: IconThemeData(size: 30),
  ),
  iconTheme: const IconThemeData(
    size: 18,
    color: Color(0xFFECB800),
  ),
);
