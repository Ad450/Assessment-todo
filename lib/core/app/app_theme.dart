import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
//#FF63EB

class AppTheme {
  final lightTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: Colors.lightBlue.shade500,
      brightness: Brightness.light,
      onPrimary: HexColor("#FF63EB"),
      secondary: const Color.fromRGBO(48, 0, 48, 1),
      onSecondary: const Color.fromARGB(100, 6, 12, 47),
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.white,
      surface: Colors.black54,
      onSurface: Colors.grey.withOpacity(0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.pink),
        elevation: const MaterialStatePropertyAll<double>(2.0),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
        gapPadding: 3.0,
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2),
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.lato(color: Colors.pink, fontSize: 35),
      displaySmall: GoogleFonts.handlee(fontSize: 35),
      titleLarge: GoogleFonts.lato(color: Colors.black87),
      bodySmall: GoogleFonts.lato(color: Colors.black54),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(color: Colors.pink, weight: 10),
      unselectedIconTheme: IconThemeData(color: Colors.grey.withOpacity(0.4), weight: 10),
      selectedItemColor: Colors.pink,
    ),
  );

  final darkTheme = ThemeData();
  final genericBlackColor = Colors.black87;
  final genericWhiteColor = Colors.white60;
  final blackShade87 = Colors.black87;
  final blackShade54 = Colors.black54;
  final genericGrey = Colors.grey.withOpacity(0.2);

  ThemeData getTheme(Brightness brightness) => brightness == Brightness.light ? lightTheme : darkTheme;
}
