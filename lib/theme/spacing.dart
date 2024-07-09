import 'package:flutter/material.dart';
import 'dart:ui';

class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    this.xs = 8,
    this.sm = 12,
    this.md = 16,
    this.lg = 24,
    this.xl = 32,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double thin = 2;
  final double line = 1;

  @override
  AppSpacing copyWith({
    double? standard,
    double? xs,
    double? sm,
    double? lg,
    double? xl,
  }) {
    var md = standard ?? 16;
    return AppSpacing(
        md: md,
        xs: xs ?? md * 0.5,
        sm: sm ?? md * 0.75,
        lg: lg ?? md * 1.5,
        xl: xl ?? md * 2);
  }

  @override
  ThemeExtension<AppSpacing> lerp(
      covariant ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) {
      return this;
    }
    return AppSpacing(
        md: lerpDouble(md, other.md, t)!,
        xs: lerpDouble(xs, other.xs, t)!,
        sm: lerpDouble(sm, other.sm, t)!,
        lg: lerpDouble(lg, other.lg, t)!,
        xl: lerpDouble(xl, other.xl, t)!);
  }

  findByKey(String size) {
    switch (size) {
      case 'xs':
        return xs;
      case 'sm':
        return sm;
      case 'md':
        return md;
      case 'lg':
        return lg;
      case 'xl':
        return xl;
    }
  }
}
