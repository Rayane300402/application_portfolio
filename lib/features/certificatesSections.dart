import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/animations.dart';

import '../components/timelineEntry.dart';
import '../theme/theme.dart';

class CertificatesSection extends StatefulWidget {
  const CertificatesSection({super.key});

  @override
  State<CertificatesSection> createState() => _CertificatesSectionState();
}

class _CertificatesSectionState extends State<CertificatesSection> {
  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.accentOrange2;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SectionFadeIn(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: const [
              TimelineEntry(
                  side: EntrySide.left,
                  company: 'Akamai Network Engineering Professional Certificate',
                  dates: 'Akamai Technical Academy',
                  role: 'Coursera',
                  metaLines: [''],
                  body:
                  "Developed core networking skills including OS fundamentals, routing, TCP/IP protocols, subnetting, and IT security."
                      "Gained hands-on experience in configuring networks, managing relational databases, and using."
                      "Python scripting for automation and troubleshooting within network environments."
              ),
              const SizedBox(height: 50,),
              TimelineEntry(
                side: EntrySide.right,
                company: 'IBM Full Stack Developer Professional Certificate',
                dates: 'IBM Training',
                role: 'Coursera',
                body:
                "Acquired a full-stack skill set across front-end and back-end technologies."
                    "Built web apps using React, Node.js. Express, and Django while integrating SQL and noSQL databases."
                  "Gained practical experience in version control (Git/Github), containerizing (Docker), adn cloud deployment."
              ),

              const SizedBox(height: 50,),
              TimelineEntry(
                  side: EntrySide.left,
                  company: 'Google UX Design Professional Certificate',
                  dates: 'Google',
                  role: 'Coursera',
                  body:
                  "Mastered the complete UX design process; from user research and wireframing to prototyping and usability testing."
                      "Specialized in Figma for low and high fidelity design."
                      "Created user-centered interfaces for mobile and web, with a focus on accessibility, design systems, and social-impact project."
              ),

              const SizedBox(height: 50,),
              TimelineEntry(
                  side: EntrySide.right,
                  company: 'Google Project Management Professional Certificate',
                  dates: 'Google',
                  role: 'Coursera',
                  body:
                  "Learned to lead projects using Agile and Scrum frameworks."
                      "Covered project planning, budgeting, risk assessment, and stakeholder communication."
                      "Applied methodologies in real-world simulations to successfully plan and execute complex projects while optimizing workflows."
              ),

              const SizedBox(height: 50,),
              TimelineEntry(
                  side: EntrySide.left,
                  company: 'Google IT Support Professional Certificate',
                  dates: 'Google',
                  role: 'Coursera',
                  body: ""
              ),

              TimelineEntry(
                  side: EntrySide.right,
                  company: 'NoSQl Course',
                  dates: 'Universidad Nacional Autonoma de Mexico',
                  role: 'Coursera',
                  body: ""
              ),

              TimelineEntry(
                  side: EntrySide.left,
                  company: 'IC3 Digital Literacy Certification',
                  dates: 'Certiport',
                  role: '',
                  body: ""
              )
            ],
          ),

          // ===== Inter-entry accents (2 arrows + 3 excitements) =====
          // left arrow one
          Positioned(
            top: h * 0.4,
            left: 20,
            child: SvgPicture.asset(
              'assets/images/arrowRight.svg',
              width: 100,
              theme: SvgTheme(currentColor: accent),
            ),
          ),

          // right arrow two
          Positioned(
            top: h * 0.82,         // <-- tune
            right: -w * 0.25,
            child: Transform(
              transform: Matrix4.identity()..scale(-1.0,1.0,1.0),
              child: SvgPicture.asset(
                'assets/images/arrowRight.svg',
                width: 100,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

          // left arrow three
          Positioned(
            top: h * 1.23,
            left: 10,
            child: SvgPicture.asset(
              'assets/images/arrowRight.svg',
              width: 100,
              theme: SvgTheme(currentColor: accent),
            ),
          ),

          // right arrow four
          Positioned(
            top: h * 1.56,         // <-- tune
            right: -w * 0.25,
            child: Transform(
              transform: Matrix4.identity()..scale(-1.0,1.0,1.0),
              child: SvgPicture.asset(
                'assets/images/arrowRight.svg',
                width: 100,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

          // left arrow five
          Positioned(
            bottom: h * 0.32,
            left: 10,
            child: SvgPicture.asset(
              'assets/images/arrowRight.svg',
              width: 100,
              theme: SvgTheme(currentColor: accent),
            ),
          ),

          // right arrow six
          Positioned(
            bottom: h * 0.12,         // <-- tune
            right: -w * 0.25,
            child: Transform(
              transform: Matrix4.identity()..scale(-1.0,1.0,1.0),
              child: SvgPicture.asset(
                'assets/images/arrowRight.svg',
                width: 100,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

          // Badge #1 (start)
          Positioned(
            top: 50,        // <-- tune
            right: 20,
            child: Transform.rotate(
              angle: 35 * 3.1415926535 / 180,
              child: SvgPicture.asset(
                'assets/images/code.svg',
                width: 80,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

          // Badge #2 (at bottom)
          Positioned(
            top: h * 0.73,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/badge.svg',
              width: 120,
              theme: SvgTheme(currentColor: AppTheme.accentOrange74),
            ),
          ),

          // Badge #1 (start)
          Positioned(
            top: h * 1.13,        // <-- tune
            right: 0,
            child: Transform.rotate(
              angle: 120 * 3.1415926535 / 180,
              child: SvgPicture.asset(
                'assets/images/Pencil.svg',
                width: 150,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

          // Badge #1 (start)
          Positioned(
            top: h * 1.53,        // <-- tune
            left: 0,
            child: Transform.rotate(
              angle: 20 * 3.1415926535 / 180,
              child: SvgPicture.asset(
                'assets/images/Pencil.svg',
                width: 150,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

          Positioned(
            bottom: h * 0.35,        // <-- tune
            right: 0,
            child: Transform.rotate(
              angle: 0 * 3.1415926535 / 180,
              child: SvgPicture.asset(
                'assets/images/monitor.svg',
                width: 150,
                theme: SvgTheme(currentColor: accent),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
