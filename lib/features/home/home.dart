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
  String _activeSection = 'About';

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
      _updateActiveSection();
    });
  }

  void _updateActiveSection() {
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Get positions of all sections
    final sections = {
      'About': _aboutKey,
      'Skills': _skillsKey,
      'Experience': _experienceKey,
      'Projects': _projectsKey,
      'Contact': _contactKey,
    };

    String? newActiveSection;
    
    for (var entry in sections.entries) {
      final context = entry.value.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero).dy;
          // Check if section is in viewport (with some offset for better UX)
          if (position <= screenHeight * 0.4 && position >= -box.size.height + screenHeight * 0.4) {
            newActiveSection = entry.key;
            break;
          }
        }
      }
    }

    if (newActiveSection != null && newActiveSection != _activeSection) {
      setState(() => _activeSection = newActiveSection!);
    }
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
                activeSection: _activeSection,
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
        // Greeting
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
          child: Row(
            children: [
              Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00D4FF), Color(0xFF0099FF)],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "HELLO, I'M",
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 3,
                  color: Color(0xFF00D4FF),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Name with gradient
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
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
            ).createShader(bounds),
            child: Text(
              'Ajaykrishna',
              style: TextStyle(
                fontSize: isDesktop ? 80 : 56,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.1,
                letterSpacing: -2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Title/Role
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
                fontSize: isDesktop ? 56 : 40,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.1,
                letterSpacing: -1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // CTA Buttons
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1700),
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
                icon: Icons.arrow_forward,
                onTap: () => _scrollToSection(_projectsKey),
              ),
              _buildButton(
                'Get in Touch',
                isPrimary: false,
                icon: Icons.mail_outline,
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
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            gradient: isPrimary
                ? const LinearGradient(
                    colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
                  )
                : null,
            color: isPrimary ? null : Color(0xFF1A1A1A),
            border: Border.all(
              color: isPrimary
                  ? Colors.transparent
                  : Color(0xFF00D9FF).withValues(alpha: 0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: Color(0xFF00D9FF).withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isPrimary ? const Color(0xFF0A0A0A) : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                icon,
                size: 18,
                color: isPrimary ? const Color(0xFF0A0A0A) : Color(0xFF00D9FF),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
