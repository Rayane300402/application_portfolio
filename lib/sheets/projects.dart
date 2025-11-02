import 'package:flutter/material.dart';
import 'package:portfolio/components/customDropDown.dart';
import 'package:portfolio/components/dropdownPanel.dart';
import 'package:portfolio/features/codingSection.dart';
import 'package:portfolio/features/figmaSection.dart';
import 'package:portfolio/models/DropNode.dart';
import 'package:portfolio/theme/theme.dart';



class ProjectsSheet extends StatefulWidget {
  const ProjectsSheet({super.key});

  @override
  State<ProjectsSheet> createState() => _ProjectsSheetState();
}

class _ProjectsSheetState extends State<ProjectsSheet> {
  // default tab
  String _selected = 'Coding Projects';

  // overlay anchor for dropdown
  final LayerLink _link = LayerLink();
  OverlayEntry? _menuEntry;
  bool _open = false;

  // dropdown menu items (ONLY these, exactly as requested)
  late final List<DropNode> _menu = [
    const DropNode.item('Coding Projects'),
    const DropNode.item('Figma Projects'),
  ];

  // open overlay panel
  void _openMenu() {
    if (_open) return;
    _open = true;

    final width = MediaQuery.of(context).size.width - 32;

    _menuEntry = OverlayEntry(
      builder: (_) => DropdownPanel(
        nodes: _menu,
        onSelect: (label) => setState(() => _selected = label),
        onClose: _closeMenu,
        link: _link,
        width: width,
      ),
    );

    Overlay.of(context).insert(_menuEntry!);
    setState(() {}); // update arrow rotation
  }

  // close overlay panel
  void _closeMenu() {
    _menuEntry?.remove();
    _menuEntry = null;
    if (_open) {
      _open = false;
      setState(() {}); // update arrow rotation back
    }
  }

  @override
  void dispose() {
    _closeMenu();
    super.dispose();
  }

  // which body to show under dropdown
  Widget _bodyFor(String key) {
    switch (key) {
      case 'Coding Projects':
        return const CodingSection();
      case 'Figma Projects':
        return const FigmaSection();
      default:
        return Text(
          '$key – coming soon',
          style: Theme.of(context).textTheme.bodyMedium,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // same 90% height vibe as KnowMeSheet
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppTheme.primaryGreen, // THIS sheet uses green background
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // the dropdown pill (same exact widget you already wrote)
            CompositedTransformTarget(
              link: _link,
              child: CustomDropdown(
                value: _selected,
                isOpen: _open,
                onTap: _open ? _closeMenu : _openMenu,
              ),
            ),

            const SizedBox(height: 16),

            // animated body swap under the dropdown
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),

                // IMPORTANT:
                // same layoutBuilder trick we used in KnowMe so that
                // new child is aligned to the top, not center.
                layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },

                // scrollable page content
                child: SingleChildScrollView(
                  key: ValueKey(_selected),
                  physics: const BouncingScrollPhysics(),
                  child: _bodyFor(_selected),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
