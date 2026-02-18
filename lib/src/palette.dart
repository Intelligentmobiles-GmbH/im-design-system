import 'package:flutter/material.dart';

/// Raw color constants for the design system.
///
/// These tokens should never be accessed directly in widgets.
/// Use [AppColors] via [ThemeExtension] and `context.colors` instead.
@immutable
class DesignSystemPalette {
  const DesignSystemPalette({
    required this.background,
    required this.foreground,
    required this.card,
    required this.primary,
    required this.primaryGlow,
    required this.destructive,
    required this.success,
    required this.warning,
    required this.info,
  });

  final Color background;
  final Color foreground;
  final Color card;
  final Color primary;
  final Color primaryGlow;
  final Color destructive;
  final Color success;
  final Color warning;
  final Color info;

  /// Default light mode palette.
  factory DesignSystemPalette.defaultLight() => const DesignSystemPalette(
        background: Color(0xFFFAFAFA),
        foreground: Color(0xFF0A0A0B),
        card: Color(0xFFFFFFFF),
        primary: Color(0xFF8B5CF6),
        primaryGlow: Color(0xFFA78BFA),
        destructive: Color(0xFFEF4444),
        success: Color(0xFF16A34A),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF0EA5E9),
      );

  /// Default dark mode palette.
  factory DesignSystemPalette.defaultDark() => const DesignSystemPalette(
        background: Color(0xFF020617),
        foreground: Color(0xFFF8FAFC),
        card: Color(0xFF1E293B),
        primary: Color(0xFFA78BFA),
        primaryGlow: Color(0xFFA78BFA),
        destructive: Color(0xFF7F1D1D),
        success: Color(0xFF15803D),
        warning: Color(0xFFB45309),
        info: Color(0xFF0284C7),
      );

  DesignSystemPalette copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? primary,
    Color? primaryGlow,
    Color? destructive,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    return DesignSystemPalette(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      primary: primary ?? this.primary,
      primaryGlow: primaryGlow ?? this.primaryGlow,
      destructive: destructive ?? this.destructive,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }
}
