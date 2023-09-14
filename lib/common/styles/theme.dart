import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youapp_test/common/styles.dart';

ThemeData tdMain(BuildContext context) => ThemeData(
  primarySwatch: mPrimary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: hBlack,
  unselectedWidgetColor: Colors.grey,
  textTheme: GoogleFonts.nunitoTextTheme(
    Theme.of(context).textTheme.apply(
      bodyColor: hBlack,
      displayColor: hBlack,
    ),
  ),
  primaryColor: hPrimary2,
  colorScheme: ColorScheme.dark(primary: hPrimary2),
  primaryColorDark: hPrimary2,
  appBarTheme: AppBarTheme(
    color: hBlack,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 10,
    ),
    labelStyle: const TextStyle(color: Colors.black),
    hintStyle: const TextStyle(color: Colors.black),
    hoverColor: Colors.black,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
);

