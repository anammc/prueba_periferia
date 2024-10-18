import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_peliculas/styles/styles/custom_theme.dart';

class FontStyles{

  static title({Color? colorText,double? fontSize}){
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 18.0,
      fontWeight: FontWeight.w500,
      color: colorText ?? CustomTheme().colors.black,
    );
  }
  static subTitle({Color? colorText}){
    return GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: colorText ?? CustomTheme().colors.black,
    );
  }
  static texto({Color? colorText}){
    return GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: colorText ?? CustomTheme().colors.black,
    );
  }
}