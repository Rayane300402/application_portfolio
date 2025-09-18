import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/pages/introductionPage.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/blobs/bottomHueBlob.dart';
import 'package:portfolio/blobs/topBlob.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>     with TickerProviderStateMixin {
  late final AnimationController _main;     // 0 -> 1 one-shot
  late final AnimationController _breath;   // repeats for glow

  late final Animation<double> _topIn;      // blob drop
  late final Animation<double> _imgIn;      // image slide/scale
  late final Animation<double> _textIn;

  double d2r = math.pi / 180.0;
  double? lerpDouble(num a, num b, double t) => a + (b - a) * t;


  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const IntroductionPage()),
        );
      }
    });

    _main = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));
    _breath = AnimationController(vsync: this, duration: const Duration(milliseconds: 2400))
      ..repeat(reverse: true);

    // Staggered intervals
    _topIn  = CurvedAnimation(parent: _main, curve: const Interval(0.0, 0.50, curve: Curves.easeOutBack));
    _imgIn  = CurvedAnimation(parent: _main, curve: const Interval(0.20, 0.80, curve: Curves.easeOutCubic));
    _textIn = CurvedAnimation(parent: _main, curve: const Interval(0.55, 1.00, curve: Curves.easeOut));

    _main.forward();
  }

  @override
  void dispose() {
    _main.dispose();
    _breath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppTheme.primaryGreen,
      body: AnimatedBuilder(
        animation: Listenable.merge([_main, _breath]),
        builder:  (context, _){
          final pulse = math.sin(_breath.value * 2 * math.pi);

          return Stack(
              children: [
                // Top Blob
                Positioned(
                  top: -size.height * 0.26 + lerpDouble(-size.height * 0.38, 0.0, _topIn.value)!,
                  left: lerpDouble(-size.width * 0.20, -size.width * 0.35, _topIn.value)!, // subtle horizontal settle
                  width: size.width * 1.5,
                  height: size.height * 0.7,
                  child: IgnorePointer(    // keeps splash taps clean
                    child: SvgPicture.asset(
                      'assets/images/topBlob.svg',
                      colorFilter: ColorFilter.mode(
                        AppTheme.accentOrange,
                        BlendMode.srcATop,
                      ),
                    ),
                  ),
                ),

                // Image
                Positioned(
                  right: lerpDouble(-size.width * 0.15, 0.0, _imgIn.value)!,
                  bottom: lerpDouble(-20, 0, _imgIn.value)!,
                  width: size.width * lerpDouble(0.56, 0.62, _imgIn.value)!,
                  height: size.height * lerpDouble(0.72, 0.78, _imgIn.value)!,
                  child: IgnorePointer(    // keeps splash taps clean
                    child: Opacity(
                      opacity: _imgIn.value,
                      child: Image.asset(
                        'assets/images/Profile.png',      // <- your asset path
                        fit: BoxFit.cover,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),

                // Text
                Align(
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
                      offset: Offset(lerpDouble(-30, 0, _textIn.value)!, 0),
                      child: Opacity(
                        opacity: _textIn.value,
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'WELCOME',
                              style: textTheme.displayLarge!.copyWith(
                                // keep font/weight/color all coming from AppTheme

                                fontSize: 130,
                                letterSpacing: 2,
                              ),
                            )
                        ),
                      ),
                    )
                ),

                // Bottom blurred hue blob
                Positioned(
                  left: -100,
                  right: 0,
                  bottom: -90,
                  height: size.height * 0.5,
                  child: const BottomHueBlob(),
                ),
              ]
          );
        },
      ),
    );
  }
}
