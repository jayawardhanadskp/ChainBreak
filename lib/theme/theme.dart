import 'package:chain_break/utils/fonts.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    tertiary: Color(0xFFBFECFFF),
    primary: Color(0xFFFFF6E3),
    onPrimary: Color(0xFFCDC1FF),
    secondary: Color(0xFFFFCCEA),
    onSecondary: Colors.black

  ),
  textTheme: TextTheme(
    displayLarge: Fonts.headings(const Color(0xFF1B1F24)),
    headlineLarge: Fonts.normal(const Color(0xFF1B1F24)),
    displayMedium: Fonts.normalWhite(const Color(0xFF1B1F24)),
    bodyMedium: Fonts.normalSmall(const Color(0xFF1B1F24)),
    // titleSmall: Fonts.popinsGrey16(const Color(0xFF1B1F24)),
    // titleMedium: Fonts.bebasWhiteBoaldUnderline16(const Color(0xFF1B1F24))
  )
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black45,
    tertiary: Color(0xFF2A0944),
    primary: Color(0xFFFEC260),
    onPrimary: Color(0xFF3B185F),
    secondary: Color(0xFFA12568),
    onSecondary: Colors.white
  ),
  textTheme: TextTheme(
    displayLarge: Fonts.headings(const Color(0xFFC0C0C0)),
    headlineLarge: Fonts.normal(const Color(0xFFC0C0C0)),
    displayMedium: Fonts.normalWhite(const Color(0xFFC0C0C0)),
    bodyMedium: Fonts.normalSmall(const Color(0xFFFFFFFF)),
    // titleSmall: Fonts.popinsGrey16(const Color(0xFF1B1F24)),
    // titleMedium: Fonts.bebasWhiteBoaldUnderline16(const Color(0xFF1B1F24))
  )
);
