part of 'app_theme.dart';

TextStyle? outfitStyle(double fontSize, fontWeight) {
  return GoogleFonts.outfitTextTheme().displayMedium?.copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
}

TextStyle? mulishStyle(double fontSize, fontWeight) {
  return GoogleFonts.mulishTextTheme().bodyMedium?.copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
}

class AppTextTheme {
  factory AppTextTheme() {
    // Headers - use Outfit font
    var displayLarge = outfitStyle(69, FontWeight.w900); // Header-1
    var displayMedium = outfitStyle(48, FontWeight.w700); // Header-2
    var displaySmall = outfitStyle(40, FontWeight.w600); // Header-3
    var headlineLarge = outfitStyle(23, FontWeight.w600); // Header-4
    var headlineMedium = outfitStyle(19, FontWeight.w600); // Header-5

    // Body - use Mulish font
    var bodyLarge = mulishStyle(16, FontWeight.w400); // Body-1
    var bodyMedium = mulishStyle(14, FontWeight.w800); // Body-2
    var bodySmall = mulishStyle(14, FontWeight.w500); // Body-3
    var labelSmall = mulishStyle(12, FontWeight.w400); // Caption

    var textTheme = GoogleFonts.mulishTextTheme().copyWith(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineMedium: headlineMedium,
      headlineLarge: headlineLarge,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelSmall: labelSmall,
    );
    return AppTextTheme._internal(textTheme);
  }

  AppTextTheme._internal(this.theme);

  late final TextTheme theme;
}
