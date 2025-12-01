import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/animations.dart';

import '../components/timelineEntry.dart';
import '../theme/theme.dart';

class AcademicsSection extends StatefulWidget {
  const AcademicsSection({super.key});

  @override
  State<AcademicsSection> createState() => _AcademicsSectionState();
}

class _AcademicsSectionState extends State<AcademicsSection> {
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
                company: 'Bsc. of Science, In Computer Science',
                dates: 'January 2020 - June 2023',
                role: 'Beirut Arab University',
                metaLines: ['GPA: 3.9'],
                body:
                "Graduated with honors in Computer Science ranking among the the top 3 in my class."
                  "Built a strong foundation in HTML, CSS, JS and React, and mastered Flutter & Dart through my senior project Orderly Flow."
                  "Helped oragnize the 2022 DevFest as a core team member of GDSC, and gained privileged access to Google's specialization certifications in Project Management and It Support."
              ),
              const SizedBox(height: 50,),
              TimelineEntry(
                side: EntrySide.right,
                company: 'Al Moltaqa Bootcamp',
                dates: 'February 2023 - June 2023',
                role: 'Al Moltaqa & BAU Science Department',
                body:
                "Completed an intensive program in full-stack development, covering Javascript, Angular, Nodejs, Python & cloud deployment."
                    "Applied skills in responsive UI/UX design, database integration, and collaborative project work",
              ),

              const SizedBox(height: 50,),
              TimelineEntry(
                side: EntrySide.left,
                company: 'School Degree',
                dates: 'September 2005 - June 2020',
                role: 'College Des Seours Des Saints Coeurs',
                body:
                "Attended a private french school, gaining proficiency in the french language, Microsoft Office tools, and public speaking."
                    "In high school, I was introduced to HTML and took initiative to independently learn CSS, deepening my understanding of web design fundamentals."
                  "As a first-year student, I joined the Model United Nations (MUN), where I honed my research, teamwork, and public speaking skill."
                    "Participated in a one-week science camp at NDU, where I explored Python and game development using Java and XML, sparking my passion for programming."
                  "Graduated under the General Science track with a well-rounded foundation in both scientific and technical disciplines."
              ),
            ],
          ),

          // ===== Inter-entry accents (2 arrows + 3 excitements) =====
          // left arrow one
          Positioned(
            top: h * 0.4,
            left: 50,
            child: SvgPicture.asset(
              'assets/images/arrowRight.svg',
              width: 100,
              theme: SvgTheme(currentColor: accent),
            ),
          ),

          // right arrow two
          Positioned(
            top: h * 0.8,         // <-- tune
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

          // Badge #1 (start)
          Positioned(
            top: 40,        // <-- tune
            right: 20,
            child: SvgPicture.asset(
              'assets/images/badge.svg',
              width: 100,
              theme: SvgTheme(currentColor: accent),
            ),
          ),

          // EXCITEMENT #2 (at bottom)
          Positioned(
            top: h * 0.5,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/cup.svg',
              width: 120,
              theme: SvgTheme(currentColor: AppTheme.accentOrange74),
            ),
          ),


        ],
      ),
    );
  }
}
