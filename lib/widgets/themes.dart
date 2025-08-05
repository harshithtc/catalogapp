import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
    ),
  );
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  //color
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color whiteish = Color.fromARGB(255, 255, 255, 255);
}
