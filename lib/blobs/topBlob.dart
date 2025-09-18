// lib/blobs/top_blob.dart
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class TopBlob extends StatelessWidget {
  const TopBlob({super.key, this.heightFactor = 0.80});

  /// Fraction of the screen height this blob should occupy.
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight * heightFactor),
          painter: _TopBlobPainter(),
          isComplex: true,
        );
      },
    );
  }
}

class _TopBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final path = Path()
    // Start slightly off-screen left so it always covers full width
      ..moveTo(-0.06 * w, 0.28 * h)
    // top sweep
      ..quadraticBezierTo(0.18 * w, 0.02 * h, 0.55 * w, 0.08 * h)
      ..quadraticBezierTo(0.95 * w, 0.12 * h, 1.06 * w, 0.30 * h)

    // right rounding downward
      ..quadraticBezierTo(3.02 * w, 3.62 * h, 0.86 * w, 0.9 * h)

    // bottom curve with a small "dimple" bump on the right
      ..quadraticBezierTo(0.92 * w, 0.80 * h, 0.76 * w, 0.77 * h) // outwards
      ..quadraticBezierTo(0.64 * w, 0.74 * h, 0.58 * w, 0.67 * h) // dip
      ..quadraticBezierTo(0.50 * w, 0.60 * h, 0.44 * w, 0.69 * h) // recover

    // flow toward left bottom
      ..quadraticBezierTo(0.30 * w, 0.88 * h, 0.14 * w, 0.80 * h)
      ..quadraticBezierTo(-0.02 * w, 0.72 * h, -0.06 * w, 0.28 * h)
      ..close();

    final paint = Paint()
      ..color = AppTheme.accentOrange
      ..isAntiAlias = true;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}