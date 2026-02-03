import 'package:Portfolio_Ajay/shared/scroll_animation.dart';
import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  final bool isDesktop;
  const AboutMeSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Label with accent
          ScrollAnimatedItem(
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
                  'ABOUT',
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

          // Main Title with gradient
          ScrollAnimatedItem(
            delay: const Duration(milliseconds: 100),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withValues(alpha:0.8),
                ],
              ).createShader(bounds),
              child: Text(
                isDesktop 
                    ? 'Building Digital Experiences\nAcross Platforms'
                    : 'Building Digital\nExperiences',
                style: TextStyle(
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.2,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Subtitle/Intro
          ScrollAnimatedItem(
            delay: const Duration(milliseconds: 150),
            child: Text(
              'Hi, I\'m AjayKrishna — a Flutter developer specializing in Mobile, Web, and Desktop applications',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF00D9FF),
                height: 1.6,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),

          SizedBox(height: isDesktop ? 60 : 40),

          // Main Content - Two Column Layout on Desktop
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildContentColumn(),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: _buildStatsAndHighlights(),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildContentColumn(),
                const SizedBox(height: 60),
                _buildStatsAndHighlights(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContentColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Description
        ScrollAnimatedItem(
          delay: const Duration(milliseconds: 200),
          child: const Text(
            'I specialize in turning ideas into fully functional, production-ready apps using Flutter. Whether it\'s a startup MVP, a business app, or a custom solution, I can take your vision from concept to launch.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFB0B0B0),
              height: 1.8,
              letterSpacing: 0.2,
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Process Section
        ScrollAnimatedItem(
          delay: const Duration(milliseconds: 250),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(0xFF2a2a2a),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF00D9FF).withValues(alpha:0.2),
                            Color(0xFF00FFA3).withValues(alpha:0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.rocket_launch,
                        color: Color(0xFF00D9FF),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'End-to-End Development',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildProcessStep('Idea Validation', '01'),
                _buildProcessStep('Design', '02'),
                _buildProcessStep('Development', '03'),
                _buildProcessStep('Deployment', '04'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // CTA
        ScrollAnimatedItem(
          delay: const Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00D9FF).withValues(alpha:0.1),
                  Color(0xFF00FFA3).withValues(alpha:0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(0xFF00D9FF).withValues(alpha:0.3),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Color(0xFF00D9FF),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Have an idea?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Let\'s connect and bring it to life with Flutter',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB0B0B0),
                          height: 1.5,
                        ),
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

  Widget _buildStatsAndHighlights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stats Grid
        ScrollAnimatedItem(
          delay: const Duration(milliseconds: 350),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF2a2a2a),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BY THE NUMBERS',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 32),
                _buildStat('2+', 'Years Experience', Color(0xFF00D9FF)),
                const SizedBox(height: 32),
                _buildStat('15+', 'Projects Delivered', Color(0xFF00FFA3)),
                const SizedBox(height: 32),
                _buildStat('2+', 'Apps Published', Color(0xFFFF6B35)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Specializations
        ScrollAnimatedItem(
          delay: const Duration(milliseconds: 400),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF2a2a2a),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SPECIALIZATIONS',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSpecialization(
                  Icons.code,
                  'Clean Architecture',
                  'Scalable & maintainable code',
                ),
                _buildSpecialization(
                  Icons.layers,
                  'State Management',
                  'Riverpod, GetX, BLoC',
                ),
                _buildSpecialization(
                  Icons.api,
                  'API Integration',
                  'RESTful & real-time data',
                ),
                _buildSpecialization(
                  Icons.devices,
                  'Cross-Platform',
                  'Mobile, Web & Desktop',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProcessStep(String title, String number) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00D9FF).withValues(alpha:0.2),
                  Color(0xFF00FFA3).withValues(alpha:0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFF00D9FF).withValues(alpha:0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF00D9FF),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFB0B0B0),
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward,
            size: 16,
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              accentColor,
              accentColor.withValues(alpha:0.6),
            ],
          ).createShader(bounds),
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
              letterSpacing: -1,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF888888),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialization(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Color(0xFF00D9FF),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF888888),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}