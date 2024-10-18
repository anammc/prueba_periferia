import 'package:flutter/material.dart';

abstract class ThemeStructure {
  ColorsTheme get colors;
}

class ColorsTheme {
  final Color darkPurple;
  final Color lightPurple;
  final Color white;
  final Color black;

  const ColorsTheme({
    required this.darkPurple,
    required this.lightPurple,
    required this.white,
    required this.black,
  });
}