part of 'app_theme.dart';

class AppButtonsTheme extends ThemeExtension<AppButtonsTheme> {
  ButtonStyle _base = ButtonStyle(
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    minimumSize: WidgetStateProperty.all(Size(100, 40)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  ButtonStyle _linkBase = ButtonStyle(
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    minimumSize: WidgetStateProperty.all(Size(100, 40)),
  );

  ButtonStyle get primary => _base.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primary2;
          }
          return AppColors.primary;
        }),
        foregroundColor: WidgetStateProperty.all(AppColors.neutral1),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return AppColors.primary5;
            }
            return null;
          },
        ),
      );

  ButtonStyle get primaryOutlined => _base.copyWith(
    backgroundColor: WidgetStateProperty.all(null),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primary2;
      }
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return AppColors.primary5;
      }
      return AppColors.primary;
    }),
    overlayColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColors.primary1;
        }
        return null;
      },
    ),
    side: WidgetStateProperty.resolveWith(
          (states) {
        var color = AppColors.primary;
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          color = AppColors.primary5;
        }
        return BorderSide(
          color: color,
          width: 1,
        );
      },
    ),
  );
  ButtonStyle get primaryLink => ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primary2;
          }
          if (states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.hovered)) return AppColors.primary5;

          return AppColors.primary;
        }),
      );

  ButtonStyle get secondary => _base.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.secondary2;
          }
          return AppColors.secondary;
        }),
        foregroundColor: WidgetStateProperty.all(AppColors.neutral1),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return AppColors.secondary5;
            }
            return null;
          },
        ),
      );

  ButtonStyle get secondaryOutlined => _base.copyWith(
        backgroundColor: WidgetStateProperty.all(null),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.secondary2;
          }
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.pressed)) {
            return AppColors.secondary5;
          }
          return AppColors.secondary;
        }),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return AppColors.secondary1;
            }
            return null;
          },
        ),
        side: WidgetStateProperty.resolveWith(
          (states) {
            var color = AppColors.secondary;
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              color = AppColors.secondary5;
            }
            return BorderSide(
              color: color,
              width: 1,
            );
          },
        ),
      );

  ButtonStyle get secondaryLink => ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray3;
          }
          return AppColors.secondary;
        }),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return AppColors.secondary1;
            }
            return null;
          },
        ),
      );

  ButtonStyle get neutralLink => _linkBase.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray3;
          }
          return AppColors.gray5;
        }),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return AppColors.gray1;
            }
            return null;
          },
        ),
      );

  TextStyle get buttonLarge => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  @override
  ThemeExtension<AppButtonsTheme> copyWith(
      {ButtonStyle? primary,
      ButtonStyle? primaryOutlined,
      ButtonStyle? primaryLink,
      ButtonStyle? secondary,
      ButtonStyle? secondaryOutlined,
      ButtonStyle? secondaryLink}) {
    return AppButtonsTheme();
  }

  @override
  ThemeExtension<AppButtonsTheme> lerp(
      covariant ThemeExtension<AppButtonsTheme>? other, double t) {
    if (other is! AppButtonsTheme) {
      return this;
    }
    return AppButtonsTheme();
  }
}
