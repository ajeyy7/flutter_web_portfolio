import 'package:Portfolio_Ajay/shared/scroll_animation.dart';
import 'package:flutter/material.dart';

class ContactMeSection extends StatelessWidget {
  final bool isDesktop;
  const ContactMeSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        children: [
          ScrollAnimatedItem(
            child: const Text(
              'GET IN TOUCH',
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
              "Let's work together",
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          ScrollAnimatedItem(
            delay: const Duration(milliseconds: 200),
            child: Wrap(
              spacing: 60,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
                _buildContactItem('Email', 'ajaykrishna9872@gmail.com'),
                _buildContactItem('Phone', '+91 984 657 2149'),
                _buildContactItem('Location', 'Kerala,India'),
              ],
            ),
          ),
          const SizedBox(height: 80),
          ScrollAnimatedItem(
            delay: const Duration(milliseconds: 300),
            child: const Text(
              '© 2026 AjayKrishna. All rights reserved.',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
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
}
