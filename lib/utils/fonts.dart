import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle get headings =>
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle get normal => GoogleFonts.poppins(fontSize: 15);
  static TextStyle get normalWhite => GoogleFonts.poppins(fontSize: 15, color: Colors.white);

  static TextStyle get normalSmall => GoogleFonts.poppins(fontSize: 14);
}
