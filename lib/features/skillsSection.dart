import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/skillMeter.dart';

import '../components/skillGrid.dart';
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
              'Coding & Scripting',
              style: t.displayMedium!.copyWith(
                fontSize: 14,
                letterSpacing: 1.0,
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

            const SizedBox(height: 20,),

            SkillMeter(
              value: 0.55,
              label: 'React',
              iconAsset: 'assets/images/react.png',
            ),

            const SizedBox(height: 20,),

            SkillMeter(
              value: 0.85,
              label: 'Angular',
              iconAsset: 'assets/images/angular.png',
            ),


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


            SkillMeter(
              value: 0.85,
              label: 'Bootstrap',
              iconAsset: 'assets/images/media.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.55,
              label: 'TailwindCSS',
              iconAsset: 'assets/images/icons8-tailwind-css-480.png',
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, -1.0, 1.0),
                  child: SvgPicture.asset(
                    'assets/images/ribbon.svg',
                    width: w * 0.5,
                    theme: SvgTheme(currentColor: accent),
                  ),
                ),

                SvgPicture.asset(
                  'assets/images/polaroid.svg',
                  width: w * 0.3,
                  theme: SvgTheme(currentColor: accent),
                ),
              ],
            ),

            Text(
              'Databases',
              style: t.displayMedium!.copyWith(
                fontSize: 14,
                letterSpacing: 1.0,
              ),
            ),

            const SizedBox(height: 20),
            const SkillMeter(
              value: 0.45,
              label: 'MongoDB ',
              iconAsset: 'assets/images/mongodb.png',
            ),

            const SizedBox(height: 20),
            const SkillMeter(
              value: 0.45,
              label: 'Supabase ',
              iconAsset: 'assets/images/supabase-logo-icon.png',
            ),

            const SizedBox(height: 20),
            SkillMeter(
              value: 0.9,
              label: 'SQLite',
              iconAsset: 'assets/images/sqlite.png',
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/Pencil.svg',
                  width: w * 0.35,
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

            MiniSkillGrid(
              title: 'UI/UX (skills)',
              items: const [
                MiniSkillItem('Wireframing', 'assets/images/wireframe.png'),
                MiniSkillItem('Prototyping', 'assets/images/prototype.png'),
                MiniSkillItem('UX Design',   'assets/images/ux.png'),
                // MiniSkillItem('User Research','assets/icons/research.png'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, -1.0, 1.0),
                  child: SvgPicture.asset(
                    'assets/images/ribbon.svg',
                    width: w * 0.5,
                    theme: SvgTheme(currentColor: accent),
                  ),
                ),

                SvgPicture.asset(
                  'assets/images/polaroid.svg',
                  width: w * 0.3,
                  theme: SvgTheme(currentColor: accent),
                ),
              ],
            ),

            MiniSkillGrid(
              title: 'Softwares',
              items: const [
                MiniSkillItem('PowerPoint', 'assets/images/ppt.png'),
                MiniSkillItem('Word', 'assets/images/doc.png'),
                MiniSkillItem('Figma', 'assets/images/figma.png'),
                MiniSkillItem('Git','assets/images/git.png'),
                MiniSkillItem('Github','assets/images/github.png'),
                MiniSkillItem('BitBucket', 'assets/images/bitbucket.png'),
              ],
            ),

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

            Text(
              'NON-TECHNICAL SKILLS',
              style: t.displayMedium!.copyWith(
                fontSize: 18,
                letterSpacing: 1.1,
                color: AppTheme.textWhite,
              ),
            ),
            const SizedBox(height: 20),

            SkillMeter(
              value: 0.8,
              label: 'Communication',
              iconAsset: 'assets/images/chat.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.7,
              label: 'Cooperation',
              iconAsset: 'assets/images/handshake.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.95,
              label: 'Organization',
              iconAsset: 'assets/images/organization-skills.png',
            ),

            const SizedBox(height: 20),

            SkillMeter(
              value: 0.96,
              label: 'Time Management',
              iconAsset: 'assets/images/time.png',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, -1.0, 1.0),
                  child: SvgPicture.asset(
                    'assets/images/ribbon.svg',
                    width: w * 0.5,
                    theme: SvgTheme(currentColor: accent),
                  ),
                ),
                Image.asset(
                    'assets/images/book.png',
                  width: w * 0.3,
                )

              ],
            ),

            Text(
              'HOBBIES',
              style: t.displayMedium!.copyWith(
                fontSize: 18,
                letterSpacing: 1.1,
                color: AppTheme.textWhite,
              ),
            ),
            // const SizedBox(height: 20),
            MiniSkillGrid(
              title: '',
              items: const [
                MiniSkillItem('Crafts', 'assets/images/corchet.png'),
                MiniSkillItem('Reading', 'assets/images/open-book.png'),
                MiniSkillItem('Journaling', 'assets/images/notebook.png'),
                MiniSkillItem('Gaming','assets/images/gaming.png'),
                MiniSkillItem('Anime','assets/images/anime.png'),
                MiniSkillItem('Baking', 'assets/images/baking.png'),
              ],
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
