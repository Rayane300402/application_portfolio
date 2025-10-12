import 'package:flutter/material.dart';
import 'package:portfolio/components/customDropDown.dart';
import 'package:portfolio/theme/theme.dart';

import '../components/dropdownPanel.dart';
import '../features/academicsSection.dart';
import '../features/certificatesSections.dart';
import '../features/experienceSection.dart';
import '../features/skillsSection.dart';
import '../features/welcomeSection.dart';
import '../models/DropNode.dart';

class KnowMeSheet extends StatefulWidget {
  const KnowMeSheet({super.key});

  @override
  State<KnowMeSheet> createState() => _KnowMeSheetState();
}

class _KnowMeSheetState extends State<KnowMeSheet> {
  String _selected = 'Welcome :)';
  final LayerLink _link = LayerLink();
  OverlayEntry? _menuEntry;
  bool _open = false;

  late final List<DropNode> _menu = [
    const DropNode.item('Welcome :)'),
    const DropNode.item('Experience'),
    const DropNode.item('Academics'),
    const DropNode.item('Certificates'),
    const DropNode.item('Skills & Hobbies'),
  ];

  void _openMenu() {
    if (_open) return;
    _open = true;

    final width = MediaQuery.of(context).size.width - 32; // full width inside sheet padding
    _menuEntry = OverlayEntry(
      builder: (_) => DropdownPanel(
        nodes: _menu,
        onSelect: (label) => setState(() => _selected = label),
        onClose: _closeMenu,                    // <— no Navigator.pop
        link: _link,
        width: width,
      ),
    );
    Overlay.of(context).insert(_menuEntry!);
    setState(() {}); // to rotate arrow in pill
  }

  void _closeMenu() {
    _menuEntry?.remove();
    _menuEntry = null;
    if (_open) {
      _open = false;
      setState(() {}); // rotate arrow back
    }
  }

  @override
  void dispose() {
    _closeMenu();
    super.dispose();
  }


  Widget _bodyFor(String key) {
    switch (key) {
      case 'Welcome :)':   return const WelcomeSection();
      case 'Experience':   return const ExperienceSection();
      case 'Academics':  return const AcademicsSection();
      case 'Certificates': return const CertificatesSection();
      case 'Skills & Hobbies': return const SkillsSection();
      default: return Text('$key – coming soon', style: Theme.of(context).textTheme.bodyMedium);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppTheme.accentOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompositedTransformTarget(
              link: _link,
              child: CustomDropdown(
                value: _selected,
                isOpen: _open,
                onTap: _open ? _closeMenu : _openMenu,
              ),
            ),

            const SizedBox(height: 16,),
            //
            // Expanded(
            //   child: AnimatedSwitcher(
            //     duration: const Duration(milliseconds: 220),
            //     switchInCurve: Curves.easeOut,
            //     switchOutCurve: Curves.easeIn,
            //     transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),
            //
            //     child: SingleChildScrollView(
            //       physics: const BouncingScrollPhysics(),
            //         key: ValueKey(_selected),
            //         child: _bodyFor(_selected),
            //     ),
            //
            //   ),
            // ),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),

                // ⬇⬇ THIS is the important change
                layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                  return Stack(
                    alignment: Alignment.topLeft, // instead of center
                    children: <Widget>[
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },

                child: SingleChildScrollView(
                  key: ValueKey(_selected),
                  physics: const BouncingScrollPhysics(),
                  child: _bodyFor(_selected),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
