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
          // Section Label with accent
          ScrollAnimatedItem(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00D4FF),
                        Color(0xFF0099FF),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'PORTFOLIO',
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 3,
                    color: Color(0xFF00D4FF),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Main Title
          ScrollAnimatedItem(
            delay: const Duration(milliseconds: 100),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withValues(alpha:0.8),
                ],
              ).createShader(bounds),
              child: const Text(
                'Featured Projects',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.2,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Subtitle
          ScrollAnimatedItem(
            delay: const Duration(milliseconds: 150),
            child: Text(
              'End-to-end solutions across diverse domains with modern tech stacks',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 80),

          // Projects Grid
          if (isDesktop)
            Wrap(
              spacing: 32,
              runSpacing: 32,
              children: projects.asMap().entries
                  .map(
                    (entry) => ScrollAnimatedItem(
                      delay: Duration(milliseconds: 200 + (entry.key * 100)),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 304) / 2,
                        child: ProjectCard(
                          name: entry.value['name'] as String,
                          category: entry.value['category'] as String,
                          description: entry.value['description'] as String,
                          tech: entry.value['tech'] as List<String>,
                          features: entry.value['features'] as List<String>,
                          playStoreUrl: entry.value['playStoreUrl'] as String?,
                          index: entry.key,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          else
            ...projects.asMap().entries.map(
                  (entry) => ScrollAnimatedItem(
                    delay: Duration(milliseconds: 200 + (entry.key * 100)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: ProjectCard(
                        name: entry.value['name'] as String,
                        category: entry.value['category'] as String,
                        description: entry.value['description'] as String,
                        tech: entry.value['tech'] as List<String>,
                        features: entry.value['features'] as List<String>,
                        playStoreUrl: entry.value['playStoreUrl'] as String?,
                        index: entry.key,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String name;
  final String category;
  final String description;
  final List<String> tech;
  final List<String> features;
  final String? playStoreUrl;
  final int index;

  const ProjectCard({
    super.key,
    required this.name,
    required this.category,
    required this.description,
    required this.tech,
    required this.features,
    this.playStoreUrl,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;
  late Animation<Offset> _slideAnimation;

  // Project accent colors
  final List<Color> _accentColors = [
    Color(0xFF00D9FF), // OpporTune - Cyan
    Color(0xFF00FF88), // ReadyShip - Green
    Color(0xFFFF6B35), // Target - Orange
    Color(0xFFFF3D71), // FitLife - Pink/Red
    Color(0xFFFFB800), // ToxiScan - Yellow/Gold
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _elevationAnimation = Tween<double>(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.02),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _accentColor => _accentColors[widget.index % _accentColors.length];

  Future<void> _launchPlayStore() async {
    if (widget.playStoreUrl != null) {
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: _slideAnimation,
            child: Container(
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                gradient: _isHovered
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1A1A1A),
                          _accentColor.withValues(alpha:0.03),
                        ],
                      )
                    : null,
                color: _isHovered ? null : const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isHovered
                      ? _accentColor.withValues(alpha:0.4)
                      : const Color(0xFF2a2a2a),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? _accentColor.withValues(alpha:0.15)
                        : Colors.black.withValues(alpha:0.2),
                    blurRadius: _isHovered ? 24 : 12,
                    spreadRadius: 0,
                    offset: Offset(0, _elevationAnimation.value),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: Category + Play Store Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Category with accent indicator
                      Row(
                        children: [
                          Container(
                            width: 3,
                            height: 14,
                            decoration: BoxDecoration(
                              color: _accentColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.category.toUpperCase(),
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 2.5,
                              color: _accentColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      
                      // Play Store Badge
                      if (widget.playStoreUrl != null)
                        GestureDetector(
                          onTap: _launchPlayStore,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _accentColor.withValues(alpha:0.15),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: _accentColor.withValues(alpha:0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.shop,
                                  size: 14,
                                  color: _accentColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'LIVE',
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 1.5,
                                    color: _accentColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Project Name
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFB0B0B0),
                      height: 1.7,
                      letterSpacing: 0.2,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Key Features Section
                  Text(
                    'KEY FEATURES',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.features.take(3).map((feature) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF242424),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: _isHovered
                                ? _accentColor.withValues(alpha:0.2)
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 12,
                              color: _accentColor.withValues(alpha:0.7),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              feature,
                              style: TextStyle(
                                fontSize: 11,
                                color: const Color(0xFF999999),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Tech Stack
                  Text(
                    'TECH STACK',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.tech
                        .map(
                          (t) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _isHovered
                                  ? _accentColor.withValues(alpha:0.1)
                                  : const Color(0xFF242424),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _isHovered
                                    ? _accentColor.withValues(alpha:0.3)
                                    : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              t,
                              style: TextStyle(
                                fontSize: 12,
                                color: _isHovered
                                    ? _accentColor.withValues(alpha:0.9)
                                    : const Color(0xFF888888),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 28),

                  // View Details Arrow
                  AnimatedOpacity(
                    opacity: _isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Row(
                      children: [
                        Text(
                          widget.playStoreUrl != null ? 'View on Play Store' : 'View Details',
                          style: TextStyle(
                            fontSize: 13,
                            color: _accentColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: _accentColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}