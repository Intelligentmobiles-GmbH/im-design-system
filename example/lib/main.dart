import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:design_base/design_base.dart';

void main() {
  // Ensure IBM Plex Sans is loaded (fixes font loading on web)
  GoogleFonts.config.allowRuntimeFetching = true;
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
    final customPalette = DesignSystemPalette.defaultLight().copyWith(
      primary: const Color(0xFF2563EB),
    );
    final customDarkPalette = DesignSystemPalette.defaultDark().copyWith(
      primary: const Color(0xFF60A5FA),
    );
    // Use Google Fonts for IBM Plex Sans (loads at runtime, works on web)
    final baseTheme = GoogleFonts.ibmPlexSansTextTheme();
    final textTheme = buildTextTheme(
      fontFamily: 'IBM Plex Sans',
      base: baseTheme,
      fontSizeScale: 1.1,
    );

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
      drawer: _ComponentDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle('Buttons'),
          _ButtonsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Cards'),
          _CardsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Typography'),
          _TypographySection(),
          const SizedBox(height: 24),
          _SectionTitle('Semantic Colors'),
          _ColorsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Inputs'),
          _InputsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Selection'),
          _SelectionSection(),
          const SizedBox(height: 24),
          _SectionTitle('Chips'),
          _ChipsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Progress'),
          _ProgressSection(),
          const SizedBox(height: 24),
          _SectionTitle('Lists'),
          _ListsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Dialogs & Sheets'),
          _DialogsSection(),
          const SizedBox(height: 24),
          _SectionTitle('Navigation'),
          _NavigationSection(),
          const SizedBox(height: 24),
          _SectionTitle('Other'),
          _OtherSection(),
          const SizedBox(height: 32),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'FAB pressed',
                style: context.textStyles.bodyMedium,
              ),
              backgroundColor: context.colors.card,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: context.textStyles.headlineMedium?.copyWith(
          color: context.colors.primary,
        ),
      ),
    );
  }
}

class _ComponentDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: context.colors.primary),
            child: Text(
              'Components',
              style: context.textStyles.headlineMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.smart_button),
            title: const Text('Buttons'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Cards'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text('Typography'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Colors'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Inputs'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text('Selection'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: const Text('Chips'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Progress'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Dialogs'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _ButtonsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Tonal'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Material Card',
                  style: context.textStyles.headlineMedium?.copyWith(
                    color: context.colors.foreground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Uses design system colors via theme.',
                  style: context.textStyles.bodyMedium?.copyWith(
                    color: context.colors.foreground,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.card,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Custom Card',
                style: context.textStyles.headlineMedium?.copyWith(
                  color: context.colors.foreground,
                ),
              ),
              Text(
                'Styled with context.colors.card',
                style: context.textStyles.bodyMedium?.copyWith(
                  color: context.colors.foreground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TypographySection extends StatelessWidget {
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
            'Headline Large',
            style: context.textStyles.headlineLarge?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          Text(
            'Headline Medium',
            style: context.textStyles.headlineMedium?.copyWith(
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

class _ColorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _ColorChip(label: 'Primary', color: context.colors.primary),
          _ColorChip(label: 'Destructive', color: context.colors.destructive),
          _ColorChip(label: 'Success', color: context.colors.success),
          _ColorChip(label: 'Warning', color: context.colors.warning),
          _ColorChip(label: 'Info', color: context.colors.info),
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

class _InputsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Text field',
              hintText: 'Enter text',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Filled',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SearchBar(
            hintText: 'Search',
            leading: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class _SelectionSection extends StatefulWidget {
  @override
  State<_SelectionSection> createState() => _SelectionSectionState();
}

class _SelectionSectionState extends State<_SelectionSection> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  String _radioValue = 'a';
  double _sliderValue = 0.5;

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
          Row(
            children: [
              Text(
                'Switch',
                style: context.textStyles.bodyMedium?.copyWith(
                  color: context.colors.foreground,
                ),
              ),
              Switch(
                value: _switchValue,
                onChanged: (v) => setState(() => _switchValue = v),
              ),
            ],
          ),
          CheckboxListTile(
            title: Text(
              'Checkbox',
              style: context.textStyles.bodyMedium?.copyWith(
                color: context.colors.foreground,
              ),
            ),
            value: _checkboxValue,
            onChanged: (v) => setState(() => _checkboxValue = v ?? false),
          ),
          Text(
            'Radio',
            style: context.textStyles.bodyMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          RadioGroup<String>(
            groupValue: _radioValue,
            onChanged: (v) => setState(() => _radioValue = v ?? 'a'),
            child: Row(
              children: [
                Radio<String>(value: 'a'),
                const Text('A'),
                Radio<String>(value: 'b'),
                const Text('B'),
              ],
            ),
          ),
          Text(
            'Slider: ${_sliderValue.toStringAsFixed(2)}',
            style: context.textStyles.labelMedium?.copyWith(
              color: context.colors.foreground,
            ),
          ),
          Slider(
            value: _sliderValue,
            onChanged: (v) => setState(() => _sliderValue = v),
          ),
        ],
      ),
    );
  }
}

class _ChipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          Chip(
            label: const Text('Chip'),
            avatar: const CircleAvatar(child: Icon(Icons.person, size: 18)),
          ),
          FilterChip(
            label: const Text('Filter'),
            selected: false,
            onSelected: (_) {},
          ),
          ActionChip(
            label: const Text('Action'),
            onPressed: () {},
          ),
          InputChip(
            label: const Text('Input'),
            onDeleted: () {},
          ),
          ChoiceChip(
            label: const Text('Choice'),
            selected: false,
            onSelected: (_) {},
          ),
        ],
      ),
    );
  }
}

class _ProgressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const LinearProgressIndicator(),
          const SizedBox(height: 16),
          LinearProgressIndicator(value: 0.6),
          const SizedBox(height: 16),
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(value: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('ListTile with icon'),
            subtitle: const Text('Subtitle text'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: context.colors.primary,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: const Text('ListTile with avatar'),
            onTap: () {},
          ),
          const Divider(height: 1),
          ExpansionTile(
            title: const Text('ExpansionTile'),
            subtitle: const Text('Tap to expand'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Expanded content',
                  style: context.textStyles.bodyMedium?.copyWith(
                    color: context.colors.foreground,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DialogsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Alert Dialog'),
                  content: const Text('Dialog content'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show Dialog'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Bottom Sheet',
                        style: context.textStyles.headlineMedium?.copyWith(
                          color: context.colors.foreground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text('Show Bottom Sheet'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'SnackBar message',
                    style: context.textStyles.bodyMedium,
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: const Text('Show SnackBar'),
          ),
        ],
      ),
    );
  }
}

class _NavigationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: Icon(Icons.commute),
                label: 'Commute',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: 'Saved',
              ),
            ],
          ),
          const SizedBox(height: 12),
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, label: Text('One'), icon: Icon(Icons.looks_one)),
              ButtonSegment(value: 1, label: Text('Two'), icon: Icon(Icons.looks_two)),
              ButtonSegment(value: 2, label: Text('Three'), icon: Icon(Icons.looks_3)),
            ],
            selected: const {0},
            onSelectionChanged: (_) {},
          ),
        ],
      ),
    );
  }
}

class _OtherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Tooltip(
            message: 'Tooltip message',
            child: const Icon(Icons.info_outline, size: 32),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            initialValue: 'one',
            items: const [
              DropdownMenuItem(value: 'one', child: Text('One')),
              DropdownMenuItem(value: 'two', child: Text('Two')),
              DropdownMenuItem(value: 'three', child: Text('Three')),
            ],
            onChanged: (_) {},
          ),
          const SizedBox(height: 12),
          PopupMenuButton<String>(
            onSelected: (_) {},
            itemBuilder: (ctx) => [
              const PopupMenuItem(value: 'edit', child: Text('Edit')),
              const PopupMenuItem(value: 'delete', child: Text('Delete')),
            ],
            child: const ListTile(
              title: Text('Popup Menu'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          const SizedBox(height: 12),
          Badge(
            label: const Text('3'),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
        ],
      ),
    );
  }
}
