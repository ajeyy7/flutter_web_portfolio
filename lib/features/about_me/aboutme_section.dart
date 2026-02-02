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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) ...[
            Expanded(
              flex: 1,
              child: ScrollAnimatedItem(
                child: const Text(
                  '01',
                  style: TextStyle(
                    fontSize: 160,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF252525),
                    height: 0.8,
                  ),
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
                ScrollAnimatedItem(
                  delay: const Duration(milliseconds: 100),
                  child: const Text(
                    'ABOUT',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 4,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ScrollAnimatedItem(
                  delay: const Duration(milliseconds: 200),
                  child: const Text(
                    'Building digital experiences',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ScrollAnimatedItem(
                  delay: const Duration(milliseconds: 300),
                  child: const Text(
                    "I'm a Flutter developer passionate about creating seamless cross-platform applications. With expertise in mobile app development, clean architecture, and modern state management, I transform ideas into elegant solutions.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFAAAAAA),
                      height: 1.8,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ScrollAnimatedItem(
                  delay: const Duration(milliseconds: 400),
                  child: const Text(
                    'Based in Palakkad, Kerala, I specialize in building scalable ERP and CRM solutions, implementing complex API integrations, and delivering polished user experiences.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFAAAAAA),
                      height: 1.8,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                ScrollAnimatedItem(
                  delay: const Duration(milliseconds: 500),
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 24,
                    children: [
                      _buildStat('2+', 'Years Experience'),
                      _buildStat('15+', 'Projects Completed'),
                      _buildStat('2+', 'Apps Published'),
                    ],
                  ),
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
}