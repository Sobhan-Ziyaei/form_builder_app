import 'package:flutter/material.dart';
import 'package:form_builder_app/gen/fonts.gen.dart';
import 'package:form_builder_app/ui/constants/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: FontFamily.sahel,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontFamily: FontFamily.sahel,
        fontSize: 20,
        color: blackColor,
      ),
      bodySmall: TextStyle(
        fontFamily: FontFamily.sahel,
        fontSize: 15,
        color: whiteColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.sahel,
        fontSize: 20,
        color: whiteColor,
      ),
    ),
  );
}
