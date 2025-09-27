import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return LayoutBuilder(
        builder: (context, constraint) {
          final w = constraint.maxWidth;
          final headlineSize = w * 0.12; // ~ responsive  (e.g. 28–34 on phones)
          final rectWidth = w * 0.55;
          final rectHeight = headlineSize * 4.2; // roughly the block behind the avatar
          final avatarSize = rectHeight * 1.5;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: rectHeight + 20,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Positioned(
                      right: 0,
                      top: 8,
                      width: rectWidth +40,
                      height: rectHeight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen72,
                          // borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    Positioned(
                      left:-rectWidth * 0.13,
                      top: rectHeight * 0.32,
                      child: IgnorePointer(
                        child: SvgPicture.asset(
                          'assets/images/ScratchDash.svg',
                          colorFilter: const ColorFilter.mode(
                            AppTheme.primaryGreen, // light accent like your design
                            BlendMode.srcATop,
                          ),
                          width: rectWidth * 1.2,
                        ),
                      ),
                    ),

                    Positioned(
                      right: -rectWidth * 0.13,
                      bottom: - rectHeight * 0.4,
                      width: avatarSize,
                      height: avatarSize,
                      child: Image.asset(
                        'assets/images/profileSmall.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    Positioned(
                      left: 0,
                      top: 0,
                      width: w * 0.55,
                      child: Text(
                        "I love to\ncreate\npretty\nsites and\napps",
                        style: t.displayMedium!.copyWith(
                            fontSize: headlineSize.clamp(27, 40),
                            height: 0.95
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 100,),

              Text(
                "Hello! and welcome to my portfolio.",
                style: t.bodyMedium!.copyWith(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),

            ],
          );
        }
    );
  }
}
