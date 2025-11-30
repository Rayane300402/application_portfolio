import 'package:flutter/material.dart';
import 'package:portfolio/pages/splashScreen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // The FIRST page of the app (your splash)
    return const SplashScreen();
  }
}
