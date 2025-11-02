import 'package:flutter/material.dart';
import 'package:portfolio/components/projectButton.dart';
import 'package:portfolio/theme/theme.dart';

enum EntrySide { left, right }

class TimelineEntry extends StatelessWidget {
  final EntrySide side;
  final String company; // company or project name
  final String dates; // date or responsibility
  final String role; // role or company
  final String body;

  final List<String>? metaLines;
  final List<ProjectActionButtonData>? actions;
  final EdgeInsets padding;
  final double gap;
  final Color customColor;

  const TimelineEntry({
    super.key,
    required this.side,
    required this.company,
    required this.dates,
    required this.role,
    required this.body,
    this.metaLines,
    this.actions,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.gap = 28,
    this.customColor = AppTheme.primaryGreen
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    final cross = side == EntrySide.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end;

    final textAlign = side == EntrySide.left ? TextAlign.left : TextAlign.right;

    Widget _buildActionsRows() {
      if (actions == null || actions!.isEmpty) {
        return const SizedBox.shrink();
      }

      // buttons should align OPPOSITE the text:
      // if text is left -> buttons go right,
      // if text is right -> buttons go left.
      final rowAlignment = side == EntrySide.left
          ? MainAxisAlignment.end
          : MainAxisAlignment.start;

      final outerAlign = side == EntrySide.left
          ? Alignment.centerRight
          : Alignment.centerLeft;

      // Build rows of at most 2 buttons each
      final List<Widget> rowWidgets = [];
      for (var i = 0; i < actions!.length; i += 2) {
        final first  = actions![i];
        final second = (i + 1 < actions!.length) ? actions![i + 1] : null;

        rowWidgets.add(
          Row(
            mainAxisSize: MainAxisSize.min,      // <-- prevents forcing full width
            mainAxisAlignment: rowAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectActionButton(data: first),
              if (second != null) ...[
                const SizedBox(width: 12),
                ProjectActionButton(data: second),
              ],
            ],
          ),
        );

        // add vertical gap between rows, but NOT after the last one
        if (i + 2 < actions!.length) {
          rowWidgets.add(const SizedBox(height: 10));
        }
      }

      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Align(
          alignment: outerAlign,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowWidgets,
          ),
        ),
      );
    }


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
                    color: customColor,
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
                    color: customColor,
                  ),
                ),
                if (metaLines != null && metaLines!.isNotEmpty) ... [
                  const SizedBox(height: 6,),
                  for(final line in metaLines!)
                    Text(
                      line,
                      textAlign: textAlign,
                      style: t.bodyMedium!.copyWith(
                        color: customColor,
                      ),
                    )
                ],


                const SizedBox(height: 8),
                Text(
                  body,
                  textAlign: textAlign,
                  style: t.bodyMedium!.copyWith(height: 1.55),
                ),

                // buttons under body (optional)
                _buildActionsRows(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
