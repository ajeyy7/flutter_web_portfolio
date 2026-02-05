import 'package:Portfolio_Ajay/core/constants/constants.dart';
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
          Row(
            children: [
              Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.cyan, AppColors.blue],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'ABOUT',
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 3,
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Main Title with gradient
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
            ).createShader(bounds),
            child: Text(
              'Who I Am & What I Do',
              style: TextStyle(
                fontSize: isDesktop ? 48 : 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.2,
                letterSpacing: -1,
              ),
            ),
          ),

          SizedBox(height: isDesktop ? 60 : 40),

          // Main Content - Two Column Layout on Desktop
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContentColumn()),
                const SizedBox(width: 80),
                Expanded(child: _buildStatsAndHighlights()),
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
        const Text(
          'I\'m a Flutter developer passionate about building elegant, scalable applications. My focus is on creating seamless user experiences while maintaining clean, maintainable code.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFB0B0B0),
            height: 1.8,
            letterSpacing: 0.2,
          ),
        ),

        const SizedBox(height: 32),

        // Process Section
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFF2a2a2a), width: 2),
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
                          Color(0xFF00D9FF).withValues(alpha: 0.2),
                          Color(0xFF00FFA3).withValues(alpha: 0.2),
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

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildStatsAndHighlights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Specializations
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF2a2a2a), width: 2),
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
                'Provider, Riverpod, GetX, BLoC',
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
                  Color(0xFF00D9FF).withValues(alpha: 0.2),
                  Color(0xFF00FFA3).withValues(alpha: 0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFF00D9FF).withValues(alpha: 0.3),
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
          Icon(Icons.arrow_forward, size: 16, color: Colors.grey.shade700),
        ],
      ),
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
            child: Icon(icon, color: Color(0xFF00D9FF), size: 20),
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
                  style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
