part of 'app_theme.dart';

class AppTextTheme {
  factory AppTextTheme() {
    var textTheme = GoogleFonts.mulishTextTheme().copyWith(
      headlineSmall: GoogleFonts.outfitTextTheme().headlineSmall,
      headlineMedium: GoogleFonts.outfitTextTheme().headlineMedium,
      headlineLarge: GoogleFonts.outfitTextTheme().headlineLarge,
    );
    return AppTextTheme._internal(textTheme);
  }

  AppTextTheme._internal(this.theme);

  late final TextTheme theme;
}
