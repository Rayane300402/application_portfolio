import 'package:flutter/material.dart';
import 'package:portfolio/app_root.dart';
import 'package:portfolio/theme/theme.dart';

class WebPhoneShell extends StatelessWidget {
  const WebPhoneShell({super.key});

  @override
  Widget build(BuildContext context) {
    const double phoneWidth = 430;       // Same width as your mobile design
    const double phoneAspect = 19.5 / 9; // Slightly tall phone

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        backgroundColor: const Color(0xFF111111),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Rayane Al-Naboulsi — Mobile Portfolio",
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),

              // PHONE FRAME
              Container(
                width: phoneWidth,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(42),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 40,
                      spreadRadius: 8,
                      offset: Offset(0, 16),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: AspectRatio(
                    aspectRatio: phoneAspect,
                    child: const AppRoot(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
