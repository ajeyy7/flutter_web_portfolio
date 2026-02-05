import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Animation constants
  static const int _stripCount = 10;
  static const Duration _stripDuration = Duration(milliseconds: 500);
  static const int _stripDelayMs = 120;
  static const Duration _textFadeDuration = Duration(milliseconds: 600);
  static const Duration _letterSlideDuration = Duration(milliseconds: 500);
  static const int _letterDelayMs = 100;
  static const Duration _stripFadeDuration = Duration(milliseconds: 800);

  late List<AnimationController> _stripControllers;
  late List<Animation<double>> _stripAnimations;
  late List<AnimationController> _stripFadeControllers;
  late AnimationController _textController;
  late Animation<double> _textAnimation;
  late List<AnimationController> _letterControllers;
  late List<Animation<Offset>> _letterSlideAnimations;
  late AnimationController _overlayFadeController;
  late Animation<double> _overlayFadeAnimation;

  final List<String> _letters = "AJAY".split('');
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  void _initializeAnimations() {
    // Text fade animation
    _textController = AnimationController(
      duration: _textFadeDuration,
      vsync: this,
    );
    _textAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    // Letter slide animations
    _letterControllers = List.generate(
      _letters.length,
      (_) => AnimationController(duration: _letterSlideDuration, vsync: this),
    );
    _letterSlideAnimations = _letterControllers
        .map(
          (controller) => Tween<Offset>(
            begin: const Offset(0, 2), // Start from bottom
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
        )
        .toList();

    // Strip height animations
    _stripControllers = List.generate(
      _stripCount,
      (_) => AnimationController(duration: _stripDuration, vsync: this),
    );
    _stripAnimations = _stripControllers
        .map(
          (controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        )
        .toList();

    // Strip fade animations
    _stripFadeControllers = List.generate(
      _stripCount,
      (_) => AnimationController(duration: _stripFadeDuration, vsync: this),
    );

    // Overall overlay fade animation
    _overlayFadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _overlayFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _overlayFadeController, curve: Curves.easeInOut),
    );
  }

  Future<void> _startAnimation() async {
    // Animate letters coming from bottom one by one
    for (int i = 0; i < _letterControllers.length; i++) {
      await Future.delayed(Duration(milliseconds: _letterDelayMs));
      if (mounted) _letterControllers[i].forward();
    }

    // Hold the text for a moment
    await Future.delayed(const Duration(milliseconds: 500));

    // Fade out text
    _textController.forward();

    // Animate strips sequentially (falling down to reveal home screen)
    for (int i = 0; i < _stripControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * _stripDelayMs), () {
        if (mounted) {
          _stripControllers[i].forward();
        }
      });
    }

    // Wait for strips to complete, then fade out the entire overlay
    final totalDuration =
        _stripDuration.inMilliseconds +
        (_stripCount * _stripDelayMs) +
        500; // Small delay before final fade
    await Future.delayed(Duration(milliseconds: totalDuration));

    if (mounted) {
      await _overlayFadeController.forward();
      setState(() {
        _isVisible = false;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _overlayFadeController.dispose();
    for (var controller in _stripControllers) {
      controller.dispose();
    }
    for (var controller in _stripFadeControllers) {
      controller.dispose();
    }
    for (var controller in _letterControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return IgnorePointer(
      child: Material(
        color: Colors.transparent,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _overlayFadeAnimation,
            ..._stripAnimations,
          ]),
          builder: (context, child) {
            return CustomPaint(
              painter: SplashStripPainter(
                stripAnimations: _stripAnimations.map((a) => a.value).toList(),
                stripCount: _stripCount,
                overlayOpacity: _overlayFadeAnimation.value,
              ),
              child: FadeTransition(
                opacity: _overlayFadeAnimation,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: FadeTransition(
                      opacity: _textAnimation,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(_letters.length, (index) {
                          return SlideTransition(
                            position: _letterSlideAnimations[index],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Text(
                                _letters[index],
                                style: const TextStyle(
                                  fontSize: 140,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 8,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SplashStripPainter extends CustomPainter {
  final List<double> stripAnimations;
  final int stripCount;
  final double overlayOpacity;

  SplashStripPainter({
    required this.stripAnimations,
    required this.stripCount,
    required this.overlayOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: overlayOpacity)
      ..style = PaintingStyle.fill;

    final stripWidth = size.width / stripCount;

    for (int i = 0; i < stripCount; i++) {
      final stripHeight = size.height * stripAnimations[i];
      final rect = Rect.fromLTWH(
        i * stripWidth,
        stripHeight,
        stripWidth,
        size.height - stripHeight,
      );
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(SplashStripPainter oldDelegate) {
    return oldDelegate.overlayOpacity != overlayOpacity ||
        oldDelegate.stripAnimations != stripAnimations;
  }
}
