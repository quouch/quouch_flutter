part of 'app_theme.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  TextStyle get header1 => getStyle(
      isHeader: true, fontSize: 69, fontWeight: FontWeight.w900, height: 1.2);

  TextStyle get header2 => getStyle(
      isHeader: true, fontSize: 48, fontWeight: FontWeight.w700, height: 1.2);

  TextStyle get header3 => getStyle(
      isHeader: true,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      height: 1.3,
      letterSpacing: 1);

  TextStyle get header4 => getStyle(
      isHeader: true,
      fontSize: 23,
      fontWeight: FontWeight.w600,
      height: 1.4,
      letterSpacing: 3);

  TextStyle get header5 => getStyle(
      isHeader: true,
      fontSize: 19,
      fontWeight: FontWeight.w600,
      height: 1.4,
      letterSpacing: 5);

  TextStyle get body1 =>
      getStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 1);

  TextStyle get body2 =>
      getStyle(fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 2);

  TextStyle get body3 => getStyle(fontSize: 14);

  TextStyle get caption =>
      getStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 6);

  TextStyle get buttonLarge =>
      getStyle(fontSize: 16, fontWeight: FontWeight.w700);

  TextStyle get buttonMedium =>
      getStyle(fontSize: 14, fontWeight: FontWeight.w600);

  TextStyle get buttonSmall => getStyle(fontSize: 14);

  TextStyle get buttonExtraSmall => getStyle(fontSize: 12);

  @override
  ThemeExtension<AppTextTheme> copyWith(
      {TextStyle? header1,
      TextStyle? header2,
      TextStyle? header3,
      TextStyle? header4,
      TextStyle? header5,
      TextStyle? body1,
      TextStyle? body2,
      TextStyle? body3,
      TextStyle? caption,
      TextStyle? buttonLarge,
      TextStyle? buttonMedium,
      TextStyle? buttonSmall,
      TextStyle? buttonExtraSmall}) {
    return AppTextTheme();
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
      covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme();
  }

  TextStyle getStyle({
    bool isHeader = false,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height,
  }) {
    var fontFamily = isHeader ? GoogleFonts.outfit() : GoogleFonts.mulish();

    return TextStyle(
      fontFamily: fontFamily.fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}

class TextThemeFactory {
  factory TextThemeFactory() {
    // Headers - use Outfit font
    var displayLarge = AppTextTheme().header1;
    var displayMedium = AppTextTheme().header2;
    var displaySmall = AppTextTheme().header3;
    var headlineLarge = AppTextTheme().header4;
    var headlineMedium = AppTextTheme().header5;

    // Body - use Mulish font
    var bodyLarge = AppTextTheme().body1;
    var bodyMedium = AppTextTheme().body2;
    var bodySmall = AppTextTheme().body3;
    var labelSmall = AppTextTheme().caption;

    var textVariants = GoogleFonts.mulishTextTheme().copyWith(
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
    return TextThemeFactory._internal(textVariants);
  }

  TextThemeFactory._internal(this.theme);

  late final TextTheme theme;
}
