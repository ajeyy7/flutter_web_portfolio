import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeSection extends StatelessWidget {
  final bool isDesktop;
  const ContactMeSection({super.key, required this.isDesktop});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ajaykrishna9872@gmail.com',
      query: 'subject=Let\'s Work Together',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+919846572149');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _launchLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/your-profile');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/your-username');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied to clipboard!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color(0xFF00D9FF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 40,
        vertical: 120,
      ),
      child: Column(
        children: [
          // Section Label with accent
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00D4FF), Color(0xFF0099FF)],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 3,
                  color: Color(0xFF00D4FF),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0099FF), Color(0xFF00D4FF)],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Main Title
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha:0.8)],
            ).createShader(bounds),
            child: Text(
              "Let's Work Together",
              style: TextStyle(
                fontSize: isDesktop ? 56 : 40,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.2,
                letterSpacing: -1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // Subtitle
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: Text(
              'Have a project in mind? Let\'s create something amazing together.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 80),

          // Contact Cards
          if (isDesktop)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ContactCard(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'ajaykrishna9872@gmail.com',
                    accentColor: Color(0xFF00D9FF),
                    onTap: _launchEmail,
                    onCopy: () => _copyToClipboard(
                      context,
                      'ajaykrishna9872@gmail.com',
                      'Email',
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Flexible(
                  child: ContactCard(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: '+91 984 657 2149',
                    accentColor: Color(0xFF00FFA3),
                    onTap: _launchPhone,
                    onCopy: () => _copyToClipboard(
                      context,
                      '+91 984 657 2149',
                      'Phone',
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Flexible(
                  child: ContactCard(
                    icon: Icons.location_on_outlined,
                    label: 'Location',
                    value: 'Kerala, India',
                    accentColor: Color(0xFFFF6B35),
                    onTap: null,
                    onCopy: () => _copyToClipboard(
                      context,
                      'Kerala, India',
                      'Location',
                    ),
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                ContactCard(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: 'ajaykrishna9872@gmail.com',
                  accentColor: Color(0xFF00D9FF),
                  onTap: _launchEmail,
                  onCopy: () => _copyToClipboard(
                    context,
                    'ajaykrishna9872@gmail.com',
                    'Email',
                  ),
                ),
                const SizedBox(height: 24),
                ContactCard(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: '+91 984 657 2149',
                  accentColor: Color(0xFF00FFA3),
                  onTap: _launchPhone,
                  onCopy: () =>
                      _copyToClipboard(context, '+91 984 657 2149', 'Phone'),
                ),
                const SizedBox(height: 24),
                ContactCard(
                  icon: Icons.location_on_outlined,
                  label: 'Location',
                  value: 'Kerala, India',
                  accentColor: Color(0xFFFF6B35),
                  onTap: null,
                  onCopy: () =>
                      _copyToClipboard(context, 'Kerala, India', 'Location'),
                ),
              ],
            ),

          const SizedBox(height: 80),

          // Social Links
          Column(
            children: [
              Text(
                'CONNECT WITH ME',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.code,
                    label: 'GitHub',
                    color: Color(0xFFFFFFFF),
                    onTap: _launchGitHub,
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: Icons.business_center,
                    label: 'LinkedIn',
                    color: Color(0xFF0077B5),
                    onTap: _launchLinkedIn,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 80),

          // Footer
          Column(
            children: [
              Container(
                width: 60,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF00D9FF).withValues(alpha:0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '© 2026 AjayKrishna. Built with Flutter 💙',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'All rights reserved.',
                style: TextStyle(fontSize: 12, color: Color(0xFF444444)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Contact Card Widget - NO ANIMATIONS
class ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color accentColor;
  final VoidCallback? onTap;
  final VoidCallback onCopy;

  const ContactCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.accentColor,
    this.onTap,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFF2a2a2a),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.2),
              blurRadius: 12,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor.withValues(alpha:0.2),
                    accentColor.withValues(alpha:0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: accentColor.withValues(alpha:0.3),
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                color: accentColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),

            // Label
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 2,
                color: accentColor.withValues(alpha:0.8),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            // Value
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Copy Button
            GestureDetector(
              onTap: onCopy,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha:0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: accentColor.withValues(alpha:0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.content_copy,
                      size: 14,
                      color: accentColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Copy',
                      style: TextStyle(
                        fontSize: 12,
                        color: accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Social Button Widget - NO ANIMATIONS
class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFF2a2a2a),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.grey.shade600,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
