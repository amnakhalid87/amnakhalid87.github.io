import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final int particleCount = 50;

  late List<Particle> particles;

  @override
  void initState() {
    super.initState();

    particles = List.generate(particleCount, (_) => Particle.random(_random));

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        for (var p in particles) {
          p.move();
        }
        return CustomPaint(
          painter: ParticlePainter(particles),
          size: Size.infinite,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Particle {
  Offset position;
  Offset velocity;
  double radius;

  Particle(this.position, this.velocity, this.radius);

  factory Particle.random(Random random) {
    return Particle(
      Offset(random.nextDouble(), random.nextDouble()),
      Offset(
        (random.nextDouble() - 0.5) * 0.002,
        (random.nextDouble() - 0.5) * 0.002,
      ),
      random.nextDouble() * 2 + 1,
    );
  }

  void move() {
    position += velocity;

    if (position.dx < 0 || position.dx > 1) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (position.dy < 0 || position.dy > 1) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = Colors.black;
    canvas.drawRect(Offset.zero & size, bgPaint);

    final dotPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.amber.withOpacity(0.25)
      ..strokeWidth = 1;

    for (int i = 0; i < particles.length; i++) {
      final p1 = particles[i];
      final pos1 = Offset(
        p1.position.dx * size.width,
        p1.position.dy * size.height,
      );

      canvas.drawCircle(pos1, p1.radius, dotPaint);

      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final pos2 = Offset(
          p2.position.dx * size.width,
          p2.position.dy * size.height,
        );

        final distance = (pos1 - pos2).distance;
        if (distance < 120) {
          canvas.drawLine(pos1, pos2, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
