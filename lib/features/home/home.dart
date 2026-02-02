import 'package:Portfolio_Ajay/features/about_me/aboutme_section.dart';
import 'package:Portfolio_Ajay/features/contact_me/contactme_section.dart';
import 'package:Portfolio_Ajay/features/experience/experince_section.dart';
import 'package:Portfolio_Ajay/features/projects/projects_section.dart';
import 'package:Portfolio_Ajay/features/skills/skills_section.dart';
import 'package:Portfolio_Ajay/shared/navbar.dart';
import 'package:Portfolio_Ajay/shared/particle_background.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showNavbar = false;

  // Section keys for navigation
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && !_showNavbar) {
        setState(() => _showNavbar = true);
      } else if (_scrollController.offset <= 100 && _showNavbar) {
        setState(() => _showNavbar = false);
      }
    });
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1000;
    // final isTablet = size.width > 600 && size.width <= 1000;

    return Scaffold(
      body: Stack(
        children: [
          const ParticleBackground(),

          // Main Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildHeroSection(size, isDesktop),
                AboutMeSection(key: _aboutKey, isDesktop: isDesktop),
                SkillsSection(key: _skillsKey, isDesktop: isDesktop),
                ExperienceSection(key: _experienceKey, isDesktop: isDesktop),
                ProjectsSection(key: _projectsKey, isDesktop: isDesktop),
                ContactMeSection(key: _contactKey, isDesktop: isDesktop),
              ],
            ),
          ),

          // Floating Navigation
          if (_showNavbar)
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: NavBar(
                onAboutTap: () => _scrollToSection(_aboutKey),
                onSkillsTap: () => _scrollToSection(_skillsKey),
                onExperienceTap: () => _scrollToSection(_experienceKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
                onContactTap: () => _scrollToSection(_contactKey),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(Size size, bool isDesktop) {
    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 120 : 40),
      child: Row(children: [Expanded(child: _buildHeroContent(isDesktop))]),
    );
  }

  Widget _buildHeroContent(bool isDesktop) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated greeting
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          },
          child: const Text(
            "Hello, I'm",
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Name
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: child,
              ),
            );
          },
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFCCCCCC)],
            ).createShader(bounds),
            child: Text(
              'Ajaykrishna',
              style: TextStyle(
                fontSize: isDesktop ? 72 : 56,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.1,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Title with gradient
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1200),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: child,
              ),
            );
          },
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
            ).createShader(bounds),
            child: Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: isDesktop ? 48 : 36,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.1,
                letterSpacing: -1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),

        // Brief intro
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1400),
          builder: (context, value, child) {
            return Opacity(opacity: value, child: child);
          },
          child: SizedBox(
            width: isDesktop ? 500 : double.infinity,
            child: const Text(
              'Crafting beautiful cross-platform experiences with clean code and pixel-perfect design.',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFAAAAAA),
                height: 1.6,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(height: 60),

        // CTA Buttons
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1600),
          builder: (context, value, child) {
            return Opacity(opacity: value, child: child);
          },
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildButton(
                'View Projects',
                isPrimary: true,
                onTap: () => _scrollToSection(_projectsKey),
              ),
              _buildButton(
                'Contact Me',
                isPrimary: false,
                onTap: () => _scrollToSection(_contactKey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
    String text, {
    required bool isPrimary,
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: isPrimary
                ? const LinearGradient(
                    colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
                  )
                : null,
            border: !isPrimary
                ? Border.all(color: Colors.white30, width: 1.5)
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? const Color(0xFF1a1a1a) : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
