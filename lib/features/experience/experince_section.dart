import 'package:Portfolio_Ajay/core/constants/constants.dart';
import 'package:Portfolio_Ajay/core/utils/responsive.dart';
import 'package:Portfolio_Ajay/data/experince.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  const ExperienceSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context, mobile: 20, tablet: 60, desktop: 120),
        vertical: Responsive.padding(context, mobile: 60, tablet: 90, desktop: 120),
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
              SizedBox(width: Responsive.spacing(context, mobile: 8, desktop: 12)),
              Text(
                'JOURNEY',
                style: TextStyle(
                  fontSize: Responsive.fontSize(context, mobile: 11, desktop: 13),
                  letterSpacing: Responsive.spacing(context, mobile: 2, desktop: 3),
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: Responsive.spacing(context, mobile: 16, desktop: 24)),

          // Main Title
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
            ).createShader(bounds),
            child: Text(
              'Professional Experience',
              style: TextStyle(
                fontSize: Responsive.fontSize(context, mobile: 28, tablet: 36, desktop: 48),
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.2,
                letterSpacing: -1,
              ),
            ),
          ),

          SizedBox(height: Responsive.spacing(context, mobile: 12, desktop: 16)),

          // Subtitle
          Text(
            'My journey building scalable applications and real-time systems',
            style: TextStyle(
              fontSize: Responsive.fontSize(context, mobile: 14, desktop: 16),
              color: Colors.grey.shade400,
              height: 1.6,
            ),
          ),

          SizedBox(height: Responsive.spacing(context, mobile: 48, tablet: 64, desktop: 80)),

          // Experience Timeline
          ...experiences.asMap().entries.map((entry) {
            final exp = entry.value;
            return ExperienceCard(
              company: exp['company'] as String,
              role: exp['role'] as String,
              period: exp['period'] as String,
              location: exp['location'] as String,
              type: exp['type'] as String,
              description: exp['description'] as String,
              highlights: exp['highlights'] as List<String>,
              isDesktop: isDesktop,
              index: entry.key,
              isLast: entry.key == experiences.length - 1,
            );
          }),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final String company;
  final String role;
  final String period;
  final String location;
  final String type;
  final String description;
  final List<String> highlights;
  final bool isDesktop;
  final int index;
  final bool isLast;

  const ExperienceCard({
    super.key,
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.type,
    required this.description,
    required this.highlights,
    required this.isDesktop,
    required this.index,
    required this.isLast,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;
  bool _isExpanded = false;

  // Experience accent colors
  final List<Color> _accentColors = [
    Color(0xFF00FFA3), // AlgoBotix - Green (Current)
    Color(0xFF00D9FF), // RAG Technologies - Cyan
    Color(0xFFFF6B35), // Luminar - Orange
  ];

  Color get _accentColor => _accentColors[widget.index % _accentColors.length];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: EdgeInsets.only(
          bottom: widget.isLast ? 0 : Responsive.spacing(context, mobile: 32, desktop: 40),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                // Dot
                Container(
                  width: Responsive.spacing(context, mobile: 14, desktop: 16),
                  height: Responsive.spacing(context, mobile: 14, desktop: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _accentColor,
                        _accentColor.withValues(alpha: 0.6),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: _accentColor.withValues(alpha: 0.5),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Connecting line
                if (!widget.isLast)
                  Container(
                    width: 2,
                    height: Responsive.spacing(context, mobile: 140, desktop: 180),
                    margin: EdgeInsets.symmetric(
                      vertical: Responsive.spacing(context, mobile: 6, desktop: 8),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _accentColor.withValues(alpha: 0.3),
                          _accentColors[(widget.index + 1) %
                                  _accentColors.length]
                              .withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(width: Responsive.spacing(context, mobile: 20, desktop: 32)),

            // Content Card
            Expanded(
              child: Container(
                padding: EdgeInsets.all(Responsive.padding(context, mobile: 20, tablet: 28, desktop: 32)),
                decoration: BoxDecoration(
                  gradient: _isHovered
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF1A1A1A),
                            _accentColor.withValues(alpha: 0.03),
                          ],
                        )
                      : null,
                  color: _isHovered ? null : const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _isHovered
                        ? _accentColor.withValues(alpha: 0.4)
                        : const Color(0xFF2a2a2a),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovered
                          ? _accentColor.withValues(alpha: 0.15)
                          : Colors.black.withValues(alpha: 0.2),
                      blurRadius: _isHovered ? 24 : 12,
                      spreadRadius: 0,
                      offset: Offset(0, _isHovered ? 8 : 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Company Name
                              Text(
                                widget.company,
                                style: TextStyle(
                                  fontSize: Responsive.fontSize(context, mobile: 20, tablet: 24, desktop: 28),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: Responsive.spacing(context, mobile: 6, desktop: 8)),

                              // Role
                              Text(
                                widget.role,
                                style: TextStyle(
                                  fontSize: Responsive.fontSize(context, mobile: 14, tablet: 16, desktop: 18),
                                  color: _accentColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),

                              // Period badge - only show in mobile
                              if (!widget.isDesktop) ...[
                                SizedBox(height: Responsive.spacing(context, mobile: 10, desktop: 12)),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Responsive.padding(context, mobile: 8, desktop: 8),
                                    vertical: Responsive.padding(context, mobile: 4, desktop: 2),
                                  ),
                                  decoration: BoxDecoration(
                                    color: _accentColor.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _accentColor.withValues(
                                        alpha: 0.3,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    widget.period,
                                    style: TextStyle(
                                      fontSize: Responsive.fontSize(context, mobile: 10, desktop: 8),
                                      color: _accentColor,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Responsive.spacing(context, mobile: 10, desktop: 12)),
                              ],

                              // Location & Type
                              Row(
                                spacing: Responsive.spacing(context, mobile: 6, tablet: 8, desktop: 12),
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: Responsive.fontSize(context, mobile: 12, tablet: 14, desktop: 16),
                                    color: Colors.grey.shade600,
                                  ),
                                  Text(
                                    widget.location,
                                    style: TextStyle(
                                      fontSize: Responsive.fontSize(context, mobile: 12, tablet: 13, desktop: 14),
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade700,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    widget.type,
                                    style: TextStyle(
                                      fontSize: Responsive.fontSize(context, mobile: 12, tablet: 13, desktop: 14),
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Period badge - only show in desktop
                        if (widget.isDesktop)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _accentColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _accentColor.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              widget.period,
                              style: TextStyle(
                                fontSize: 13,
                                color: _accentColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                      ],
                    ),

                    SizedBox(height: Responsive.spacing(context, mobile: 16, tablet: 20, desktop: 24)),

                    // Description
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: Responsive.fontSize(context, mobile: 13, tablet: 14, desktop: 15),
                        color: Color(0xFFB0B0B0),
                        height: 1.7,
                        letterSpacing: 0.2,
                      ),
                    ),

                    SizedBox(height: Responsive.spacing(context, mobile: 20, desktop: 24)),

                    // Expandable Key Highlights
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'KEY HIGHLIGHTS',
                            style: TextStyle(
                              fontSize: Responsive.fontSize(context, mobile: 10, desktop: 11),
                              letterSpacing: 2,
                              color: _accentColor.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: Responsive.spacing(context, mobile: 6, desktop: 8)),
                          Icon(
                            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: Responsive.fontSize(context, mobile: 18, desktop: 20),
                            color: _accentColor,
                          ),
                        ],
                      ),
                    ),

                    if (_isExpanded) ...[
                      SizedBox(height: Responsive.spacing(context, mobile: 12, desktop: 16)),
                      ...widget.highlights.map((highlight) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: Responsive.spacing(context, mobile: 10, desktop: 12),
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: Responsive.spacing(context, mobile: 5, desktop: 6),
                                ),
                                width: Responsive.spacing(context, mobile: 5, desktop: 6),
                                height: Responsive.spacing(context, mobile: 5, desktop: 6),
                                decoration: BoxDecoration(
                                  color: _accentColor.withValues(
                                    alpha: 0.6,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: Responsive.spacing(context, mobile: 10, desktop: 12)),
                              Expanded(
                                child: Text(
                                  highlight,
                                  style: TextStyle(
                                    fontSize: Responsive.fontSize(context, mobile: 13, desktop: 14),
                                    color: Color(0xFF999999),
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
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
