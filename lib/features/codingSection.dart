import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/lacedProcessSheet.dart';
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
                  onTap: () async {
                    final uri = Uri.parse('https://play.google.com/store/apps/details?id=com.aiy.laced&pli=1'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/apple.png',
                  label1: 'Get it on',
                  label2: 'App Store',
                  onTap: () async {
                    final uri = Uri.parse('apps.apple.com/us/app/laced-snkr-drops/id6741904336'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/testing.png',
                  label1: 'Checkout',
                  label2: 'Process',
                  onTap: () => showLacedProcessSheet(context),
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
                  onTap: () async {
                    final uri = Uri.parse('https://github.com/Rayane300402/share-care-angular'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/ux.png',
                  label1: 'Checkout',
                  label2: 'Website',
                  onTap: () async {
                    final uri = Uri.parse('https://sharecareang.netlify.app/'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
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
                  onTap: () async {
                    final uri = Uri.parse('https://www.theshitbot.com/'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/testing.png',
                  label1: 'Checkout',
                  label2: 'Design Process',
                  onTap: () {
                    // launch app store link
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
                  onTap: () async {
                    final uri = Uri.parse('https://github.com/Rayane300402/OrderlyFlow'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/figma.png',
                  label1: 'Checkout',
                  label2: 'Design',
                  onTap: () async {
                    final uri = Uri.parse('https://www.figma.com/design/pZ4mh1ZR5fayCG0SEFY9S3/OrderlyFlow?node-id=0-1&t=saDMrn1g50ioT4at-1'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 50,),
            TimelineEntry(
              side: EntrySide.left,
              company: "VirtuEscape",
              dates: "September 2022 – June 2023",
              role: "Senior Project @ BAU",
              customColor: AppTheme.accentOrange,
              body:
              "Created a multi-page site using HTML, CSS, and vanilla JS to simulate travel experiences during the pandemic.\n"
                  "• Built for immersive user interaction, destination storytelling, and visual atmosphere.\n"
                  "• Focused on clarity of layout, readable content, and engagement without heavy frameworks.",
              actions: [
                ProjectActionButtonData(
                  iconAsset: 'assets/images/github.png',
                  label1: 'Checkout',
                  label2: 'Github Repo',
                  onTap: () async {
                    final uri = Uri.parse('https://github.com/Rayane300402/VirtueEscape2'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
                ProjectActionButtonData(
                  iconAsset: 'assets/images/ux.png',
                  label1: 'Checkout',
                  label2: 'Website',
                  onTap: () async {
                    final uri = Uri.parse('https://virtue-escape.netlify.app/'); // your real link
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 70,),

          ],
        ),

        // ===== Inter-entry accents =====
        Positioned(
          top: h * 0.5,
          left: 30,
          child: SvgPicture.asset(
            'assets/images/arrowRight.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        Positioned(
          top: h * 1.05,         // <-- tune
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
          top: h * 1.54,
          left: 0,
          child: SvgPicture.asset(
            'assets/images/arrowRight.svg',
            width: 100,
            theme: SvgTheme(currentColor: accent),
          ),
        ),

        Positioned(
          top: h * 2.1,         // <-- tune
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
          top: h * 0.55,        // <-- tune
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
          bottom: -20,        // <-- tune
          left: 20,
          child: SvgPicture.asset(
            'assets/images/monitor.svg',
            width: 140,
            theme: SvgTheme(currentColor: accent),
          ),
        ),
      ],
    );
  }
}
