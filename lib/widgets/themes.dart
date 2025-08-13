import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: darkBluishColor),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
    ),
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkBluishColor,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: lightBluishColor),
    ),

    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
    ),
  );

  //color
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color whiteish = Color.fromARGB(255, 255, 255, 255);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.indigo500;
  static Color greyish = const Color.fromARGB(255, 187, 189, 200);
}
