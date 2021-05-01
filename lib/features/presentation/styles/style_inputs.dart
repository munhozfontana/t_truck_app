import 'package:flutter/material.dart';

class StyleInputs {
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
