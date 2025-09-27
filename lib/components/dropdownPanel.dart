import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

import '../models/DropNode.dart';

class DropdownPanel extends StatelessWidget {
  final List<DropNode> nodes;
  final ValueChanged<String> onSelect;
  final VoidCallback onClose;
  final LayerLink link;                  // anchor to pill
  final double width;

  const DropdownPanel({
    super.key,
    required this.nodes,
    required this.onSelect,
    required this.onClose,
    required this.link,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onClose,   // tap outside to close
        child: Stack(children: [
          CompositedTransformFollower(
            link: link,
            offset: const Offset(0, 56),            // panel below pill
            showWhenUnlinked: false,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen,      // menu bg (green)
                  borderRadius: radius,
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 18, offset: const Offset(0, 10),
                  )],
                ),
                child: ClipRRect(
                  borderRadius: radius,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: _items(context, nodes, 0),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> _items(BuildContext ctx, List<DropNode> nodes, int depth) {
    final pad = 16.0 + depth * 12.0;
    final out = <Widget>[];
    for (final n in nodes) {
      if (!n.selectable) {
        out.add(Container(
          color: AppTheme.textWhite.withOpacity(0.05),
          padding: EdgeInsets.fromLTRB(pad, 12, 16, 8),
          child: Text(n.label,
              style: Theme.of(ctx).textTheme.displayMedium!.copyWith(
                  color: AppTheme.textWhite.withOpacity(0.9), fontSize: 14)),
        ));
        out.addAll(_items(ctx, n.children, depth + 1));
      } else {
        out.add(InkWell(
          onTap: () {
            onSelect(n.label);
            onClose();  // close panel
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(pad, 12, 16, 12),
            child: Text(n.label,
                style: Theme.of(ctx).textTheme.bodyMedium!.copyWith(
                    fontSize: 16, color: AppTheme.textWhite)),
          ),
        ));
        out.add(Container(height: 1, color: AppTheme.textWhite.withOpacity(0.12)));
      }
    }
    if (out.isNotEmpty && out.last is Container) out.removeLast();
    return out;
  }
}
