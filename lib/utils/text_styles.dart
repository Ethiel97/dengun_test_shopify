import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin TextStyles {
  static TextStyle get textStyle => GoogleFonts.sora(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Colors.blueGrey,
        decoration: TextDecoration.none,
      );

  static TextStyle get secondaryTextStyle => GoogleFonts.epilogue(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      );
}
