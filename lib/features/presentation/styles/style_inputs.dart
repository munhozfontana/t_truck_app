import 'package:flutter/material.dart';

class StyleInputs {
  static InputDecoration get inputDecorationLogin => InputDecoration(
        hintText: "Código motorista",
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
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(12.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(12.0),
        ),
      );
}
