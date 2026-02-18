import 'package:flutter/material.dart';

import 'palette.dart';

/// Semantic colors exposed via [ThemeExtension].
///
/// Access in widgets via `context.colors` (requires [ThemeX] extension).
@immutable
class AppColors extends ThemeExtension<AppColors> {
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

  final Color background;
  final Color foreground;
  final Color card;
  final Color primary;
  final Color destructive;
  final Color success;
  final Color warning;
  final Color info;

  /// Creates [AppColors] from a [DesignSystemPalette].
  factory AppColors.fromPalette(DesignSystemPalette palette) => AppColors(
        background: palette.background,
        foreground: palette.foreground,
        card: palette.card,
        primary: palette.primary,
        destructive: palette.destructive,
        success: palette.success,
        warning: palette.warning,
        info: palette.info,
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
