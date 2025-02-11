import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

/// Custom Theme for the app
/// Color Palette: https://colorhunt.co/palette/053b50176b8764ccc5eeeeee
/// - Darkest: `0xFF053B50`
/// - Dark: `0xFF176B87`
/// - Medium: `0xFF64CCC5`
/// - Light: `0xFFEEEEEE`
class CustomAppTheme {
  static final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,

    // Define color scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: const Color(0xFFE5E8E8),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 15.0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: TextStyle(fontSize: Constants.kToolbarTextStyle),
      titleTextStyle: TextStyle(fontSize: Constants.kTitleTextStyle),
      actionsIconTheme: IconThemeData(
        size: Constants.kActionsIconThemeIconSize,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        weight: 900.0,
        fill: 1.0,
        color: Colors.white,
      ),
      elevation: 4,
      centerTitle: true,
      backgroundColor: Color(0xFF176B87),
      foregroundColor: Colors.white,
    ),

    // Text Theme
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.roboto(
        fontSize: Constants.kBodyLargeFontSize,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: Constants.kBodyMediumFontSize,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: Constants.kBodySmallFontSize,
        color: Colors.white,
      ),
      displayLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: Constants.kDisplayLargeFontSize,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: Constants.kDisplayMediumFontSize,
        color: Color(0xFF053B50),
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: Constants.kDisplaySmallFontSize,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: Constants.kTitleLargeFontSize,
        color: Color(0xFFE0C766),
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: Constants.kTitleMediumFontSize,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: Constants.kTitleSmallFontSize,
        color: Color(0xFF176B87),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
    ),

    // ListTile Theme
    listTileTheme: ListTileThemeData(
      textColor: Colors.white,
      titleTextStyle: GoogleFonts.roboto(color: Colors.white),
      subtitleTextStyle: GoogleFonts.roboto(color: Color(0xFFEEEEEE)),
      tileColor: Color(0xFF053B50),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      size: Constants.kIconThemeIconSize,
      color: Colors.white,
    ),

    // Icon Button Theme
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        iconSize: WidgetStateProperty.all<double>(30.0),
        elevation: WidgetStateProperty.all<double>(16.0),
      ),
    ),
  );
}
