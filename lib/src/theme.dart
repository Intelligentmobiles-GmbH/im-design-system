import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

/// Factory for creating [ThemeData] with the design system.
abstract final class AppTheme {
  AppTheme._();

  /// Creates a light [ThemeData] with the design system.
  static ThemeData light({
    AppColors? palette,
    TextTheme? textTheme,
    String fontFamily = 'IBMPlexSans',
  }) {
    final p = palette ?? AppColors.light();
    final theme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: p.background,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: p.primary,
            brightness: Brightness.light,
          ).copyWith(
            primary: p.primary,
            onPrimary: p.foreground,
            surface: p.card,
            onSurface: p.foreground,
            error: p.destructive,
            onError: p.foreground,
          ),
      extensions: [p],
      textTheme: textTheme ?? buildTextTheme(fontFamily: fontFamily),
    );
    return theme;
  }

  /// Creates a dark [ThemeData] with the design system.
  static ThemeData dark({
    AppColors? palette,
    TextTheme? textTheme,
    String fontFamily = 'IBMPlexSans',
  }) {
    final p = palette ?? AppColors.dark();
    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: p.background,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: p.primary,
            brightness: Brightness.dark,
          ).copyWith(
            primary: p.primary,
            onPrimary: p.foreground,
            surface: p.card,
            onSurface: p.foreground,
            error: p.destructive,
            onError: p.foreground,
          ),
      extensions: [p],
      textTheme: textTheme ?? buildTextTheme(fontFamily: fontFamily),
    );
    return theme;
  }
}
