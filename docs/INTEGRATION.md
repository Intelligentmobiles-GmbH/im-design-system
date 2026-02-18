# Integrating design_base into Your Flutter App

This guide explains how to add the design_base package to a new or existing Flutter app and configure themes.

## 1. Add the dependency

### Option A: Local path (development)

If the package lives alongside your app:

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  design_base:
    path: ../design_base
```

### Option B: Pub.dev (when published)

```yaml
dependencies:
  design_base: ^1.0.0
```

Run `flutter pub get`.

## 2. Configure MaterialApp

Import the package and apply the themes:

```dart
import 'package:flutter/material.dart';
import 'package:design_base/design_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
```

## 3. Use the design system in widgets

Access colors and typography via `BuildContext`:

```dart
Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: context.colors.card,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Text(
    "Hello",
    style: context.textStyles.headlineMedium?.copyWith(
      color: context.colors.foreground,
    ),
  ),
);
```

## 4. Customize palette

Override colors using `DesignSystemPalette` and `copyWith`:

```dart
final customPalette = DesignSystemPalette.defaultLight().copyWith(
  primary: const Color(0xFF2563EB),
  primaryGlow: const Color(0xFF60A5FA),
);

MaterialApp(
  theme: AppTheme.light(palette: customPalette),
  darkTheme: AppTheme.dark(
    palette: DesignSystemPalette.defaultDark().copyWith(
      primary: const Color(0xFF60A5FA),
    ),
  ),
  ...
);
```

## 5. Customize typography

```dart
final textTheme = buildTextTheme(
  fontFamily: 'YourFont',
  fontSizeScale: 1.1,
);

MaterialApp(
  theme: AppTheme.light(textTheme: textTheme),
  ...
);
```

## 6. Full customization example

```dart
MaterialApp(
  theme: AppTheme.light(
    palette: DesignSystemPalette.defaultLight().copyWith(primary: Colors.blue),
    textTheme: buildTextTheme(fontSizeScale: 1.05),
  ),
  darkTheme: AppTheme.dark(
    palette: DesignSystemPalette.defaultDark().copyWith(primary: Colors.blue.shade300),
    textTheme: buildTextTheme(fontSizeScale: 1.05),
  ),
  ...
);
```

## 7. Font assets (required for variable fonts)

If using the default IBM Plex Sans font, the package includes it. For custom fonts, add your font files to your app's `assets/fonts/` and declare them in your app's `pubspec.yaml` under `flutter: fonts:`.
