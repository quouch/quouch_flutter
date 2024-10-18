import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'buttons_theme.dart';

part 'spacing.dart';

part 'text_theme.dart';

class AppThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    var textTheme = TextThemeFactory().theme;

    return ThemeData(
      colorScheme: colorScheme,
      extensions: [AppSpacing(), AppButtonsTheme(), AppTextTheme()],
      textTheme: textTheme,
      bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.primary1,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary1,
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.neutral1,
        filled: true,
        labelStyle: AppTextTheme().body1.copyWith(color: AppColors.gray3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppButtonsTheme().primary.copyWith(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
              minimumSize: WidgetStateProperty.all(Size(100, 40)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: AppButtonsTheme().primaryLink,
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    tertiary: AppColors.tertiary,
    onTertiary: Colors.black,
    error: AppColors.error,
    onError: AppColors.errorText,
    surface: AppColors.neutral3,
    onSurface: AppColors.darkText,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xfffb5705),
    onPrimary: Color(0xff55200b),
    secondary: Color(0xff8728a1),
    onSecondary: Color(0xff442a21),
    tertiary: Color(0xffd6c68e),
    onTertiary: Color(0xff393005),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    surface: Color(0xff1a110f),
    onSurface: Color(0xfff1dfd9),
    brightness: Brightness.dark,
  );
}

class AppColors {
  static const neutral1 = Color(0xFFFEFEFD);
  static const neutral2 = Color(0xFFFEFBFA);
  static const neutral3 = Color(0xFFFFF7F0);

  static const gray1 = Color(0xFFEFEFEF);
  static const gray2 = Color(0xFFDFDFDF);
  static const gray3 = Color(0xFFC1C1C1);
  static const gray4 = Color(0xFFA5A5A5);
  static const gray5 = Color(0xFF6F6F6F);
  static const gray6 = Color(0xFF333333);
  static const gray7 = Color(0xFF171717);
  static const darkText = AppColors.gray6;

  static const primary1 = Color(0xFFFFEEE5);
  static const primary2 = Color(0xFFFDBC9B);
  static const primary3 = Color(0xFFFC8950);
  static const primary4 = Color(0xFFFB5705);
  static const primary5 = Color(0xFFBF4305);
  static const primary = AppColors.primary4;

  static const secondary1 = Color(0xFFF3EAF6);
  static const secondary2 = Color(0xFFCFA9DA);
  static const secondary3 = Color(0xFFAB69BE);
  static const secondary4 = Color(0xFF8728A1);
  static const secondary5 = Color(0xFF631D76);
  static const secondary = AppColors.secondary4;

  static const tertiary1 = Color(0xFFFEFAE6);
  static const tertiary2 = Color(0xFFFCED9D);
  static const tertiary3 = Color(0xFFFADF53);
  static const tertiary4 = Color(0xFFF8D109);
  static const tertiary5 = Color(0xFFD2B20A);
  static const tertiary = AppColors.tertiary4;

  static const error = Color(0xFFBA1A1A);
  static const errorContainer = Color(0xFFFFDAD6);
  static const errorText = Color(0xFF410002);
}
