import 'package:flutter/material.dart';
import '../../theme/theme.dart';

Future<void> showLacedProcessSheet(BuildContext context) {
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
                              'Laced – Engineering Process',
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
                              'Laced was first a two-person project: I handled the Flutter app and the local data system, '
                                  'while another coworker handled the backend services and the core.'
                                  'Flutter was an obvious choice, I already have experience in Flutter as I build a full desktop app '
                                  'using it during my last year in university, so it gave us the fastest path from idea'
                                  'to working product.',
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
                              'Architecture & Stack',
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
                              '• On the app side, i built a complete SQLite system:\n'
                              '   • versioned migrations\n'
                              '   • safe upgrades for future design changes\n'
                              '   • default data seeding\n'
                              '   • a clean, predictable structure that wouldn\'t break even as the UI was overhauled\n'
                              '• Backend reality\n'
                              '   • a core nodejs service\n'
                              '   • a separate dashboard\n'
                              '   • and server processes managed via systemctl.\n'
                              'They communicated with the app mostly through WebSockets and dedicated API routes.'
                                  'That splot architecture worked well, but it meant every part require coordination.',
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
                              'Challenges & Outcomes',
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
                              'Halfway through the project, the developer handling the backend left and Laced became solely mine. '
                                  'I took ownership of the entire pipeline myself. App, server, core logic and pushing update to users\n'
                                  'I had working knowledge in Node.js as I worked in an Angular-Electron desktop app before Laced,'
                                  'but I did not have hands-on experience with Laced\'s code. A coworker who helped my old teammate with the backend before he left, helped me fill the gaps, '
                                  'walking me through some of the architectural choices and patterns. Slowly I got the hang of it and can proudly call Laced mine in evert part.',
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
                              'Feature Growth',
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
                              'Once stable, I expanded the system. I added, removed, moved, cleaned, automated\n'
                                  '   • Like new features, 3rd party tools\n'
                                  '   • Improved task handling\n'
                                  '   • updated and maintained WebSocket behavior into a faster, smoother way',
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
                              'Where It Stands Now',
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
                              'Android approved our work quickly, we struggled a bit with iOS but eventually it became live and now we have:\n'
                                  '   • ~300+ iOS users &\n'
                                  '   • ~1.4k+ Android users\n'
                              'And the full stack is something I can maintain confidently end-to-end.',
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
