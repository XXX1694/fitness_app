import 'package:flutter/material.dart';
import 'package:tamos_family_club/common/theme/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColorDark: kPrimaryColor,
    secondaryHeaderColor: kPrimaryColor,
    primaryColorLight: kPrimaryColor,
    primaryColor: kPrimaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: defaultTextColor100,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: defaultTextColor100,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: defaultTextColor60,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: defaultTextColor100,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: defaultTextColor100,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Articulat',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: defaultTextColor80,
      ),
      labelLarge: const TextStyle(
        fontFamily: 'Articulat',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Articulat',
        color: defaultTextColor80,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Articulat',
        color: defaultTextColor60,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
