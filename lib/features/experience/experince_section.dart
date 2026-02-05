import 'package:Portfolio_Ajay/core/constants/constants.dart';
import 'package:Portfolio_Ajay/data/experince.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  const ExperienceSection({super.key, required this.isDesktop});

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
                'JOURNEY',
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

          // Main Title
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
            ).createShader(bounds),
            child: const Text(
              'Professional Experience',
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
            'My journey building scalable applications and real-time systems',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 80),

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
        margin: EdgeInsets.only(bottom: widget.isLast ? 0 : 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                // Dot
                Container(
                  width: 16,
                  height: 16,
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
                    height: 180,
                    margin: const EdgeInsets.symmetric(vertical: 8),
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

            const SizedBox(width: 32),

            // Content Card
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
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
                                  fontSize: widget.isDesktop ? 28 : 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Role
                              Text(
                                widget.role,
                                style: TextStyle(
                                  fontSize: widget.isDesktop ? 18 : 16,
                                  color: _accentColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),

                              // Period badge - only show in mobile
                              if (!widget.isDesktop) ...[
                                const SizedBox(height: 12),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
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
                                      fontSize: 8,
                                      color: _accentColor,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],

                              // Location & Type
                              Row(
                                spacing: widget.isDesktop ? 12 : 4,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: widget.isDesktop ? 16 : 10,
                                    color: Colors.grey.shade600,
                                  ),
                                  Text(
                                    widget.location,
                                    style: TextStyle(
                                      fontSize: widget.isDesktop ? 14 : 10,
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
                                      fontSize: widget.isDesktop ? 14 : 10,
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

                    SizedBox(height: widget.isDesktop ? 24 : 16),

                    // Description
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: widget.isDesktop ? 15 : 14,
                        color: Color(0xFFB0B0B0),
                        height: 1.7,
                        letterSpacing: 0.2,
                      ),
                    ),

                    const SizedBox(height: 24),

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
                              fontSize: 11,
                              letterSpacing: 2,
                              color: _accentColor.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 20,
                            color: _accentColor,
                          ),
                        ],
                      ),
                    ),

                    if (_isExpanded) ...[
                      const SizedBox(height: 16),
                      ...widget.highlights.map((highlight) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 6,
                                ),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: _accentColor.withValues(
                                    alpha: 0.6,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  highlight,
                                  style: TextStyle(
                                    fontSize: 14,
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
