import 'package:flutter/material.dart';
import 'dart:math';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    // Initialize particles
    for (int i = 0; i < 30; i++) {
      _particles.add(Particle(_random));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1a1a1a), // Charcoal grey
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: ParticlePainter(_particles),
              size: Size.infinite,
            );
          },
        ),
      ),
    );
  }
}

class Particle {
  double x;
  double y;
  double speed;
  double size;
  double opacity;
  final Random _random;

  Particle(this._random) : x = 0, y = 0, speed = 0, size = 0, opacity = 0 {
    reset(startRandomY: true);
  }

  void reset({bool startRandomY = false}) {
    x = _random.nextDouble();
    y = startRandomY ? _random.nextDouble() : -0.02;
    speed =
        _random.nextDouble() * 0.0005 +
        0.0003; // Speed between 0.0003-0.0008 (slower)
    size =
        _random.nextDouble() * 0.8 +
        0.3; // Size between 0.3-1.1 (smaller, thinner)
    opacity = _random.nextDouble() * 0.5 + 0.3; // Opacity between 0.3-0.8
  }

  void update() {
    y += speed;
    if (y > 1.02) {
      reset();
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    // Update and draw particles
    for (var particle in particles) {
      particle.update();

      final paint = Paint()
        ..color = Colors.white.withValues(alpha:particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
