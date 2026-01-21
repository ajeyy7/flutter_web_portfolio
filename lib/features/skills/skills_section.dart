import 'package:Portfolio_Ajay/data/skills.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final bool isDesktop;
  const SkillsSection({super.key, required this.isDesktop});

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
          ...skills.map(
            (skill) => _buildSkillBar(
              skill['name'] as String,
              skill['level'] as double,
              isDesktop,
            ),
          ),
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

}
