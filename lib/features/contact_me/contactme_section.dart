import 'package:Portfolio_Ajay/core/constants/constants.dart';
import 'package:Portfolio_Ajay/core/utils/responsive.dart';
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
    final Uri url = Uri.parse('https://linkedin.com/in/ajeyyy');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/ajeyy7');
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
        horizontal: Responsive.padding(
          context,
          mobile: 20,
          tablet: 60,
          desktop: 120,
        ),
        vertical: Responsive.padding(
          context,
          mobile: 60,
          tablet: 90,
          desktop: 120,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Label with accent
          Row(
            children: [
              Container(
                width: Responsive.spacing(context, mobile: 30, desktop: 40),
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.cyan, AppColors.blue],
                  ),
                ),
              ),
              SizedBox(
                width: Responsive.spacing(context, mobile: 8, desktop: 12),
              ),
              Text(
                'CONTACT',
                style: TextStyle(
                  fontSize: Responsive.fontSize(
                    context,
                    mobile: 11,
                    desktop: 13,
                  ),
                  letterSpacing: Responsive.spacing(
                    context,
                    mobile: 2,
                    desktop: 3,
                  ),
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Responsive.spacing(context, mobile: 16, desktop: 24),
          ),

          // Main Title
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
            ).createShader(bounds),
            child: Text(
              "Let's Work Together",
              style: TextStyle(
                fontSize: Responsive.fontSize(
                  context,
                  mobile: 28,
                  tablet: 36,
                  desktop: 48,
                ),
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.2,
                letterSpacing: -1,
              ),
            ),
          ),

          SizedBox(
            height: Responsive.spacing(context, mobile: 12, desktop: 16),
          ),

          // Subtitle
          Text(
            'Have an idea? Let\'s turn it into reality.',
            style: TextStyle(
              fontSize: Responsive.fontSize(context, mobile: 14, desktop: 16),
              color: Colors.grey.shade400,
              height: 1.6,
            ),
          ),

          SizedBox(
            height: Responsive.spacing(
              context,
              mobile: 20,
              tablet: 64,
              desktop: 80,
            ),
          ),

          // Contact Info Grid
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column - Contact Details
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Responsive.spacing(
                      context,
                      mobile: 20,
                      tablet: 32,
                      desktop: 32,
                    ),
                    children: [
                      _buildContactItem(
                        context: context,
                        label: 'Email',
                        value: 'ajaykrishna9872@gmail.com',
                        onTap: _launchEmail,
                        onCopy: () => _copyToClipboard(
                          context,
                          'ajaykrishna9872@gmail.com',
                          'Email',
                        ),
                      ),
                      _buildContactItem(
                        context: context,
                        label: 'Phone',
                        value: '+91 984 657 2149',
                        onTap: _launchPhone,
                        onCopy: () => _copyToClipboard(
                          context,
                          '+91 984 657 2149',
                          'Phone',
                        ),
                      ),
                      _buildContactItem(
                        context: context,
                        label: 'Location',
                        value: 'Kerala, India',
                        onTap: null,
                        onCopy: () => _copyToClipboard(
                          context,
                          'Kerala, India',
                          'Location',
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: Responsive.spacing(
                    context,
                    mobile: 20,
                    tablet: 64,
                    desktop: 80,
                  ),
                ),

                // Right Column - Social & CTA
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SOCIAL',
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 2,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildSocialLink(
                        context,
                        'GitHub',
                        'https://github.com/ajeyy7',
                        _launchGitHub,
                      ),
                      const SizedBox(height: 16),
                      _buildSocialLink(
                        context,
                        'LinkedIn',
                        'www.linkedin.com/in/ajeyyy',
                        _launchLinkedIn,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContactItem(
                  context: context,
                  label: 'Email',
                  value: 'ajaykrishna9872@gmail.com',
                  onTap: _launchEmail,
                  onCopy: () => _copyToClipboard(
                    context,
                    'ajaykrishna9872@gmail.com',
                    'Email',
                  ),
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 20, desktop: 32),
                ),
                _buildContactItem(
                  context: context,
                  label: 'Phone',
                  value: '+91 984 657 2149',
                  onTap: _launchPhone,
                  onCopy: () =>
                      _copyToClipboard(context, '+91 984 657 2149', 'Phone'),
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 20, desktop: 32),
                ),
                _buildContactItem(
                  context: context,
                  label: 'Location',
                  value: 'Kerala, India',
                  onTap: null,
                  onCopy: () =>
                      _copyToClipboard(context, 'Kerala, India', 'Location'),
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 35, desktop: 60),
                ),
                Text(
                  'SOCIAL',
                  style: TextStyle(
                    fontSize: Responsive.fontSize(
                      context,
                      mobile: 10,
                      desktop: 11,
                    ),
                    letterSpacing: 2,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 16, desktop: 24),
                ),
                _buildSocialLink(
                  context,
                  'GitHub',
                  'https://github.com/ajeyy7',
                  _launchGitHub,
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 12, desktop: 16),
                ),
                _buildSocialLink(
                  context,
                  'LinkedIn',
                  'www.linkedin.com/in/ajeyyy',
                  _launchLinkedIn,
                ),
              ],
            ),

          SizedBox(
            height: Responsive.spacing(
              context,
              mobile: 60,
              tablet: 80,
              desktop: 100,
            ),
          ),

          // Footer
          Center(
            child: Column(
              children: [
                Container(
                  width: Responsive.spacing(context, mobile: 40, desktop: 60),
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00D9FF).withValues(alpha: 0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 16, desktop: 24),
                ),
                Text(
                  '© 2026 AjayKrishna. Built with Flutter 💙',
                  style: TextStyle(
                    fontSize: Responsive.fontSize(
                      context,
                      mobile: 12,
                      desktop: 14,
                    ),
                    color: Color(0xFF666666),
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 6, desktop: 8),
                ),
                Text(
                  'All rights reserved.',
                  style: TextStyle(
                    fontSize: Responsive.fontSize(
                      context,
                      mobile: 11,
                      desktop: 12,
                    ),
                    color: Color(0xFF444444),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required BuildContext context,
    required String label,
    required String value,
    required VoidCallback? onTap,
    required VoidCallback onCopy,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: Responsive.fontSize(context, mobile: 10, desktop: 11),
            letterSpacing: 2,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: Responsive.spacing(context, mobile: 8, desktop: 12)),
        Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: Responsive.fontSize(
                    context,
                    mobile: 16,
                    desktop: 20,
                  ),
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            SizedBox(
              width: Responsive.spacing(context, mobile: 12, desktop: 16),
            ),
            if (onTap != null)
              _buildIconButton(context, Icons.arrow_outward, onTap),
            SizedBox(width: Responsive.spacing(context, mobile: 6, desktop: 8)),
            if (onTap != null)
              _buildIconButton(context, Icons.content_copy, onCopy),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(
            Responsive.padding(context, mobile: 6, desktop: 8),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF242424),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xFF2a2a2a), width: 1),
          ),
          child: Icon(
            icon,
            size: Responsive.fontSize(context, mobile: 14, desktop: 16),
            color: Color(0xFF00D9FF),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLink(
    BuildContext context,
    String platform,
    String username,
    VoidCallback onTap,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.padding(context, mobile: 10, desktop: 12),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFF2a2a2a), width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platform,
                    style: TextStyle(
                      fontSize: Responsive.fontSize(
                        context,
                        mobile: 14,
                        desktop: 16,
                      ),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: Responsive.fontSize(
                        context,
                        mobile: 12,
                        desktop: 13,
                      ),
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_outward,
                size: Responsive.fontSize(context, mobile: 16, desktop: 18),
                color: Color(0xFF00D9FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
