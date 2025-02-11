import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

/// Color scheme
/// https://colorhunt.co/palette/053b50176b8764ccc5eeeeee
/// darkest 0xFF053B50
/// dark 0xFF176B87
/// medium 0xFF64CCC5
/// light 0xFFEEEEEE
class AppThemeDataClass {
  String fontValue = 'GoogleFonts.roboto()';

  ThemeData getAppTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.roboto().fontFamily,

// Define the default brightness and colors.
      colorScheme: ColorScheme.fromSeed(
        // seedColor: const Color(0xFF176B87),
        seedColor: Colors.white,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          // fixedSize: Size(250.0, 75.0),
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
      scaffoldBackgroundColor: const Color(0xFFE5E8E8),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        filled: false,
        // fillColor: Colors.white,
        // fillColor: Color(0xFF053B50),
        fillColor: Color(0xFFFFFFFF),
        focusColor: Color(0xFFFFFFFF),
        hoverColor: Color(0xFFFFFFFF),
        prefixIconColor: Color(0xFFFFFFFF),
        prefixStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18.0,
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
          // fontSize: 18.0,
          color: Color(0xFFFFFFFF),
        ),
        helperStyle: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
      ),

      appBarTheme: const AppBarTheme(
        toolbarTextStyle: TextStyle(fontSize: Constants.kToolbarTextStyle),
        titleTextStyle: TextStyle(fontSize: Constants.kTitleTextStyle),
        actionsIconTheme: IconThemeData(
          size: Constants.kActionsIconThemeIconSize,
          weight: 400.0,
          fill: 1.0,
          color: Color(0xFFFFFFFF),
          opacity: 1.0,
        ),
        iconTheme: IconThemeData(
          // size: kIconThemeSize,
          weight: 900.0,
          fill: 1.0,
          // color: const Color(0xFF053B50),
          color: const Color(0xFFFFFFFF),
          opacity: 1.0,
        ),
        elevation: 4,
        centerTitle: true,
        backgroundColor: Color(0xFF176B87),
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: Constants.kBodyLargeFontSize,
          color: const Color(0xFFFFFFFF),
        ),
        bodyMedium: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: Constants.kBodyMediumFontSize,
          color: const Color(0xFF000000),
        ),
        bodySmall: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: Constants.kBodySmallFontSize,
          color: const Color(0xFFFFFFFF),
        ),
        displayLarge: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: Constants.kDisplayLargeFontSize,
          color: const Color(0xFFFFFFFF),
        ),
        displayMedium: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: Constants.kDisplayMediumFontSize,
          color: const Color(0xFF053B50),
        ),
        displaySmall: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: Constants.kDisplaySmallFontSize,
          color: const Color(0xFFFFFFFF),
        ),
        titleLarge: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: Constants.kTitleLargeFontSize,
          color: const Color(0xFFE0C766),
        ),
        titleMedium: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: Constants.kTitleMediumFontSize,
          color: const Color(0xFFFFFFFF),
        ),
        titleSmall: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: Constants.kTitleSmallFontSize,
          color: const Color(0xFF176B87),
        ),
      ),
      listTileTheme: ListTileThemeData(
        // dense: true,
        // visualDensity: const VisualDensity(vertical: -3, horizontal: -3),
        textColor: Colors.white,
        titleTextStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          // fontSize: fontSizeCalculator.calculateFontSize(context, 1.0),
          color: const Color(0xFFFFFFFF),
        ),
        subtitleTextStyle: GoogleFonts.roboto(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            // fontSize: fontSizeCalculator.calculateFontSize(context, 1.0),
            color: const Color(0xFFEEEEEE)),
        tileColor: const Color(0xFF053B50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(20.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),
      iconTheme: const IconThemeData(
        size: Constants.kIconThemeIconSize,
        fill: 1.0,
        color: Color(0xFFFFFFFF),
        // weight: 1.0,
        // opacity: 1.0,
      ),
      // iconButtonTheme: IconButtonThemeData(
      //   style: ButtonStyle(
      //     iconColor: MaterialStateProperty.all<Color>(Colors.white),
      //     iconSize: MaterialStateProperty.all<double>(30.0),
      //     elevation: MaterialStateProperty.all<double>(16.0),
      //   ),
      // ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          iconSize: WidgetStateProperty.all<double>(30.0),
          elevation: WidgetStateProperty.all<double>(16.0),
        ),
      ),
    );
  }
}
