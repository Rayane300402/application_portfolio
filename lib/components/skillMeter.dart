import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme.dart';

class SkillMeter extends StatelessWidget {
  /// 0.0 – 1.0
  final double value;
  final String label;
  final String iconAsset;


  const SkillMeter({
    super.key,
    required this.value,
    required this.label,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);
    final double barHeight = 20;
    final double iconSize = 20;
    Color barColor = AppTheme.primaryGreen;
    Color barBg = Color(0xFF222E22);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              iconAsset,
              width: iconSize,
              height: iconSize,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(barHeight),
          child: LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth;
              return SizedBox(
                height: barHeight,
                child: Stack(
                  children: [
                    // track
                    Container(width: w, height: barHeight, color: barBg),
                    // fill
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeOut,
                      width: w * clamped,
                      height: barHeight,
                      color: barColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );


  }
}
