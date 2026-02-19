# im_design_base

A Flutter design system package with color tokens, typography, variable fonts, and ThemeExtension for semantic theming.

## Features

- **Color tokens** — Semantic palette with light/dark variants
- **Typography** — Centralized text styles with variable font support (IBM Plex Sans)
- **ThemeExtension** — `AppColors` for semantic theming with `context.colors`
- **Customizable** — Override palette and typography via `copyWith` and `buildTextTheme` params
- **Light/Dark mode** — Built-in support with smooth theme transitions

## Getting started

Add the dependency:

```yaml
dependencies:
  im_design_base:
    path: ../design_base  # or im_design_base: ^1.0.0 when published
```

## Usage

```dart
import 'package:im_design_base/im_design_base.dart';

MaterialApp(
  theme: AppTheme.light(),
  darkTheme: AppTheme.dark(),
  home: MyHomePage(),
);

// In widgets:
Container(
  color: context.colors.card,
  child: Text(
    'Hello',
    style: context.textStyles.headlineMedium?.copyWith(
      color: context.colors.foreground,
    ),
  ),
);
```

## Customization

```dart
final customPalette = DesignSystemPalette.defaultLight().copyWith(
  primary: const Color(0xFF2563EB),
);
final textTheme = buildTextTheme(fontSizeScale: 1.1);

MaterialApp(
  theme: AppTheme.light(palette: customPalette, textTheme: textTheme),
  darkTheme: AppTheme.dark(
    palette: DesignSystemPalette.defaultDark().copyWith(primary: const Color(0xFF60A5FA)),
    textTheme: textTheme,
  ),
  ...
);
```

## Documentation

See [docs/INTEGRATION.md](docs/INTEGRATION.md) for the full integration guide.

## Example

Run the example app:

```bash
cd example && flutter run
```
