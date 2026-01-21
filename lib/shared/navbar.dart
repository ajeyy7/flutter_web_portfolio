import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF242424).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xFF2a2a2a), width: 1),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('About', style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(width: 32),
            Text('Skills', style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(width: 32),
            Text(
              'Experience',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(width: 32),
            Text(
              'Projects',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(width: 32),
            Text(
              'Contact',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
