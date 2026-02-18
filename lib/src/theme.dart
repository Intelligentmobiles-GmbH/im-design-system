import 'package:flutter/material.dart';

import 'colors.dart';
import 'palette.dart';
import 'typography.dart';

/// Factory for creating [ThemeData] with the design system.
abstract final class AppTheme {
  AppTheme._();

  /// Creates a light [ThemeData] with the design system.
  static ThemeData light({
    DesignSystemPalette? palette,
    TextTheme? textTheme,
    String fontFamily = 'IBMPlexSans',
  }) {
    final p = palette ?? DesignSystemPalette.defaultLight();
    final theme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: p.background,
      extensions: [AppColors.fromPalette(p)],
      textTheme: textTheme ?? buildTextTheme(fontFamily: fontFamily),
    );
    return theme;
  }

  /// Creates a dark [ThemeData] with the design system.
  static ThemeData dark({
    DesignSystemPalette? palette,
    TextTheme? textTheme,
    String fontFamily = 'IBMPlexSans',
  }) {
    final p = palette ?? DesignSystemPalette.defaultDark();
    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: p.background,
      extensions: [AppColors.fromPalette(p)],
      textTheme: textTheme ?? buildTextTheme(fontFamily: fontFamily),
    );
    return theme;
  }
}
