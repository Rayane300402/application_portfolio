import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/process_sheet/avooProcessSheet.dart';
import 'package:portfolio/components/process_sheet/seriesscribeProcessSheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/projectButton.dart';
import '../components/timelineEntry.dart';
import '../theme/theme.dart';
//TODO: ANIMATE (APPEAR AS YOU SCROLL style)
class FigmaSection extends StatelessWidget {
  const FigmaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.primaryGreen2;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            TimelineEntry(
              side: EntrySide.left,
              company: "Salemtek",
              dates: "October 2025 - November 2025",
              role: 'Independent UX & UI Design Project',
              customColor: AppTheme.accentOrange,
              body:
              "Designed a medication reminder app that helps users stay consistent with their treatment plans.\n"
                  "• Conducted user interviews, competitive analysis, and persona creation to identify adherence pain points.\n"
                  "• Mapped user journeys and defined task flows to reduce friction in creating and tracking reminders.\n"
                  "• Created both hand-sketched wireframes and high-fidelity prototypes in Figma.\n"
                  "• Designed features including flexible reminder scheduling, pill logs, progress visualization, and motivational consistency stats.",
              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/figma.png',
                  label1: 'Checkout',
                  label2: 'Design',
                  onTap: () {
                    // launch app store link
                  },
                ),
                ProjectActionButtonData(
                    iconAsset: 'assets/images/testing.png',
                    label1: 'Checkout',
                    label2: 'Process',
                    onTap: () {

                    }
                ),
              ],
            ),
            const SizedBox(height: 40,),
            TimelineEntry(
              side: EntrySide.right,
              company: "A.V.O.O",
              dates: "February 2025 – July 2025",
              role: "Independent UX Research & Product Design Project",
              customColor: AppTheme.accentOrange,
              body:
              "Created a financial wellness app that helps users learn how to budget and build savings habits.\n"
                  "• Conducted research to understand challenges faced by young adults with limited financial literacy.\n"
                  "• Defined user personas, problem statements, and goal-oriented task flows.\n"
                  "• Designed low-fidelity → high-fidelity wireframes and interactive Figma prototype.\n"
                  "• Built a clean UI that emphasizes clarity, motivation, and progress tracking through visual goal components and daily spending insights.",

              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/figma.png',
                  label1: 'Checkout',
                  label2: 'Design',
                  onTap: () async {
                    final uri = Uri.parse('https://www.figma.com/design/29NXlTWKs1hQkuIfvnFhia/UX-Course?node-id=4-2&t=itVUmwmUpuW1iaF2-1'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/testing.png',
                  label1: 'Checkout',
                  label2: 'Process',
                  onTap: () => showAVOOProcessSheet(context),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            TimelineEntry(
              side: EntrySide.left,
              company: "SeriesScribe",
              dates: "September 2024 - February 2025",
              role: 'Independent Product UI Design Project',
              customColor: AppTheme.accentOrange,
              body:
              "Designed a series tracking app inspired by platforms like The StoryGraph, adapted for TV shows, anime, and ongoing releases.\n"
                  "• Focused on simplifying progress tracking, watchlists, and discovery.\n"
                  "• Developed UI layout, component library, and interaction patterns directly in Figma.\n"
                  "• Prioritized clean typography, fast scanning layouts, and visually organized content states.",
              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/figma.png',
                  label1: 'Checkout',
                  label2: 'Design',
                  onTap: () async{
                    final uri = Uri.parse('https://www.figma.com/design/GRnAon4yUXMNI1c2je3XKT/SeriesScribe?node-id=0-1&t=5YSBcOwTViD3u2EQ-1'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                    iconAsset: 'assets/images/testing.png',
                    label1: 'Checkout',
                    label2: 'Process',
                    onTap: () => showSeriesScribeProcessSheet(context),
                ),
              ],
            ),
            // const SizedBox(height: 40,),
          ],
        ),

        // ===== Inter-entry accents =====
        Positioned(
          top: h * 0.59,
          left: 30,
          child: SvgPicture.asset(
            'assets/images/arrowRight.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        Positioned(
          top: h * 1.2,         // <-- tune
          right: -w * 0.2,
          child: Transform(
            transform: Matrix4.identity()..scale(-1.0,1.0,1.0),
            child: SvgPicture.asset(
              'assets/images/arrowRight.svg',
              width: 100,
              theme: SvgTheme(currentColor: accent),
            ),
          ),
        ),

        Positioned(
          top: h * 0.6,        // <-- tune
          left: w * 0.5,
          child: Transform(
            transform: Matrix4.identity()..scale(-1.0,1.0,1.0),
            child: SvgPicture.asset(
              'assets/images/Excitement.svg',
              width: 80,
              theme: SvgTheme(currentColor: accent),
            ),
          ),
        ),

        Positioned(
          top: h * 1.22,        // <-- tune
          left: w * 0.26,
          child:Transform.rotate(
            angle: -45 * 3.1415926535 / 180, // 45 degrees in radians
            child: SvgPicture.asset(
              'assets/images/Excitement.svg',
              width: 80,
              theme: SvgTheme(currentColor: accent),
            ),
          ),
        ),


        Positioned(
          top: -40,        // <-- tune
          right: 0,
          child: Transform.rotate(
            angle: 120 * 3.1415926535 / 180,
            child: SvgPicture.asset(
              'assets/images/Pencil.svg',
              width: 140,
              theme: SvgTheme(currentColor: accent),
            ),
          ),
        ),

      ],
    );
  }
}
