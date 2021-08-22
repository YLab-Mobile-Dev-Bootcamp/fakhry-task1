import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFF15141F),
      fontFamily: 'Lato',
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFEF2D1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}