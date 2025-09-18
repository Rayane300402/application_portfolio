import 'package:flutter/material.dart';
import 'package:portfolio/components/customButton.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blobs/bottomHueBlob.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'rayanenaboulsibusiness@gmail.com',
      query: Uri.encodeFull('subject=Portfolio Contact&body=Hello Rayane,'),
    );
    if(await canLaunchUrl(emailLaunchUri)){
      await launchUrl(emailLaunchUri);
    }else {
      debugPrint('Could not launch email client');
    }
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
                        Text('Download CV',
                        style: textTheme.displayLarge!.copyWith(
                          fontSize: 20,
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w700
                        ),),
                        const SizedBox(width: 30,),

                        CustomButton(label: 'Contact Me!', onTap:_launchEmail)

                      ],
                    )
                  ],
                ),
              )
          )

        ],
      ))
    );
  }
}
