import 'package:flutter/material.dart';
import 'package:portfolio/app_root.dart';
import 'package:portfolio/theme/theme.dart';

class WebPhoneShell extends StatelessWidget {
  const WebPhoneShell({super.key});

  @override
  Widget build(BuildContext context) {
    const double phoneWidth  = 430;  // iPhone 14 Pro Max-ish
    const double phoneHeight = 932;  // iPhone height – pick your target

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        backgroundColor: const Color(0xFF111111),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Rayane Al-Naboulsi — Mobile Portfolio",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
          
                const SizedBox(height: 32),
          
                // ==== PHONE FRAME =====
                Container(
                  width: phoneWidth,
                  height: phoneHeight,
                  padding: const EdgeInsets.all(14),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          size: Size(constraints.maxWidth, constraints.maxHeight),
                        ),
                        child: const AppRoot(),
                      );
                    },
                  ),
          
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
