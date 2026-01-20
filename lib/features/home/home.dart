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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1000;
    final isTablet = size.width > 600 && size.width <= 1000;

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
                _buildAboutSection(isDesktop, isTablet),
                _buildSkillsSection(isDesktop, isTablet),
                _buildExperienceSection(isDesktop, isTablet),
                _buildProjectsSection(isDesktop, isTablet),
                _buildContactSection(isDesktop),
              ],
            ),
          ),
          
          // Floating Navigation
          if (_showNavbar) _buildFloatingNav(),
        ],
      ),
    );
  }

  Widget _buildHeroSection(Size size, bool isDesktop) {
    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 120 : 40),
      child: Column(
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
              'Hello, Im',
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
                  fontSize: isDesktop ? 96 : 56,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.1,
                  letterSpacing: -2,
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
                  fontSize: isDesktop ? 64 : 36,
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
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: SizedBox(
              width: isDesktop ? 600 : double.infinity,
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
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildButton('View Projects', isPrimary: true),
                _buildButton('Contact Me', isPrimary: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {required bool isPrimary}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
                )
              : null,
          border: !isPrimary ? Border.all(color: Colors.white30, width: 1.5) : null,
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
    );
  }

  Widget _buildAboutSection(bool isDesktop, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) ...[
            const Expanded(
              flex: 1,
              child: Text(
                '01',
                style: TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF252525),
                  height: 0.8,
                ),
              ),
            ),
            const SizedBox(width: 80),
          ],
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ABOUT',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 4,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Building digital experiences',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Im a Flutter developer passionate about creating seamless cross-platform applications. With expertise in mobile app development, clean architecture, and modern state management, I transform ideas into elegant solutions.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFAAAAAA),
                    height: 1.8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Based in Palakkad, Kerala, I specialize in building scalable ERP and CRM solutions, implementing complex API integrations, and delivering polished user experiences.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFAAAAAA),
                    height: 1.8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 40,
                  runSpacing: 24,
                  children: [
                    _buildStat('3+', 'Years Experience'),
                    _buildStat('15+', 'Projects Completed'),
                    _buildStat('5+', 'Apps Published'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
          ).createShader(bounds),
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF888888),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection(bool isDesktop, bool isTablet) {
    final skills = [
      {'name': 'Flutter & Dart', 'level': 0.95},
      {'name': 'State Management', 'level': 0.90},
      {'name': 'API Integration', 'level': 0.88},
      {'name': 'UI/UX Design', 'level': 0.85},
      {'name': 'Node.js & MongoDB', 'level': 0.80},
      {'name': 'Git & Version Control', 'level': 0.92},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EXPERTISE',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 4,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Technical Skills',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          ...skills.map((skill) => _buildSkillBar(
            skill['name'] as String,
            skill['level'] as double,
            isDesktop,
          )),
        ],
      ),
    );
  }

  Widget _buildSkillBar(String name, double level, bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${(level * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF888888),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            decoration: BoxDecoration(
              color: const Color(0xFF2a2a2a),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: level,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(bool isDesktop, bool isTablet) {
    final experiences = [
      {
        'company': 'Algobotix',
        'role': 'Flutter Developer',
        'period': 'Jan 2025 - Present',
        'description': 'Developing innovative mobile applications and implementing modern UI/UX patterns with Flutter framework.',
      },
      {
        'company': 'Rag Technologies',
        'role': 'Flutter Developer',
        'period': 'Feb 2024 - Aug 2024',
        'description': 'Built ERP and CRM solutions for logistics sectors with clean architecture and optimized API integrations.',
      },
      {
        'company': 'Luminar Technolab',
        'role': 'Flutter Developer Intern',
        'period': 'Jun 2023 - Feb 2024',
        'description': 'Designed responsive UIs and worked with REST APIs to ensure smooth data flow in cross-platform applications.',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'JOURNEY',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 4,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Experience',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          ...experiences.asMap().entries.map((entry) {
            final exp = entry.value;
            return _buildExperienceCard(
              exp['company']!,
              exp['role']!,
              exp['period']!,
              exp['description']!,
              isDesktop,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
    String company,
    String role,
    String period,
    String description,
    bool isDesktop,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2a2a2a), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF00D9FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                period,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF888888),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFAAAAAA),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(bool isDesktop, bool isTablet) {
    final projects = [
      {
        'name': 'OpporTune',
        'category': 'Job Application',
        'description': 'Full-stack job platform with dynamic listings, built with Flutter and Node.js',
        'tech': <String>['Flutter', 'Riverpod', 'Node.js', 'MongoDB'],
      },
      {
        'name': 'ReadyShip',
        'category': 'Logistics',
        'description': 'Courier delivery service with real-time tracking and notifications',
        'tech': <String>['Flutter', 'Maps API', 'Firebase', 'GetX'],
      },
      {
        'name': 'Target',
        'category': 'CRM Solution',
        'description': 'Sales optimization platform with task tracking and meeting scheduler',
        'tech': <String>['Flutter', 'GetX', 'Google Maps', 'REST API'],
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PORTFOLIO',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 4,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          if (isDesktop)
            Wrap(
              spacing: 32,
              runSpacing: 32,
              children: projects
                  .map((project) => SizedBox(
                        width: (MediaQuery.of(context).size.width - 304) / 3,
                        child: _buildProjectCard(
                          project['name'] as String,
                          project['category'] as String,
                          project['description'] as String,
                          project['tech'] as List<String>,
                        ),
                      ))
                  .toList(),
            )
          else
            ...projects.map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: _buildProjectCard(
                    project['name'] as String,
                    project['category'] as String,
                    project['description'] as String,
                    project['tech'] as List<String>,
                  ),
                )),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    String name,
    String category,
    String description,
    List<String> tech,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2a2a2a), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                letterSpacing: 2,
                color: Color(0xFF00D9FF),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFFAAAAAA),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tech
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2a2a2a),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          t,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF888888),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        children: [
          const Text(
            'GET IN TOUCH',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 4,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Lets work together',
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 60,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildContactItem('Email', 'ajaykrishna9872@gmail.com'),
              _buildContactItem('Phone', '+91 984 657 2149'),
              _buildContactItem('Location', 'Palakkad, Kerala'),
            ],
          ),
          const SizedBox(height: 80),
          const Text(
            '© 2025 Ajaykrishna. All rights reserved.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF888888),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingNav() {
    return Positioned(
      top: 30,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF242424).withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: const Color(0xFF2a2a2a), width: 1),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('About', style: TextStyle(color: Colors.white, fontSize: 14)),
              SizedBox(width: 32),
              Text('Skills', style: TextStyle(color: Colors.white, fontSize: 14)),
              SizedBox(width: 32),
              Text('Experience', style: TextStyle(color: Colors.white, fontSize: 14)),
              SizedBox(width: 32),
              Text('Projects', style: TextStyle(color: Colors.white, fontSize: 14)),
              SizedBox(width: 32),
              Text('Contact', style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}