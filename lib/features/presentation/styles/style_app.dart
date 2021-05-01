import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const primary = Color(0xff4f5262);
const secondary = Color(0xff6c6c6c);

class StyleApp {
  static TextStyle get h1 => const TextStyle(
        letterSpacing: 1.1,
        color: primary,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 22.0,
        height: 1.3,
      );

  static TextStyle get h2 => const TextStyle(
        color: secondary,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 20,
      );

  static TextStyle get h3 => const TextStyle(
        color: secondary,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 18.0,
      );

  static TextStyle get h4 => const TextStyle(
        letterSpacing: .7,
        color: Color(0xff6c6c6c),
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      );

  static TextStyle get h4_w500 => const TextStyle(
        letterSpacing: .7,
        color: Color(0xff6c6c6c),
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      );

  static InputDecoration get inputDecorationLogin => InputDecoration(
        prefixIcon: Opacity(
          opacity: 0.4000000059604645,
          child: Container(
            child: const Icon(
              Icons.lock_outline,
              color: Color.fromRGBO(8, 14, 49, 1),
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
      );
}
