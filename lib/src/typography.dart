import 'package:flutter/material.dart';

/// Builds a [TextTheme] with variable font support.
///
/// Uses [fontVariations] for weight control when using variable fonts.
/// No hardcoded colors are applied to text styles.
TextTheme buildTextTheme({
  String fontFamily = 'IBMPlexSans',
  TextTheme? base,
  double fontSizeScale = 1.0,
}) {
  double scale(double size) => (size * fontSizeScale).roundToDouble();

  final textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: scale(20),
      fontFamily: fontFamily,
      fontVariations: const [FontVariation.weight(700)],
    ),
    headlineMedium: TextStyle(
      fontSize: scale(16),
      fontFamily: fontFamily,
      fontVariations: const [FontVariation.weight(700)],
    ),
    bodyLarge: TextStyle(
      fontSize: scale(14),
      fontFamily: fontFamily,
      fontVariations: const [FontVariation.weight(400)],
    ),
    bodyMedium: TextStyle(
      fontSize: scale(12),
      fontFamily: fontFamily,
      fontVariations: const [FontVariation.weight(400)],
    ),
    labelMedium: TextStyle(
      fontSize: scale(12),
      fontFamily: fontFamily,
      fontVariations: const [FontVariation.weight(500)],
    ),
  );

  if (base != null) {
    return base.merge(textTheme);
  }
  return textTheme;
}
