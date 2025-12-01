import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/theme.dart';

Future<void> showAVOOProcessSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black54,
    builder: (sheetContext) {
      final size = MediaQuery.of(sheetContext).size;

      return GestureDetector(
        // tap outside sheet => close ONLY this sheet
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(sheetContext).pop(),
        child: SafeArea(
          top: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              // absorb taps *inside* sheet so it doesn’t close on content tap
              onTap: () {},
              child: Container(
                constraints: BoxConstraints(maxHeight: size.height * 0.9),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    // little drag handle
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),

                    // header row with back/close
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppTheme.textWhite,
                            ),
                            onPressed: () => Navigator.of(sheetContext).pop(),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'AVOO – UX Case Study',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 18,
                                color: AppTheme.textWhite,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),

                    const Divider(height: 1, color: Colors.white24),

                    // scrollable content
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1) OVERVIEW
                            Text(
                              'Overview',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """AVOO is a financial-wellness mobile app concept focused on budgeting, spending awareness, and habit-building.

This was my capstone project for the Google UX Design Professional Certificate, where I handled the full UX flow: research, personas, user journeys, wireframes, and high-fidelity prototyping in Figma.""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 16),
                            Text(
                              'My Role',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """• UX research  
• User personas & problem framing  
• User journey mapping  
• Low-fidelity wireframes (paper + digital)  
• High-fidelity UI in Figma  
• Interactive prototype""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 2) PROBLEM + GOAL (Google Slides screenshot)
                            Text(
                              'Problem & Goal',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white12,
                                height: 160,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/AVOO/GoogleProblem.png'),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              """Young adults told me they want to budget, but most tools feel overwhelming, too manual, or too “spreadsheet-like.”

AVOO’s goal is to make budgeting feel approachable and guided — small steps, clear feedback, and habit-building instead of guilt and confusion.""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 3) PERSONA (Slides screenshot)
                            Text(
                              'User Persona',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white12,
                                height: 180,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/AVOO/persona.png'),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              """My primary persona is a young professional with irregular spending habits, anxiety around money, and a strong desire for clarity and small, achievable progress.

Key needs:
• Simple overviews instead of complex charts  
• Gentle reminders to log expenses  
• Clear categories and goals that feel realistic""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 4) RESEARCH SUMMARY (text only)
                            Text(
                              'Research Summary',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """From interviews and secondary research, a few patterns showed up repeatedly:

• People forget to log expenses unless the app reminds them at the right time  
• Many users have tried budgeting apps and dropped them within weeks  
• Overly complex onboarding is a huge drop-off point  
• Visual clarity matters more than “advanced features”  

These insights shaped the onboarding, dashboard structure, and notification strategy in AVOO.""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Figma link button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.textWhite,
                                  foregroundColor: AppTheme.primaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () async{
                                  final uri = Uri.parse('https://docs.google.com/presentation/d/1I9XTZ_appR-S_DBG9rYSq6EmktB1levFfhPnuSApj94/edit?usp=sharing'); // your real link
                                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                                    throw Exception('Could not launch $uri');
                                  }
                                },
                                child: const Text(
                                  'View Google Slide',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 5) PHYSICAL WIREFRAMES (handwritten collage)
                            Text(
                              'Early Sketches',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Transform.rotate(
                                  angle: -3.14159 / 2, // 90° clockwise
                                  child: Image.asset(
                                    'assets/images/AVOO/AVOO-3.jpeg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Transform.rotate(
                                  angle: -3.14159 / 2,
                                  child: Image.asset(
                                    'assets/images/AVOO/AVOO-4.jpeg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Transform.rotate(
                                  angle: -3.14159 / 2,
                                  child: Image.asset(
                                    'assets/images/AVOO/AVOO-5.jpeg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Transform.rotate(
                                  angle: -3.14159 / 2,
                                  child: Image.asset(
                                    'assets/images/AVOO/AVOO-6.jpeg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),
                            Text(
                              """Paper sketches let me quickly explore different dashboard layouts, navigation for goals, and how reminders and insights should appear without committing to pixels yet.""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 6) DIGITAL WIREFRAMES
                            Text(
                              'Digital Wireframes',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white12,
                                height: 160,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/AVOO/lowfiMobile.png'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white12,
                                height: 160,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/AVOO/lowfiWeb.png'),
                              ),
                            ),

                            const SizedBox(height: 8),
                            Text(
                              """These wireframes locked in the core structure: a simple overview, quick access to logging, and clear paths to goals and insights.""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 7) FINAL UI + PROTOTYPE CTA
                            Text(
                              'Final UI & Prototype',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white12,
                                height: 160,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/AVOO/protoMobile.png'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white12,
                                height: 160,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/AVOO/protoWeb.png'),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Figma link button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.textWhite,
                                  foregroundColor: AppTheme.primaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () async{
                                  final uri = Uri.parse('https://www.figma.com/design/29NXlTWKs1hQkuIfvnFhia/UX-Course?node-id=4-2&t=itVUmwmUpuW1iaF2-1'); // your real link
                                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                                    throw Exception('Could not launch $uri');
                                  }
                                },
                                child: const Text(
                                  'View Figma Prototype',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 8) REFLECTION
                            Text(
                              'Reflection',
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """AVOO forced me to treat UX as a structured process, not just “making pretty screens.”

                              It strengthened how I:
                              • frame problems and goals clearly  
                              • turn research into concrete UI decisions  
                              • move from sketches to wireframes to polished UI  
                              • build prototypes that actually tell a story  
                              
                              This project is a key bridge between my early UI experiments and the more complex production work I now do in Flutter and at AIY.""",
                              style: Theme.of(
                                sheetContext,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
