import 'package:flutter/material.dart';

class StyleInputs {
  static InputDecoration inputDecorationLogin({
    Icon? icon,
    String? placeholder,
    String? label,
  }) =>
      InputDecoration(
        hintText: placeholder,
        labelText: label,
        prefixIcon: Opacity(
          opacity: 0.4000000059604645,
          child: icon,
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
