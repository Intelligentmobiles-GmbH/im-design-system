import 'package:design_base/design_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DesignSystemPalette', () {
    test('defaultLight returns expected primary color', () {
      final palette = DesignSystemPalette.defaultLight();
      expect(palette.primary, const Color(0xFF8B5CF6));
    });

    test('defaultDark returns expected primary color', () {
      final palette = DesignSystemPalette.defaultDark();
      expect(palette.primary, const Color(0xFFA78BFA));
    });

    test('copyWith overrides specified fields', () {
      final palette = DesignSystemPalette.defaultLight();
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
