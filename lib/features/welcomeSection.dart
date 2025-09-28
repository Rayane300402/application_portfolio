import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({super.key});

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _spiralController;

  late Animation<Offset> _profileSlide;
  late Animation<Offset> _textSlide;
  late Animation<double> _textOpacity;
  late Animation<double> _dashScale;

  @override
  void initState() {
    super.initState();

    // Entrance animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Continuous spiral rotation
    _spiralController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    // Animations
    _profileSlide = Tween<Offset>(
      begin: const Offset(1.0, 0), // from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _textSlide = Tween<Offset>(
      begin: const Offset(-0.8, 0), // from left
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    _dashScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.6, curve: Curves.elasticOut),
      ),
    );

    // Start entrance animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _spiralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constraint) {
        final w = constraint.maxWidth;
        final headlineSize = w * 0.12; // ~ responsive  (e.g. 28–34 on phones)
        final rectWidth = w * 0.55;
        final rectHeight =
            headlineSize * 4.2; // roughly the block behind the avatar
        final avatarSize = rectHeight * 1.5;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: rectHeight + 20,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SlideTransition(
                    position: _profileSlide,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: 0,
                          top: 8,
                          width: rectWidth + 40,
                          height: rectHeight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.primaryGreen72,
                            ),
                          ),
                        ),

                        Positioned(
                          left: -rectWidth * 0.13,
                          top: rectHeight * 0.32,
                          child: IgnorePointer(
                            child: SvgPicture.asset(
                              'assets/images/ScratchDash.svg',
                              colorFilter: const ColorFilter.mode(
                                AppTheme
                                    .primaryGreen, // light accent like your design
                                BlendMode.srcATop,
                              ),
                              width: rectWidth * 1.2,
                            ),
                          ),
                        ),

                        Positioned(
                          right: -rectWidth * 0.13,
                          bottom: -rectHeight * 0.4,
                          width: avatarSize,
                          height: avatarSize,
                          child: Image.asset(
                            'assets/images/profileSmall.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Positioned(
                  //   right: -rectWidth * 0.13,
                  //   bottom: - rectHeight * 0.4,
                  //   width: avatarSize,
                  //   height: avatarSize,
                  //   child: Image.asset(
                  //     'assets/images/profileSmall.png',
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  Positioned(
                    left: 0,
                    top: 0,
                    width: w * 0.55,
                    child: FadeTransition(
                      opacity: _textOpacity,
                      child: SlideTransition(
                        position: _textSlide,
                        child: Text(
                          "I love to\ncreate\npretty\nsites and\napps",
                          style: t.displayMedium!.copyWith(
                            fontSize: headlineSize.clamp(27, 40),
                            height: 0.95,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),

            FadeTransition(
              opacity: _textOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello! and welcome to my portfolio.",
                    style: t.bodyMedium!.copyWith(fontSize: 18, height: 1.5),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "My name is Rayane AbdulHakim Al Naboulsi. I am currently 23 years old. "
                        "My birthday is on the 30th of April.",
                    style: t.bodyMedium!.copyWith(fontSize: 18, height: 1.6),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "As a flutter developer specializing in crafting intuitive mobile and PC apps. "
                        "Let this portfolio show you how i bring ideas to life!",
                    style: t.bodyMedium!.copyWith(fontSize: 18, height: 1.6),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ——— Bottom wood spiral ———
            SizedBox(
              height: w * 0.6, // taller to allow oversize
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: -w * 0.15, // push it ~15% outside the right edge
                    bottom: 0,
                    child: IgnorePointer(
                      child: SvgPicture.asset(
                        'assets/images/WoodSpiral.svg',
                        colorFilter: ColorFilter.mode(
                          AppTheme.primaryGreen.withOpacity(0.85),
                          BlendMode.srcATop,
                        ),
                        width: w * 0.7, // make it ~110% of screen width
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
