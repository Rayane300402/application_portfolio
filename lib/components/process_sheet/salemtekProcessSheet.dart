import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/theme.dart';

Future<void> salemtekProcessSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black54,
    builder: (sheetContext) {
      final size = MediaQuery.of(sheetContext).size;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(sheetContext).pop(),
        child: SafeArea(
          top: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {}, // absorb taps inside
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
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),

                    // header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: AppTheme.textWhite),
                            onPressed: () => Navigator.of(sheetContext).pop(),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Salemtek – UX Case Study',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
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

                    // content
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding:
                        const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ==== OVERVIEW ====
                            Text(
                              'Overview',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """Salemtek is a pill–reminder app concept focused on helping users stay consistent with daily medication and supplements.

This project started as a personal idea and evolved into a full UX case study: handwritten research notes, personas, journeys, paper wireframes, and high-fidelity Figma designs.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 16),
                            Text(
                              'My Role',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """• UX research & note-taking  
• Problem & goal definition  
• Personas and user types  
• User journey mapping  
• Paper wireframes  
• Digital wireframes & final UI in Figma  
• Interactive prototype""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== PROBLEM + GOAL ====
                            const SizedBox(height: 24),
                            Text(
                              'Problem & Goal',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Handwritten problem/goal page – ROTATED
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-1.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """Handwritten notes captured the core tension: people want to stay consistent with pills (birth control, chronic meds, vitamins) but feel overwhelmed by strict schedules, clinical apps, and guilt around missed doses.

Goal: design a reminder app that feels supportive, light, and reliable — not judgmental or overly “medical” — while still keeping users on track.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== PERSONAS ====
                            const SizedBox(height: 24),
                            Text(
                              'Personas',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Persona: Layla (rotated page)
                            Text(
                              'Persona – Layla',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-4.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              """Layla is a busy teacher managing thyroid and blood-pressure meds. She wants calm, reliable reminders and an interface that feels warm and simple rather than clinical or noisy.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            const SizedBox(height: 16),
                            Text(
                              'Personas – Sarah & Daniel',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-3.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              """Sarah represents users on birth control who feel guilty when they miss a dose and want reminders that feel personal, not clinical. Daniel represents wellness-tracking users juggling vitamins and supplements who need quick overviews and progress logs, not spreadsheets.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== UNDERSTANDING USERS ====
                            const SizedBox(height: 24),
                            Text(
                              'Understanding Users',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-2.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """Notes grouped users into primary (pill users), secondary (supplement/wellness trackers), and tertiary (chronic condition patients).

Across them, the recurring needs were:  
• trustworthy reminders that don’t disappear  
• clear daily/weekly/monthly progress  
• encouragement that feels kind instead of nagging  
• simple, accessible UI with strong contrast""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== USER JOURNEY ====
                            const SizedBox(height: 24),
                            Text(
                              'User Journey',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-5.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """The journey mapped how a typical day looks when juggling work, social life, and medication: rushing mornings, forgotten doses, late-night guilt, and the relief of staying on track.

This directly informed where reminders appear, how often, and how confirmation and streaks should work.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== PAPER WIREFRAMES ====
                            const SizedBox(height: 24),
                            Text(
                              'Paper Wireframes',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // a tall collage of sketches – multiple images if you want
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-7.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-8.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """Sketches explored the main dashboard, streak views, pill cards, and add-pill flows before anything moved into Figma. The focus was on keeping flows short and layouts readable.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== DIGITAL WIREFRAMES ====
                            const SizedBox(height: 24),
                            Text(
                              'Digital Wireframes',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-9.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """Low-fidelity Figma wireframes locked in navigation: home with today’s pills, detail screens, streak/progress, and settings for schedules and notification tone.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textWhite,
                              ),
                            ),

                            // ==== FINAL UI & PROTOTYPE ====
                            const SizedBox(height: 24),
                            Text(
                              'Final UI & Prototype',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/Salemtek/salemtek-10.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 12),
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
                                onPressed: ()async {
                                  final uri = Uri.parse('https://www.figma.com/design/PYBCmi2Xfe7iF6kDD2VEDh/Salemtek?node-id=0-1&t=SneOxVBsVHkpy5Tn-1');
                                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                                    throw Exception('Could not launch $uri');
                                  }
                                },
                                child: const Text(
                                  'View Figma Prototype',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            // ==== REFLECTION ====
                            const SizedBox(height: 24),
                            Text(
                              'Reflection',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                fontSize: 16,
                                color: AppTheme.textWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              """Salemtek is where my UX toolkit became real: not just nice screens, but research, personas, journeys, and iteration.

The project taught me how to translate messy handwritten thinking into structured flows, and how to keep a serious use case (medication) feeling humane, warm, and supportive instead of clinical or judgmental.""",
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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