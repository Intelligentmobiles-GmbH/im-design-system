import 'package:flutter/material.dart';
import 'package:design_base/design_base.dart';

void main() {
  runApp(const DesignBaseExampleApp());
}

class DesignBaseExampleApp extends StatefulWidget {
  const DesignBaseExampleApp({super.key});

  @override
  State<DesignBaseExampleApp> createState() => _DesignBaseExampleAppState();
}

class _DesignBaseExampleAppState extends State<DesignBaseExampleApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  @override
  Widget build(BuildContext context) {
    // Custom palette: override primary color
    final customPalette = DesignSystemPalette.defaultLight().copyWith(
      primary: const Color(0xFF2563EB), // Custom blue
    );
    final customDarkPalette = DesignSystemPalette.defaultDark().copyWith(
      primary: const Color(0xFF60A5FA),
    );

    // Custom typography: larger base scale
    final textTheme = buildTextTheme(fontSizeScale: 1.1);

    return MaterialApp(
      title: 'Design Base Example',
      theme: AppTheme.light(palette: customPalette, textTheme: textTheme),
      darkTheme: AppTheme.dark(
        palette: customDarkPalette,
        textTheme: textTheme,
      ),
      themeMode: _themeMode,
      home: ExampleHomeScreen(
        themeMode: _themeMode,
        onThemeModeChanged: _setThemeMode,
      ),
    );
  }
}

class ExampleHomeScreen extends StatelessWidget {
  const ExampleHomeScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Design Base',
          style: context.textStyles.headlineMedium?.copyWith(
            color: context.colors.foreground,
          ),
        ),
        backgroundColor: context.colors.card,
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : themeMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.brightness_auto,
              color: context.colors.foreground,
            ),
            onPressed: () {
              onThemeModeChanged(
                themeMode == ThemeMode.light
                    ? ThemeMode.dark
                    : themeMode == ThemeMode.dark
                        ? ThemeMode.system
                        : ThemeMode.light,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _CardDemo(),
          const SizedBox(height: 16),
          _TypographyShowcase(),
          const SizedBox(height: 16),
          _ButtonDemo(),
        ],
      ),
    );
  }
}

class _CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Premium Plan',
            style: context.textStyles.headlineMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This card uses context.colors.card and context.textStyles.',
            style: context.textStyles.bodyMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

class _TypographyShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Typography',
            style: context.textStyles.headlineMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Headline Large',
            style: context.textStyles.headlineLarge?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          Text(
            'Body Large',
            style: context.textStyles.bodyLarge?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          Text(
            'Body Medium',
            style: context.textStyles.bodyMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          Text(
            'Label Medium',
            style: context.textStyles.labelMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Semantic Colors',
            style: context.textStyles.headlineMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ColorChip(
                label: 'Primary',
                color: context.colors.primary,
              ),
              _ColorChip(
                label: 'Destructive',
                color: context.colors.destructive,
              ),
              _ColorChip(
                label: 'Success',
                color: context.colors.success,
              ),
              _ColorChip(
                label: 'Warning',
                color: context.colors.warning,
              ),
              _ColorChip(
                label: 'Info',
                color: context.colors.info,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  const _ColorChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: context.textStyles.labelMedium?.copyWith(color: color),
      ),
    );
  }
}
