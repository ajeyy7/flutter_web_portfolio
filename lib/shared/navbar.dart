import 'package:flutter/material.dart';
class NavBar extends StatelessWidget {
  final String activeSection;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.activeSection,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onExperienceTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF242424).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xFF2a2a2a), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _NavItem(label: 'About', onTap: onAboutTap, isActive: activeSection == 'About'),
            const SizedBox(width: 32),
            _NavItem(label: 'Skills', onTap: onSkillsTap, isActive: activeSection == 'Skills'),
            const SizedBox(width: 32),
            _NavItem(label: 'Experience', onTap: onExperienceTap, isActive: activeSection == 'Experience'),
            const SizedBox(width: 32),
            _NavItem(label: 'Projects', onTap: onProjectsTap, isActive: activeSection == 'Projects'),
            const SizedBox(width: 32),
            _NavItem(label: 'Contact', onTap: onContactTap, isActive: activeSection == 'Contact'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _NavItem({
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHighlighted = widget.isActive || _isHovered;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isHighlighted ? const Color(0xFF00FFA3) : Colors.white,
                fontSize: 14,
                fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(widget.label),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: widget.isActive ? 24 : 0,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00FFA3), Color(0xFF00D9FF)],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
