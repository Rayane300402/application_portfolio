import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/projectButton.dart';
import '../components/timelineEntry.dart';
import '../theme/theme.dart';

class CodingSection extends StatelessWidget {
  const CodingSection({super.key});

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
              company: 'Laced - SNKRS Bot',
              dates: 'September 2024 - present',
              role: 'AIY Expert Solution',
              customColor: AppTheme.accentOrange,
              body:
              "Developed a mobile-first sneaker automation app using Flutter, Dart, and SQLite, "
                  "targeting users without high-end laptops or SNKRS app availability.\n"
                  "• Built backend server and real-time dashboard using Node.js, WebSocket, HTML, CSS, and TypeScript.\n"
                  "• Designed and implemented the full mobile UI/UX.\n"
                  "Result: Achieved 1k+ installs worldwide on iOS and Android.",
              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/playstore.png',
                  label1: 'Get it on',
                  label2: 'Google Play',
                  onTap: () {
                    // launch store link
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/apple.png',
                  label1: 'Get it on',
                  label2: 'App Store',
                  onTap: () {
                    // launch app store link
                  },
                ),
              ],
            ),
            const SizedBox(height: 50,),
            TimelineEntry(
              side: EntrySide.right,
              company: "ShareCare 2.0",
              dates: "2024",
              role: 'Independent Project',
              customColor: AppTheme.accentOrange,
              body:
              "Co-developed a web app using AngularJS and Bootstrap to combat food waste by connecting donors and recipients.\n"
                  "• Added features for redistributing food via NGO collaboration.\n"
                  "• Built an integrated education section on sustainability.\n"
                  "Impact: Ranked Top 30 in MENA in the Google Solution Challenge.",
              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/github.png',
                  label1: 'Checkout',
                  label2: 'Github Repo',
                  onTap: () {
                    // launch store link
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/ux.png',
                  label1: 'Checkout',
                  label2: 'Website',
                  onTap: () {
                    // launch app store link
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/figma.png',
                  label1: 'Checkout',
                  label2: 'Design',
                  onTap: () {
                    // launch app store link
                  },
                ),
              ],
            ),
            const SizedBox(height: 50,),
            TimelineEntry(
              side: EntrySide.left,
              company: "TSB2",
              dates: "August 2023 – September 2024",
              role: "AIY Expert Solution",
              customColor: AppTheme.accentOrange,
              body:
              "Converted an AngularJS web-based sneaker automation bot into a desktop application using Electron and SQLite.\n"
                  "• Modernized UI/UX by editing Figma design and then applying Bootstrap + custom CSS.\n"
                  "• Worked with backend devs to integrate Node.js services for real-time task processing.\n"
                  "Impact: Added more options for non-Nike and Nike runners without browser-based setup, improving accessibility.",

              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/tsb.png',
                  label1: 'Checkout',
                  label2: 'Website',
                  onTap: () {
                    // launch store link
                  },
                ),
              ],
            ),
            const SizedBox(height: 50,),
            TimelineEntry(
              side: EntrySide.right,
              company: "OrderlyFlow – HR Management",
              dates: "September 2022 – June 2023",
              role: "Senior Project @ BAU",
              customColor: AppTheme.accentOrange,
              body:
              "Desktop HR management app built in Flutter with a local database, targeting small and large companies.\n"
                  "• Full feature set for HR teams: built-in chat, task assignment, live calendar, real-time collaboration.\n"
                  "• I led UI/UX design in Figma and implemented the front-end in Flutter.\n"
                  "Outcome: Reduced manual HR workload by ~10%+ and saved ~30hr/month of repetitive admin work.",

              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/github.png',
                  label1: 'Checkout',
                  label2: 'Github Repo',
                  onTap: () {
                    // launch store link
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/figma.png',
                  label1: 'Checkout',
                  label2: 'Design',
                  onTap: () {
                    // launch app store link
                  },
                ),
              ],
            ),
            const SizedBox(height: 70,),

          ],
        ),

        // ===== Inter-entry accents =====
        // left arrow one
        Positioned(
          top: h * 0.5,
          left: 30,
          child: SvgPicture.asset(
            'assets/images/arrowRight.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        // right arrow two
        Positioned(
          top: h ,         // <-- tune
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
          top: h * 1.5,
          left: 30,
          child: SvgPicture.asset(
            'assets/images/arrowRight.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        Positioned(
          top: h * 0.5,        // <-- tune
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
          top: h * 1.06 ,        // <-- tune
          left: w * 0.5,
          child:Transform.rotate(
            angle: -40 * 3.1415926535 / 180, // 45 degrees in radians
            child: SvgPicture.asset(
              'assets/images/Excitement.svg',
              width: 80,
              theme: SvgTheme(currentColor: accent),
            ),
          ),
        ),

        Positioned(
          top: -10,        // <-- tune
          right: 20,
          child: SvgPicture.asset(
            'assets/images/smartphone.svg',
            width: 120,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        Positioned(
          bottom: -10,        // <-- tune
          left: 20,
          child: SvgPicture.asset(
            'assets/images/monitor.svg',
            width: 120,
            theme: SvgTheme(currentColor: accent),
          ),
        ),
      ],
    );
  }
}
