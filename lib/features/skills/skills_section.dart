import 'package:Portfolio_Ajay/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                'EXPERTISE',
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
              colors: [Colors.white, Colors.white.withValues(alpha:0.8)],
            ).createShader(bounds),
            child: const Text(
              'Skills & Technologies',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.2,
                letterSpacing: -1,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Subtitle
          Text(
            'Tools and technologies I work with to bring ideas to life',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 80),

          // Skills Grid
          _buildSkillsGrid(),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid() {
    final skills = [
      {'svg': dartSvg, 'name': 'Dart', 'color': Color(0xFF0175C2)},
      {'svg': cSvg, 'name': 'C', 'color': Color(0xFFA8B9CC)},
      {'svg': cPlusPlusSvg, 'name': 'C++', 'color': Color(0xFF00599C)},
      {'svg': firebaseSvg, 'name': 'Firebase', 'color': Color(0xFFFFCA28)},
      {'svg': linuxSvg, 'name': 'Linux', 'color': Color(0xFFFCC624)},
      {'svg': pythonSvg, 'name': 'Python', 'color': Color(0xFF3776AB)},
      {'svg': gazeboSvg, 'name': 'Gazebo', 'color': Color(0xFFFF6B35)},
      {'svg': flutterSvg, 'name': 'Flutter', 'color': Color(0xFF02569B)},
      {'svg': gitSvg, 'name': 'Git', 'color': Color(0xFFF05032)},
      {'svg': figmaSvg, 'name': 'Figma', 'color': Color(0xFFF24E1E)},
      {'svg': nodeSvg, 'name': 'Node.js', 'color': Color(0xFF339933)},
      {'svg': postmanSvg, 'name': 'Postman', 'color': Color(0xFFFF6C37)},
      {'svg': javaScriptSvg, 'name': 'JavaScript', 'color': Color(0xFFF7DF1E)},
    ];

    return Wrap(
      spacing: isDesktop ? 24 : 16,
      runSpacing: isDesktop ? 24 : 16,
      children: List.generate(
        skills.length,
        (index) => SkillIcon(
          svg: skills[index]['svg'] as String,
          name: skills[index]['name'] as String,
          accentColor: skills[index]['color'] as Color,
          isDesktop: isDesktop,
        ),
      ),
    );
  }
}

class SkillIcon extends StatefulWidget {
  final String svg;
  final String name;
  final Color accentColor;
  final bool isDesktop;

  const SkillIcon({
    super.key,
    required this.svg,
    required this.name,
    required this.accentColor,
    required this.isDesktop,
  });

  @override
  State<SkillIcon> createState() => _SkillIconState();
}

class _SkillIconState extends State<SkillIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = widget.isDesktop ? 110.0 : 85.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.accentColor.withValues(alpha:0.1),
                    widget.accentColor.withValues(alpha:0.05),
                  ],
                )
              : null,
          color: _isHovered ? null : Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? widget.accentColor.withValues(alpha:0.6)
                : Colors.grey.shade800,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withValues(alpha:0.3),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha:0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size * 0.45,
              width: size * 0.45,
              child: SvgPicture.asset(
                widget.svg,
                
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: widget.isDesktop ? 12 : 10,
                fontWeight: _isHovered
                    ? FontWeight.w700
                    : FontWeight.w600,
                color: _isHovered
                    ? widget.accentColor
                    : Colors.white70,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
