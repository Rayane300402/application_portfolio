// lib/blobs/bottom_hue_blob.dart
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';


import '../theme/theme.dart';

class BottomHueBlob extends StatefulWidget {
  const BottomHueBlob({super.key});

  @override
  State<BottomHueBlob> createState() => _BottomHueBlobState();
}

class _BottomHueBlobState extends State<BottomHueBlob> with SingleTickerProviderStateMixin {

  late final AnimationController _breath;

  @override
  void initState() {
    super.initState();
    _breath = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breath.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _breath,
      builder: (context, _) {
        // Oscillates -1..+1
        final pulse = math.sin(_breath.value * 2 * math.pi);
        return CustomPaint(
          painter: _BottomHueBlobPainter(pulse),
          size: const Size(double.infinity, double.infinity),
          isComplex: true,
        );
      },
    );
  }
}

class _BottomHueBlobPainter extends CustomPainter {
  const _BottomHueBlobPainter(this.pulse);
  final double pulse;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final s = 1.0 + 0.06 * pulse; // slightly more breathing
    final sigma = size.shortestSide * 0.25 * (1.0 + 0.05 * pulse);
    final center = Offset(w * 0.5, h * 0.8);

    final paint = Paint()
      ..color = AppTheme.accentOrange
      ..imageFilter = ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(s, s);
    canvas.translate(-center.dx, -center.dy);

    final rect = Rect.fromCenter(
      center: center,
      width: w * 0.9,  // was 1.2
      height: h * 0.5, // was 0.7
    );
    canvas.drawOval(rect, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _BottomHueBlobPainter old) => true;
}