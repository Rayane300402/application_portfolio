import 'package:flutter/material.dart';
import 'package:portfolio/components/customButton.dart';
import 'package:portfolio/components/customCard.dart';
import 'package:portfolio/components/cvDialog.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blobs/bottomHueBlob.dart';
import '../sheets/getToKnowMe.dart';
import '../sheets/projects.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _card1Offset;
  late Animation<Offset> _card2Offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _card1Offset = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _card2Offset = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> launchEmail(BuildContext context) async {
    final Uri emailUri = Uri.parse(
      'mailto:rayanenaboulsibusiness@gmail.com'
          '?subject=${Uri.encodeComponent('Portfolio Contact')}'
          '&body=${Uri.encodeComponent('Hello Rayane,')}',
    );


    try {
      final launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        _showError(context);
      }
    } catch (e) {
      _showError(context);
    }
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Could not open email app.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Positioned(
            top: -350,
            left: -200,
            right: 0,
            height: size.height * 0.45,
            child: const BottomHueBlob(),
          ),


          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profileShape.png',
                  width: size.width * 0.5,         // adjust width/scale
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10,),

                Text(
                  'Rayane Al Naboulsi',
                  style: textTheme.displayLarge!.copyWith(
                    // keep font/weight/color all coming from AppTheme
                    fontSize: 30,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 5,),

                Text(
                  'Software/Application Developer ',
                  style: textTheme.displayMedium!.copyWith(
                    // keep font/weight/color all coming from AppTheme
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),

              ],
            ),
          ),

          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  color: AppTheme.accentOrange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => showCVDialog(context),
                          child: Text('Download CV',
                          style: textTheme.displayLarge!.copyWith(
                            fontSize: 20,
                            color: AppTheme.primaryGreen,
                            fontWeight: FontWeight.w700
                          ),),
                        ),
                        const SizedBox(width: 30,),

                        CustomButton(label: 'Contact Me!', onTap: () => launchEmail(context))

                      ],
                    ),

                    const SizedBox(height: 50,),

                    // cards here 'assets/images/User_Card_ID.svg'

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: _card1Offset,
                          child: CustomCard(label: 'Get\nto Know Me', imgPath: 'assets/images/User_Card_ID.svg',
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => const KnowMeSheet(),
                                );
                              },
                              color: AppTheme.primaryGreen72),
                        ),

                        const SizedBox(width: 30,),

                        SlideTransition(
                          position: _card2Offset,
                          child: CustomCard(label: 'Check out\nmy projects', imgPath: 'assets/images/Mobile_Button.svg',   onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => const ProjectsSheet(),
                            );
                          }, color: AppTheme.accentOrange74),
                        ),

                      ],
                    ),


                  ],
                ),
              )
          )

        ],
      ))
    );
  }
}
