import 'package:flutter/material.dart';

class ThemeColors {
  static const Map<int, Color> _primaryColor = {
    50: Color.fromRGBO(123, 47, 230, .1),
    100: Color.fromRGBO(123, 47, 230, .2),
    200: Color.fromRGBO(123, 47, 230, .3),
    300: Color.fromRGBO(123, 47, 230, .4),
    400: Color.fromRGBO(123, 47, 230, .5),
    500: Color.fromRGBO(123, 47, 230, .6),
    600: Color.fromRGBO(123, 47, 230, .7),
    700: Color.fromRGBO(123, 47, 230, .8),
    800: Color.fromRGBO(123, 47, 230, .9),
    900: Color.fromRGBO(123, 47, 230, 1),
  };

  static const Map<int, Color> _titleHeaderBackgroundColor = {
    50: Color.fromRGBO(247, 247, 247, .1),
    100: Color.fromRGBO(247, 247, 247, .2),
    200: Color.fromRGBO(247, 247, 247, .3),
    300: Color.fromRGBO(247, 247, 247, .4),
    400: Color.fromRGBO(247, 247, 247, .5),
    500: Color.fromRGBO(247, 247, 247, .6),
    600: Color.fromRGBO(247, 247, 247, .7),
    700: Color.fromRGBO(247, 247, 247, .8),
    800: Color.fromRGBO(247, 247, 247, .9),
    900: Color.fromRGBO(247, 247, 247, 1),
  };

  static MaterialColor getPrimaryColor() =>
      MaterialColor(0xFF7B2FE6, _primaryColor);

  static MaterialColor getTitleHeaderBackgroundColor() =>
      MaterialColor(0xF7F7F7, _titleHeaderBackgroundColor);
}
