import 'package:Portfolio_Ajay/core/constants/constants.dart';
import 'package:Portfolio_Ajay/core/utils/responsive.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.spacing(context, mobile: 14, desktop: 24),
          vertical: Responsive.spacing(context, mobile: 14, desktop: 16),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF242424).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(
            Responsive.spacing(context, mobile: 25, desktop: 50),
          ),
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
          spacing: Responsive.spacing(context, mobile: 10, desktop: 32),
          children: [
            _NavItem(
              label: 'About',
              onTap: onAboutTap,
              isActive: activeSection == 'About',
            ),
            _NavItem(
              label: 'Skills',
              onTap: onSkillsTap,
              isActive: activeSection == 'Skills',
            ),
            _NavItem(
              label: 'Experience',
              onTap: onExperienceTap,
              isActive: activeSection == 'Experience',
            ),
            _NavItem(
              label: 'Projects',
              onTap: onProjectsTap,
              isActive: activeSection == 'Projects',
            ),
            _NavItem(
              label: 'Contact',
              onTap: onContactTap,
              isActive: activeSection == 'Contact',
            ),
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
                color: isHighlighted ? AppColors.cyan : Colors.white,
                fontSize: Responsive.fontSize(context, mobile: 12, desktop: 14),
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
                  colors: [AppColors.cyan, AppColors.blue],
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
