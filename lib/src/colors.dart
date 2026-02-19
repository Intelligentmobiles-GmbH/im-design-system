import 'package:flutter/material.dart';
import 'palette.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color foreground;
  final Color card;
  final Color primary;
  final Color destructive;
  final Color success;
  final Color warning;
  final Color info;

  const AppColors({
    required this.background,
    required this.foreground,
    required this.card,
    required this.primary,
    required this.destructive,
    required this.success,
    required this.warning,
    required this.info,
  });

  /// ✅ Light preset
  factory AppColors.light() => const AppColors(
    background: AppPalette.background,
    foreground: AppPalette.foreground,
    card: AppPalette.card,
    primary: AppPalette.primary,
    destructive: AppPalette.destructive,
    success: AppPalette.success,
    warning: AppPalette.warning,
    info: AppPalette.info,
  );

  /// ✅ Dark preset
  factory AppColors.dark() => const AppColors(
    background: AppPalette.darkBackground,
    foreground: AppPalette.darkForeground,
    card: AppPalette.darkCard,
    primary: AppPalette.darkPrimary,
    destructive: AppPalette.darkDestructive,
    success: AppPalette.darkSuccess,
    warning: AppPalette.darkWarning,
    info: AppPalette.darkInfo,
  );

  @override
  AppColors copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? primary,
    Color? destructive,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    return AppColors(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      primary: primary ?? this.primary,
      destructive: destructive ?? this.destructive,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      card: Color.lerp(card, other.card, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}
