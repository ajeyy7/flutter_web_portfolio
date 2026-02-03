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
      child: Row(
        children: [
          Expanded(child: _buildHeroContent(isDesktop)),
        ],
      ),
    );
  }

  Widget _buildHeroContent(bool isDesktop) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated badge/tag
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 600),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00D9FF).withValues(alpha:0.2),
                  Color(0xFF00FFA3).withValues(alpha:0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF00D9FF).withValues(alpha:0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00FFA3),
                        Color(0xFF00D9FF),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF00D9FF).withValues(alpha:0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Available for Freelance',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF00D9FF),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),

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
                    colors: [
                      Color(0xFF00D4FF),
                      Color(0xFF0099FF),
                    ],
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
              colors: [
                Colors.white,
                Colors.white.withValues(alpha:0.8),
              ],
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

        // Description with highlight
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1400),
          builder: (context, value, child) {
            return Opacity(opacity: value, child: child);
          },
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 600 : double.infinity,
            ),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFB0B0B0),
                  height: 1.8,
                  letterSpacing: 0.2,
                ),
                children: [
                  TextSpan(
                    text: 'Crafting ',
                  ),
                  TextSpan(
                    text: 'beautiful cross-platform experiences',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' with clean code and pixel-perfect design.',
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),

        // Quick stats
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1500),
          builder: (context, value, child) {
            return Opacity(opacity: value, child: child);
          },
          child: Row(
            children: [
              _buildQuickStat('2+', 'Years', Color(0xFF00D9FF)),
              const SizedBox(width: 40),
              _buildQuickStat('15+', 'Projects', Color(0xFF00FFA3)),
              const SizedBox(width: 40),
              _buildQuickStat('2+', 'Apps Live', Color(0xFFFF6B35)),
            ],
          ),
        ),
        const SizedBox(height: 60),

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

  Widget _buildQuickStat(String number, String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              color,
              color.withValues(alpha:0.6),
            ],
          ).createShader(bounds),
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
              letterSpacing: -1,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
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
                  : Color(0xFF00D9FF).withValues(alpha:0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: Color(0xFF00D9FF).withValues(alpha:0.3),
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