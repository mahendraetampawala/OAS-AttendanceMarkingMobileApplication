import 'package:flutter/material.dart';

class ComponentThemes {
  static InputDecoration getInputDecoration({
    BuildContext? context,
    String? labelText,
    String? hintText,
    Icon? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      hintText: hintText,
      // ignore: unnecessary_null_comparison
      prefixIcon: prefixIcon == null
          ? SizedBox(
              width: 0,
              height: 0,
            )
          : prefixIcon,
      suffixIcon: suffixIcon == null
          ? SizedBox(
              width: 0,
              height: 0,
            )
          : suffixIcon,
    );
  }

  static TextStyle largeButtonTextStyle({
    @required BuildContext? context,
  }) {
    return TextStyle(
      fontSize: 20,
    );
  }

  static TextStyle headerTextStyle({
    @required BuildContext? context,
  }) {
    return TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }
}
