import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Colors.teal;
EdgeInsets paddingList = EdgeInsets.fromLTRB(20, 10, 20, 10);

ThemeData tema = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: primaryColor,
      ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black87,
    ),
    titleTextStyle: GoogleFonts.kaushanScript(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
