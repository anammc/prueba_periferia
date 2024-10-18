import 'package:flutter/material.dart';
import 'package:prueba_peliculas/styles/styles/theme.dart';

class CustomTheme implements ThemeStructure {
  @override
  final colors = const ColorsTheme(
      darkPurple: Color(0xff71479A),
      lightPurple: Color(0xffAF82BA),
      white: Color(0xffffffff),
      black: Color(0xff000000));
}
