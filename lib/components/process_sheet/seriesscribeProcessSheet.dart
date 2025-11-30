import 'package:flutter/material.dart';
import '../../theme/theme.dart';

Future<void> showSeriesScribeProcessSheet(BuildContext context) {
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
                constraints: BoxConstraints(
                  maxHeight: size.height * 0.9,
                ),
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
                            icon: const Icon(Icons.arrow_back,
                                color: AppTheme.textWhite),
                            onPressed: () => Navigator.of(sheetContext).pop(),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'SeriesScribe – Design Process',
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

                    const Divider(
                      height: 1,
                      color: Colors.white24,
                    ),

                    // scrollable content
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              'SeriesScribe began as a focused UI learning exercise. '
                                  'I wanted to improve my Figma skills by rebuilding a complex, '
                                  'real multi-screen product experience. Instead of books, '
                                  'I adapted StoryGraph’s concept to TV series, anime, '
                                  'and dramas — designing a full ecosystem of pages, interactions, '
                                  'and components.\n'
                                  'This project let me sharpen my visual design fundamentals: '
                                  'spacing, hierarchy, color, scale, '
                                  'and consistency across dozens of screens',
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
                              'Objective',
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
                              'The goal wasn’t to invent a new product from scratch — it was to learn how great interfaces are assembled by recreating and then adapting them.'
                                  'My priority was:\n'
                                  '   • understanding how to structure huge interfaces\n'
                                  '   • practicing mobile-friendly UI patterns\n'
                                  '   • learning how to keep a design system consistent\n'
                                  '   • improving color and accessibility choices\n'
                                  '   • training my ability to redesign features in my own style\n'
                                  'This was a UI-first exploration — no heavy UX research, just hands-on interface building.',
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
                              'Competitive Analysis (informal but real)',
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
                              'Instead of classic UX competitor matrices, I used a more practical approach:\n'
                                  'I studied StoryGraph screen by screen, breaking down:'
                                  '   • layout density\n'
                                  '   • text scales\n'
                                  '   • spacing patterns\n'
                                  '   • navigation habits\n'
                                  '   • card structure\n'
                                  '   • empty state design\n'
                                  '   • filtering patterns\n'
                                  '   • visual rhythm in long-scroll pages\n'
                                  'This taught me how a mature product organizes massive content without'
                                  ' feeling chaotic — a lesson I mirrored in SeriesScribe.',
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
                              'Color & Typography Exploration',
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
                              'One of my biggest weaknesses before this project was color.\n'
                                  'My original work (OrderlyFlow) used harsh colors that are far too silly and unprofessional looking.\n'
                                  'With SeriesScribe, I explored: '
                                  '   • lighter, desaturated greens for accents\n'
                                  '   • type scales that work across long text blocks\n'
                                  '   • subtle elevation instead of heavy borders\n'
                                  'This project genuinely fixed my color usage fundamentals.',
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
                              'Full Screen Flows Designed',
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
                              'SeriesScribe includes complete flows such as:\n'
                                  'Onboarding & Account\n'
                                  '   • signup\n'
                                  '   • login\n'
                                  '   • preference survey\n'
                                  '   • pre-survey (just like StoryGraph\'s "reader type" type\n\n'
                                  'Home/Explore\n'
                                  '   • recommendations\n'
                                  '   • popular this week\n'
                                  '   • creator\'s favorites\n'
                                  '   • deep item interactions\n\n'
                                  'Tracking & Progress\n'
                                  '   • currently watching\n'
                                  '   • watch journal\n'
                                  '   • progress editing\n'
                                  '   • finished entry flow\n\n'
                                  'Community\n'
                                  '   • shared reviews\n'
                                  '   • tagged discussions\n'
                                  '   • challenge hub\n'
                                  '   • create-a-challenge forms\n\n'
                                  'Profile\n'
                                  '   • stats\n'
                                  '   • goals\n'
                                  '   • settings\n'
                                  '   • account management\n\n'
                              'The volume of screens made it a realistic, end-to-end design exercise.' ,
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
                              'Key Skills Gained',
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
                              'This project taught me:\n'
                                  '   • how to design complex products alone\n'
                                  '   • how to build & maintain a component library\n'
                                  '   • how to analyze real UI and reconstruct it in Figma\n'
                                  '   • how to choose colors that work across dozens of pages\n'
                                  '   • how to keep visual consistency at scale\n'
                                  '   • how to refine layouts to avoid clutter\n'
                                  '   • how to plan flows before drawing screens\n'
                                  'The volume of screens made it a realistic, end-to-end design exercise.' ,
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
                              'SeriesScribe wasn’t meant for production — it was meant for growth.\n'
                                  'It helped me break through the fear of large projects, '
                                  'understand real design systems, and prepare for more complex production work '
                                  'later on (like OrderlyFlow and my Laced redesign tasks).\n'

                                  'This project marks the moment I went from “experimenting in Figma” to “designing actual coherent products.”' ,
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
