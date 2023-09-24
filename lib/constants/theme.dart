import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // background Color as per Weather Condition
  static const Color sunnyColor = Color(0xff3eabe4);
  static const Color rainyColor = Color(0xff5f859a);
  static const Color stormyColor = Color(0xff5f859a);

  // Text Styles
  static TextStyle temperature = GoogleFonts.overpass(
      textStyle: const TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ));
  static const TextStyle date = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const TextStyle condition = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const TextStyle attributes = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xff444E72),
  );
}
