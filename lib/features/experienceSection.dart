import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme.dart';

import '../components/timelineEntry.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.accentOrange74;
    final w = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ===== Base content =====
        Column(
          children: const [
            TimelineEntry(
              side: EntrySide.left,
              company: 'AIY EXPERTS SOLUTIONS',
              dates: 'January 2024 - Present',
              role: 'Software Developer',
              body:
              "Currently, I work as a junior software developer at AIY. I mostly work in the UI/UX, the front-end process, and database building. "
                  "I lead the UI work—whether designing base UI in Figma with the lead designer, collaborating on the best UX, or implementing a clean, "
                  "smooth local database. I work across mobile (Flutter) and desktop stacks.",
            ),
            TimelineEntry(
              side: EntrySide.right,
              company: 'AIY EXPERTS SOLUTIONS',
              dates: 'June 2023 - December 2023',
              role: 'Intern',
              body:
              "Learned Angular, Electron, SQLite in month one; then worked on TSB2’s front-end and database. "
                  "When the code base matured, I collaborated with the team on backend integration and delivery.",
            ),
            TimelineEntry(
              side: EntrySide.left,
              company: 'GDSC CORE TEAM MEMBER',
              dates: 'August 2021 - August 2023',
              role: 'Core Team',
              body:
              "Helped on social media strategy and educational content; supported design decisions for events; "
                  "participated in DEVFEST 2022 hosted at my university.",
            ),
            const SizedBox(height: 70,)
          ],
        ),

        // ===== Inter-entry accents (2 arrows + 3 excitements) =====
        // You’ll tweak these `top/left/right` numbers by eye to match your layout.
        // Using currentColor so tint is controlled here.
        // ARROW near first entry (to the right)
        // Positioned(
        //   top: 0,         // <-- tune
        //   right: 0,
        //   child: SvgPicture.asset(
        //     'assets/images/arrowRight.svg',
        //     width: 36,
        //     theme: SvgTheme(currentColor: accent),
        //   ),
        // ),

        // ARROW near second entry (to the left)
        // Positioned(
        //   top: 0,        // <-- tune
        //   left: 0,
        //   child: SvgPicture.asset(
        //     'assets/images/arrowLeft.svg',
        //     width: 36,
        //     theme: SvgTheme(currentColor: accent),
        //   ),
        // ),

        // EXCITEMENT #1 (between 1 and 2)
        Positioned(
          top: 0,        // <-- tune
          right: - 10,
          child: SvgPicture.asset(
            'assets/images/Excitement.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        // EXCITEMENT #2 (behind 2)
        Positioned(
          bottom: 0,
          right: -20,
          child: Transform.rotate(
            angle: 45 * 3.1415926535 / 180, // 45 degrees in radians
            child: SvgPicture.asset(
              'assets/images/Excitement.svg',
              width: 120,
              theme: SvgTheme(currentColor: AppTheme.accentOrange74),
            ),
          ),
        ),


        // EXCITEMENT #3 (between 2 and 3)
        Positioned(
          top: 0,        // <-- tune
          right: w * 0.1,
          child: SvgPicture.asset(
            'assets/images/Excitement.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),
      ],
    );
  }
}
