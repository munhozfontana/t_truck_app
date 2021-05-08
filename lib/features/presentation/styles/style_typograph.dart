import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleTypograph {
  static TextStyle get h1 => const TextStyle(
        letterSpacing: 1.1,
        // color: primary,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 22.0,
        height: 1.3,
      );

  static TextStyle get h2 => const TextStyle(
        // color: secondary,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 20,
      );

  static TextStyle get h3 => const TextStyle(
        // color: secondary,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 18.0,
      );

  static TextStyle get h4 => const TextStyle(
        letterSpacing: .7,
        // color: secondary,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      );

  static TextStyle get h4_w500 => const TextStyle(
        letterSpacing: .7,
        // color: secondary,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      );

  static TextStyle get h4_w500_tertiary => TextStyle(
      letterSpacing: .7,
      // color: tertiary,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 16.0);
}
