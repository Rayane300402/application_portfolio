import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

enum EntrySide { left, right }

class TimelineEntry extends StatelessWidget {
  final EntrySide side;
  final String company;
  final String dates;
  final String role;
  final String body;
  final EdgeInsets padding;
  final double gap;

  const TimelineEntry({
    super.key,
    required this.side,
    required this.company,
    required this.dates,
    required this.role,
    required this.body,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.gap = 28,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    final cross = side == EntrySide.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end;

    final textAlign = side == EntrySide.left ? TextAlign.left : TextAlign.right;

    return Padding(
      padding: EdgeInsets.only(
        bottom: gap,
        left: side == EntrySide.right ? 8 : 0,
        right: side == EntrySide.left ? 8 : 0,
      ),
      child: Align(
        alignment: side == EntrySide.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.92),
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: cross,
              children: [
                Text(
                  company,
                  textAlign: textAlign,
                  style: t.displayLarge!.copyWith(
                    fontSize: 18,
                    letterSpacing: 0.2,
                    color: AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dates,
                  textAlign: textAlign,
                  style: t.bodyMedium!.copyWith(
                    color: AppTheme.textWhite.withOpacity(0.85),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  role,
                  textAlign: textAlign,
                  style: t.displayMedium!.copyWith(
                    fontSize: 18,
                    color: AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  body,
                  textAlign: textAlign,
                  style: t.bodyMedium!.copyWith(height: 1.55),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
