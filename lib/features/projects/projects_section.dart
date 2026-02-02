import 'package:Portfolio_Ajay/data/projects.dart';
import 'package:Portfolio_Ajay/shared/scroll_animation.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  const ProjectsSection({super.key, required this.isDesktop});

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
          ScrollAnimatedItem(
            child: const Text(
              'PORTFOLIO',
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
            delay: const Duration(milliseconds: 100),
            child: const Text(
              'Featured Projects',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 60),
          if (isDesktop)
            Wrap(
              spacing: 32,
              runSpacing: 32,
              children: projects.asMap().entries
                  .map(
                    (entry) => ScrollAnimatedItem(
                      delay: Duration(milliseconds: 200 + (entry.key * 150)),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 304) / 3,
                        child: _buildProjectCard(
                          entry.value['name'] as String,
                          entry.value['category'] as String,
                          entry.value['description'] as String,
                          entry.value['tech'] as List<String>,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          else
            ...projects.asMap().entries.map(
                  (entry) => ScrollAnimatedItem(
                    delay: Duration(milliseconds: 200 + (entry.key * 150)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: _buildProjectCard(
                        entry.value['name'] as String,
                        entry.value['category'] as String,
                        entry.value['description'] as String,
                        entry.value['tech'] as List<String>,
                      ),
                    ),
                  ),
                ),
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
                  .map(
                    (t) => Container(
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
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}