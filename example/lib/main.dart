import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';

void main() {
  runApp(const FlutterGlassExampleApp());
}

/// Example app demonstrating FlutterGlass widgets.
class FlutterGlassExampleApp extends StatelessWidget {
  const FlutterGlassExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassThemeProvider(
      data: const GlassThemeConfig(
        blurSigma: 15.0,
        tintColor: Color(0x33FFFFFF),
        borderColor: Color(0x44FFFFFF),
        borderWidth: 0.5,
      ),
      child: MaterialApp(
        title: 'FlutterGlass Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

/// Home screen with navigation to examples.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    WidgetsShowcase(),
    EffectsShowcase(),
    AnimationsShowcase(),
    ThemingShowcase(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
            Color(0xFF0F3460),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _screens[_selectedIndex],
        bottomNavigationBar: GlassNavigationBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) => setState(() => _selectedIndex = index),
          items: const [
            GlassNavigationItem(
              icon: Icons.widgets_outlined,
              selectedIcon: Icons.widgets,
              label: 'Widgets',
            ),
            GlassNavigationItem(
              icon: Icons.auto_awesome_outlined,
              selectedIcon: Icons.auto_awesome,
              label: 'Effects',
            ),
            GlassNavigationItem(
              icon: Icons.animation_outlined,
              selectedIcon: Icons.animation,
              label: 'Animations',
            ),
            GlassNavigationItem(
              icon: Icons.palette_outlined,
              selectedIcon: Icons.palette,
              label: 'Themes',
            ),
          ],
        ),
      ),
    );
  }
}

/// Showcase of glass widgets.
class WidgetsShowcase extends StatelessWidget {
  const WidgetsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverGlassAppBar(
          title: Text('Glass Widgets'),
          expandedHeight: 120,
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSection('Glass Card', const _GlassCardDemo()),
              const SizedBox(height: 24),
              _buildSection('Glass Button', const _GlassButtonDemo()),
              const SizedBox(height: 24),
              _buildSection('Glass Text Field', const _GlassTextFieldDemo()),
              const SizedBox(height: 24),
              _buildSection('Glass Bottom Sheet', const _GlassBottomSheetDemo()),
              const SizedBox(height: 100),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

/// Glass card demo.
class _GlassCardDemo extends StatelessWidget {
  const _GlassCardDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassCard(
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Default Glass Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'A beautiful frosted glass effect that works on any background.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        GlassCard(
          borderRadius: 24,
          blurSigma: 25,
          tintColor: const Color(0x22FF6B6B),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Color(0xFFFF6B6B), size: 32),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Custom Styled Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'With custom tint color',
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Glass button demo.
class _GlassButtonDemo extends StatelessWidget {
  const _GlassButtonDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        GlassButton(
          onPressed: () => _showSnackBar(context, 'Primary pressed!'),
          child: const Text('Primary'),
        ),
        GlassButton(
          onPressed: () => _showSnackBar(context, 'With icon pressed!'),
          icon: Icons.rocket_launch,
          child: const Text('With Icon'),
        ),
        GlassButton.icon(
          onPressed: () => _showSnackBar(context, 'Icon button pressed!'),
          icon: Icons.add,
        ),
        GlassButton(
          onPressed: null,
          child: const Text('Disabled'),
        ),
        GlassButton(
          onPressed: () => _showSnackBar(context, 'Colored pressed!'),
          tintColor: const Color(0x3300FF87),
          child: const Text('Colored'),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white.withValues(alpha: 0.2),
      ),
    );
  }
}

/// Glass text field demo.
class _GlassTextFieldDemo extends StatefulWidget {
  const _GlassTextFieldDemo();

  @override
  State<_GlassTextFieldDemo> createState() => _GlassTextFieldDemoState();
}

class _GlassTextFieldDemoState extends State<_GlassTextFieldDemo> {
  final _controller = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassTextField(
          controller: _controller,
          hintText: 'Enter your name',
          prefixIcon: Icons.person_outline,
        ),
        const SizedBox(height: 12),
        GlassTextField(
          controller: _passwordController,
          hintText: 'Enter password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
      ],
    );
  }
}

/// Glass bottom sheet demo.
class _GlassBottomSheetDemo extends StatelessWidget {
  const _GlassBottomSheetDemo();

  @override
  Widget build(BuildContext context) {
    return GlassButton(
      onPressed: () => _showBottomSheet(context),
      icon: Icons.expand_less,
      child: const Text('Show Bottom Sheet'),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showGlassBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share, color: Colors.white),
            title: const Text('Share', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.link, color: Colors.white),
            title: const Text('Copy Link', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.white),
            title: const Text('Edit', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// Showcase of glass effects.
class EffectsShowcase extends StatelessWidget {
  const EffectsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverGlassAppBar(
          title: Text('Glass Effects'),
          expandedHeight: 120,
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSection('Aurora Background', const _AuroraDemo()),
              const SizedBox(height: 24),
              _buildSection('Frosted Glass', const _FrostedDemo()),
              const SizedBox(height: 24),
              _buildSection('Blur Layers', const _BlurLayerDemo()),
              const SizedBox(height: 100),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

/// Aurora background demo.
class _AuroraDemo extends StatelessWidget {
  const _AuroraDemo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AuroraBackground(
          colors: const [
            Color(0xFFFF6B6B),
            Color(0xFF4ECDC4),
            Color(0xFFA855F7),
            Color(0xFF3B82F6),
          ],
          child: Center(
            child: GlassCard(
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Aurora Effect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Frosted glass demo.
class _FrostedDemo extends StatelessWidget {
  const _FrostedDemo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          // Background image placeholder
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF667EEA),
                  Color(0xFF764BA2),
                ],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.landscape,
                color: Colors.white24,
                size: 100,
              ),
            ),
          ),
          Center(
            child: FrostedGlass(
              borderRadius: BorderRadius.circular(16),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Frosted Glass',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Blur layer demo.
class _BlurLayerDemo extends StatelessWidget {
  const _BlurLayerDemo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFf093fb),
                  Color(0xFFf5576c),
                ],
              ),
            ),
          ),
          const Positioned.fill(
            child: BlurLayer(
              blurSigma: 5.0,
              child: Center(
                child: Text(
                  'Blur Layer Effect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Showcase of glass animations.
class AnimationsShowcase extends StatelessWidget {
  const AnimationsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverGlassAppBar(
          title: Text('Glass Animations'),
          expandedHeight: 120,
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSection('Morphing Card', const _MorphingCardDemo()),
              const SizedBox(height: 24),
              _buildSection('Shimmer Effect', const _ShimmerDemo()),
              const SizedBox(height: 24),
              _buildSection('Staggered Animation', const _StaggeredDemo()),
              const SizedBox(height: 100),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

/// Morphing card demo.
class _MorphingCardDemo extends StatefulWidget {
  const _MorphingCardDemo();

  @override
  State<_MorphingCardDemo> createState() => _MorphingCardDemoState();
}

class _MorphingCardDemoState extends State<_MorphingCardDemo> {
  bool _isMorphed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isMorphed = !_isMorphed),
      child: MorphingCard(
        expanded: _isMorphed,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tap to Morph',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (_isMorphed) ...[
                const SizedBox(height: 12),
                const Text(
                  'The card smoothly transforms between states with a beautiful morphing animation.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Shimmer demo.
class _ShimmerDemo extends StatelessWidget {
  const _ShimmerDemo();

  @override
  Widget build(BuildContext context) {
    return const ShimmerGlass(
      child: GlassCard(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white54),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Shimmer effect on glass',
                      style: TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Staggered animation demo.
class _StaggeredDemo extends StatefulWidget {
  const _StaggeredDemo();

  @override
  State<_StaggeredDemo> createState() => _StaggeredDemoState();
}

class _StaggeredDemoState extends State<_StaggeredDemo> {
  final _key = GlobalKey();
  bool _show = true;

  void _replay() {
    setState(() => _show = false);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _show = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassButton(
          onPressed: _replay,
          icon: Icons.replay,
          child: const Text('Replay Animation'),
        ),
        const SizedBox(height: 16),
        if (_show)
          Column(
            key: _key,
            children: List.generate(
              4,
              (index) => TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 300 + (index * 100)),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(50 * (1 - value), 0),
                    child: Opacity(
                      opacity: value,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GlassCard(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white24,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              'Item ${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              'Staggered animation',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

/// Showcase of glass theming.
class ThemingShowcase extends StatefulWidget {
  const ThemingShowcase({super.key});

  @override
  State<ThemingShowcase> createState() => _ThemingShowcaseState();
}

class _ThemingShowcaseState extends State<ThemingShowcase> {
  int _selectedTheme = 0;

  final List<_ThemeOption> _themes = [
    _ThemeOption(
      name: 'Default',
      config: const GlassThemeConfig(
        blurSigma: 15.0,
        tintColor: Color(0x33FFFFFF),
        borderColor: Color(0x44FFFFFF),
      ),
    ),
    _ThemeOption(
      name: 'Frosted',
      config: const GlassThemeConfig(
        blurSigma: 30.0,
        tintColor: Color(0x55FFFFFF),
        borderColor: Color(0x66FFFFFF),
      ),
    ),
    _ThemeOption(
      name: 'Subtle',
      config: const GlassThemeConfig(
        blurSigma: 8.0,
        tintColor: Color(0x22FFFFFF),
        borderColor: Color(0x22FFFFFF),
      ),
    ),
    _ThemeOption(
      name: 'Dark',
      config: const GlassThemeConfig(
        blurSigma: 20.0,
        tintColor: Color(0x44000000),
        borderColor: Color(0x22FFFFFF),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassThemeProvider(
      data: _themes[_selectedTheme].config,
      child: CustomScrollView(
        slivers: [
          const SliverGlassAppBar(
            title: Text('Glass Theming'),
            expandedHeight: 120,
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildThemeSelector(),
                const SizedBox(height: 24),
                _buildPreviewCard(),
                const SizedBox(height: 16),
                _buildPreviewButton(),
                const SizedBox(height: 16),
                _buildPreviewTextField(),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Theme',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_themes.length, (index) {
            final isSelected = _selectedTheme == index;
            return GlassButton(
              onPressed: () => setState(() => _selectedTheme = index),
              tintColor: isSelected
                  ? const Color(0x44FFFFFF)
                  : const Color(0x22FFFFFF),
              child: Text(_themes[index].name),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPreviewCard() {
    return GlassCard(
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview Card',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This card reflects the current theme settings.',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewButton() {
    return Row(
      children: [
        GlassButton(
          onPressed: () {},
          child: const Text('Preview Button'),
        ),
        const SizedBox(width: 12),
        GlassButton.icon(
          onPressed: () {},
          icon: Icons.star,
        ),
      ],
    );
  }

  Widget _buildPreviewTextField() {
    return const GlassTextField(
      hintText: 'Preview text field',
      prefixIcon: Icons.search,
    );
  }
}

class _ThemeOption {
  final String name;
  final GlassThemeConfig config;

  const _ThemeOption({
    required this.name,
    required this.config,
  });
}
