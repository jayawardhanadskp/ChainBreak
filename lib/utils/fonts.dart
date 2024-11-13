import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle large(Color color) =>
      GoogleFonts.bebasNeue(fontSize: 32, fontWeight: FontWeight.w600);
  static TextStyle headings(Color color) =>
      GoogleFonts.bebasNeue(fontSize: 32, fontWeight: FontWeight.w600);

  static TextStyle  normal(Color color) => GoogleFonts.poppins(fontSize: 15);
  static TextStyle  normalWhite(Color color) => GoogleFonts.poppins(fontSize: 15, color: Colors.white);

  static TextStyle  normalSmall(Color color) => GoogleFonts.poppins(fontSize: 14);
}
