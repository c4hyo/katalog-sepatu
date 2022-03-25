import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Colors.teal;
EdgeInsets paddingList = EdgeInsets.fromLTRB(20, 10, 20, 10);

final listWarnaSepatu = [
  "hitam",
  "putih",
  "biru",
  "merah",
  "hijau",
  "kuning",
  "jingga",
  "abu-abu",
];

Color getWarnaSepatu(String warna) {
  if (warna == "hitam") {
    return Colors.black;
  } else if (warna == "putih") {
    return Colors.white;
  } else if (warna == "biru") {
    return Colors.blue;
  } else if (warna == "merah") {
    return Colors.red;
  } else if (warna == "kuning") {
    return Colors.yellow;
  } else if (warna == "jingga") {
    return Colors.orange;
  } else if (warna == "abu-abu") {
    return Colors.grey;
  } else if (warna == "hijau") {
    return Colors.green;
  } else {
    return Colors.black;
  }
}

ButtonStyle borderButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
  textStyle: MaterialStateProperty.all(TextStyle(
    color: primaryColor,
  )),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primaryColor)),
  ),
);

ThemeData tema = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: primaryColor,
      ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    splashColor: Colors.tealAccent,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: GoogleFonts.kaushanScript(
      fontWeight: FontWeight.bold,
      color: Colors.white,
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
