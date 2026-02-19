@TestOn('browser')
import 'package:im_design_base/im_design_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    test('light returns expected primary color', () {
      final palette = AppColors.light();
      expect(palette.primary, const Color(0xFF8B5CF6));
    });

    test('dark returns expected primary color', () {
      final palette = AppColors.dark();
      expect(palette.primary, const Color(0xFF8B5CF6));
    });

    test('copyWith overrides specified fields', () {
      final palette = AppColors.light();
      final custom = palette.copyWith(primary: Colors.blue);
      expect(custom.primary, Colors.blue);
      expect(custom.background, palette.background);
    });
  });

  group('AppTheme', () {
    test('light returns ThemeData with extensions', () {
      final theme = AppTheme.light();
      final colors = theme.extension<AppColors>();
      expect(colors, isNotNull);
      expect(theme.brightness, Brightness.light);
    });

    test('dark returns ThemeData with extensions', () {
      final theme = AppTheme.dark();
      final colors = theme.extension<AppColors>();
      expect(colors, isNotNull);
      expect(theme.brightness, Brightness.dark);
    });
  });

  group('buildTextTheme', () {
    test('returns TextTheme with expected styles', () {
      final theme = buildTextTheme();
      expect(theme.headlineLarge, isNotNull);
      expect(theme.headlineMedium, isNotNull);
      expect(theme.bodyLarge, isNotNull);
      expect(theme.bodyMedium, isNotNull);
      expect(theme.labelMedium, isNotNull);
    });

    test('fontSizeScale affects font sizes', () {
      final base = buildTextTheme(fontSizeScale: 1.0);
      final scaled = buildTextTheme(fontSizeScale: 1.5);
      expect(scaled.headlineLarge!.fontSize,
          greaterThan(base.headlineLarge!.fontSize!));
    });
  });
}
