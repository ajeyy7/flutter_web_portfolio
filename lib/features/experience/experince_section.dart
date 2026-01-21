import 'package:Portfolio_Ajay/data/experince.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  const ExperienceSection({super.key, required this.isDesktop});

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

}
