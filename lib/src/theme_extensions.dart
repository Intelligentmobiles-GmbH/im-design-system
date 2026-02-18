import 'package:flutter/material.dart';

import 'colors.dart';
import 'palette.dart';

/// Extensions on [BuildContext] for convenient theme access.
extension ThemeX on BuildContext {
  /// Semantic colors from the design system.
  ///
  /// Falls back to light palette if extension is not found.
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ??
      AppColors.fromPalette(DesignSystemPalette.defaultLight());

  /// Text styles from the theme.
  TextTheme get textStyles => Theme.of(this).textTheme;
}
