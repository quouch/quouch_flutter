import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  factory AppTextTheme(baseTheme) {
    var textTheme = GoogleFonts.mulishTextTheme(baseTheme.textTheme).copyWith(
      headlineSmall:
          GoogleFonts.outfitTextTheme(baseTheme.textTheme).headlineSmall,
      headlineMedium:
          GoogleFonts.outfitTextTheme(baseTheme.textTheme).headlineMedium,
      headlineLarge:
          GoogleFonts.outfitTextTheme(baseTheme.textTheme).headlineLarge,
    );
    return AppTextTheme._internal(textTheme);
  }

  AppTextTheme._internal(this.theme);

  late final TextTheme theme;
}
