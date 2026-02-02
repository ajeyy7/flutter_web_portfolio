import 'package:Portfolio_Ajay/features/home/home.dart';
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
  late List<Animation<double>> _stripFadeAnimations;
  late AnimationController _textController;
  late Animation<double> _textAnimation;
  late List<AnimationController> _letterControllers;
  late List<Animation<Offset>> _letterSlideAnimations;

  final List<String> _letters = "AJAY".split('');

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

    // Strip fade animations (NEW)
    _stripFadeControllers = List.generate(
      _stripCount,
      (_) => AnimationController(duration: _stripFadeDuration, vsync: this),
    );
    _stripFadeAnimations = _stripFadeControllers
        .map(
          (controller) => Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        )
        .toList();
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

    // Animate strips sequentially (falling down)
    for (int i = 0; i < _stripControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * _stripDelayMs), () {
        if (mounted) {
          _stripControllers[i].forward();
          
          // Start fading the strip as soon as it reaches the bottom
          Future.delayed(_stripDuration, () {
            if (mounted) _stripFadeControllers[i].forward();
          });
        }
      });
    }

    // Navigate to home after animation
    final totalDuration = _stripDuration.inMilliseconds +
        (_stripCount * _stripDelayMs) +
        _stripFadeDuration.inMilliseconds +
        300;
    await Future.delayed(Duration(milliseconds: totalDuration));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
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
    final screenWidth = MediaQuery.of(context).size.width;
    final stripWidth = screenWidth / _stripCount;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Developer name in center with slide and fade animations
          Center(
            child: FadeTransition(
              opacity: _textAnimation,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_letters.length, (index) {
                  return SlideTransition(
                    position: _letterSlideAnimations[index],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        _letters[index],
                        style: const TextStyle(
                          fontSize: 140,
                          fontWeight: FontWeight.w900,
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

          // Animated strips with fade effect
          ...List.generate(_stripCount, (index) {
            return AnimatedBuilder(
              animation: Listenable.merge([
                _stripAnimations[index],
                _stripFadeAnimations[index],
              ]),
              builder: (context, _) {
                return Positioned(
                  left: index * stripWidth,
                  top: 0,
                  child: Opacity(
                    opacity: _stripFadeAnimations[index].value,
                    child: Container(
                      width: stripWidth,
                      height: MediaQuery.of(context).size.height *
                          _stripAnimations[index].value,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}