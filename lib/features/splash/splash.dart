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
  static const int _stripCount = 20;
  static const Duration _stripDuration = Duration(milliseconds: 500);
  static const int _stripDelayMs = 30;
  static const Duration _textFadeDuration = Duration(milliseconds: 600);

  late List<AnimationController> _stripControllers;
  late List<Animation<double>> _stripAnimations;
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    // Wait for first frame to be rendered before starting animation
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

    // Strip animations
    _stripControllers = List.generate(
      _stripCount,
      (_) => AnimationController(duration: _stripDuration, vsync: this),
    );
    _stripAnimations = _stripControllers
        .map((controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: controller, curve: Curves.easeInOut),
            ))
        .toList();
  }

  Future<void> _startAnimation() async {
    // Show name briefly
    await Future.delayed(const Duration(milliseconds: 300));

    // Fade out text
    _textController.forward();

    // Animate strips sequentially
    for (int i = 0; i < _stripControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * _stripDelayMs), () {
        if (mounted) _stripControllers[i].forward();
      });
    }

    // Navigate to home after animation
    final totalDuration = _stripDuration.inMilliseconds +
        (_stripCount * _stripDelayMs) +
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
          // Developer name in center
          Center(
            child: FadeTransition(
              opacity: _textAnimation,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: "AJAY".split('').map((letter) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 140,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 8,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Animated strips
          ...List.generate(_stripCount, (index) {
            return AnimatedBuilder(
              animation: _stripAnimations[index],
              builder: (context, _) {
                return Positioned(
                  left: index * stripWidth,
                  top: 0,
                  child: Container(
                    width: stripWidth,
                    height: MediaQuery.of(context).size.height *
                        _stripAnimations[index].value,
                    color: Theme.of(context).scaffoldBackgroundColor,
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
