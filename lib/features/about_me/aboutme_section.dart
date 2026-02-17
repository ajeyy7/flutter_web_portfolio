import 'package:Portfolio_Ajay/core/constants/constants.dart';
import 'package:Portfolio_Ajay/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  final bool isDesktop;
  const AboutMeSection({super.key, required this.isDesktop});

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
                width: Responsive.spacing(context, mobile: 20, desktop: 40),
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
                'ABOUT',
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

          // Main Title with gradient
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
            ).createShader(bounds),
            child: Text(
              'Who I Am & What I Do',
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
            height: Responsive.spacing(
              context,
              mobile: 32,
              tablet: 48,
              desktop: 60,
            ),
          ),

          // Main Content - Two Column Layout on Desktop
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContentColumn()),
                const SizedBox(width: 80),
                Expanded(child: _buildStatsAndHighlights()),
              ],
            )
          else
            Column(
              children: [
                _buildContentColumn(),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 40, desktop: 60),
                ),
                _buildStatsAndHighlights(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContentColumn() {
    return Builder(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Description
          Text(
            'I\'m a Flutter developer passionate about building elegant, scalable applications. My focus is on creating seamless user experiences while maintaining clean, maintainable code.',
            style: TextStyle(
              fontSize: Responsive.fontSize(context, mobile: 14, desktop: 16),
              color: Color(0xFFB0B0B0),
              height: 1.8,
              letterSpacing: 0.2,
            ),
          ),

          SizedBox(
            height: Responsive.spacing(context, mobile: 24, desktop: 32),
          ),

          // Process Section
          Container(
            padding: EdgeInsets.all(
              Responsive.padding(context, mobile: 20, desktop: 28),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(
                Responsive.spacing(context, mobile: 12, desktop: 16),
              ),
              border: Border.all(color: Color(0xFF2a2a2a), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        Responsive.padding(context, mobile: 6, desktop: 8),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF00D9FF).withValues(alpha: 0.2),
                            Color(0xFF00FFA3).withValues(alpha: 0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.rocket_launch,
                        color: Color(0xFF00D9FF),
                        size: Responsive.fontSize(
                          context,
                          mobile: 16,
                          desktop: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Responsive.spacing(
                        context,
                        mobile: 8,
                        desktop: 12,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'End-to-End Development',
                        style: TextStyle(
                          fontSize: Responsive.fontSize(
                            context,
                            mobile: 14,
                            desktop: 16,
                          ),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Responsive.spacing(context, mobile: 16, desktop: 20),
                ),
                _buildProcessStep(context, 'Idea Validation', '01'),
                _buildProcessStep(context, 'Design', '02'),
                _buildProcessStep(context, 'Development', '03'),
                _buildProcessStep(context, 'Deployment', '04'),
              ],
            ),
          ),

          SizedBox(
            height: Responsive.spacing(context, mobile: 24, desktop: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsAndHighlights() {
    return Builder(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Specializations
          Container(
            padding: EdgeInsets.all(
              Responsive.padding(context, mobile: 20, desktop: 28),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(
                Responsive.spacing(context, mobile: 16, desktop: 20),
              ),
              border: Border.all(color: Color(0xFF2a2a2a), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SPECIALIZATIONS',
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
                  height: Responsive.spacing(context, mobile: 16, desktop: 20),
                ),
                _buildSpecialization(
                  context,
                  Icons.code,
                  'Clean Architecture',
                  'Scalable & maintainable code',
                ),
                _buildSpecialization(
                  context,
                  Icons.layers,
                  'State Management',
                  'Provider, Riverpod, GetX, BLoC',
                ),
                _buildSpecialization(
                  context,
                  Icons.api,
                  'API Integration',
                  'RESTful & real-time data',
                ),
                _buildSpecialization(
                  context,
                  Icons.devices,
                  'Cross-Platform',
                  'Mobile, Web & Desktop',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(BuildContext context, String title, String number) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Responsive.spacing(context, mobile: 12, desktop: 16),
      ),
      child: Row(
        children: [
          Container(
            width: Responsive.spacing(context, mobile: 28, desktop: 32),
            height: Responsive.spacing(context, mobile: 28, desktop: 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00D9FF).withValues(alpha: 0.2),
                  Color(0xFF00FFA3).withValues(alpha: 0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFF00D9FF).withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: Responsive.fontSize(
                    context,
                    mobile: 11,
                    desktop: 12,
                  ),
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF00D9FF),
                ),
              ),
            ),
          ),
          SizedBox(width: Responsive.spacing(context, mobile: 12, desktop: 16)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: Responsive.fontSize(context, mobile: 13, desktop: 14),
                color: Color(0xFFB0B0B0),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: Responsive.fontSize(context, mobile: 14, desktop: 16),
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialization(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Responsive.spacing(context, mobile: 16, desktop: 20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(
              Responsive.padding(context, mobile: 8, desktop: 10),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Color(0xFF00D9FF),
              size: Responsive.fontSize(context, mobile: 18, desktop: 20),
            ),
          ),
          SizedBox(width: Responsive.spacing(context, mobile: 12, desktop: 16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Responsive.fontSize(
                      context,
                      mobile: 13,
                      desktop: 14,
                    ),
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: Responsive.fontSize(
                      context,
                      mobile: 11,
                      desktop: 12,
                    ),
                    color: Color(0xFF888888),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
