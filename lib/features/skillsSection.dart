import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/skillMeter.dart';

import '../theme/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final accent = AppTheme.accentOrange74;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topLeft,
      clipBehavior: Clip.none,
      children: [

        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TECHNICAL SKILLS',
              style: t.displayMedium!.copyWith(
                fontSize: 18,
                letterSpacing: 1.1,
                color: AppTheme.textWhite,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Coding section',
              style: t.bodyMedium!.copyWith(
                color: AppTheme.textWhite.withOpacity(0.85),
              ),
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.85,
              label: 'HTML5',
              iconAsset: 'assets/images/html.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.75,
              label: 'CSS',
              iconAsset: 'assets/images/css.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.8,
              label: 'Javascript',
              iconAsset: 'assets/images/js.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.8,
              label: 'NodeJs',
              iconAsset: 'assets/images/node-js.png',
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/monitor.svg',
                  width: w * 0.25,
                  theme: SvgTheme(currentColor: accent),
                ),

                // const SizedBox(width: 30,),

                SvgPicture.asset(
                  'assets/images/ribbon.svg',
                  width: w * 0.5,
                  theme: SvgTheme(currentColor: accent),
                ),

              ],
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.55,
              label: 'React',
              iconAsset: 'assets/images/react.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.85,
              label: 'Angular',
              iconAsset: 'assets/images/angular.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.9,
              label: 'SQLite',
              iconAsset: 'assets/images/sqlite.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.8,
              label: 'Flutter',
              iconAsset: 'assets/images/flutter.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.55,
              label: 'Python',
              iconAsset: 'assets/images/python.png',
            ),
          ],
        ),

        Positioned(
          top: 0,
          right: 8,
          child: SvgPicture.asset(
              'assets/images/code.svg',
            width: w * 0.18,
            theme: SvgTheme(currentColor: accent),
          ),
        ),


      ],
    );
  }
}
