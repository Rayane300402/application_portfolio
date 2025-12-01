import 'package:flutter/material.dart';
import '../../theme/theme.dart';

Future<void> showTSB2ProcessSheet(BuildContext context) {
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
                              'TSB2 – Engineering Process',
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
                              'TSB2 was my first real-world software project, the reason I grew from "I know the basic" to'
                                  '"I can ship a full production app". It was a complete revamp of the original TSB, with a new UI,'
                                  ' new features, and a full rebuild using Angular, Node.js, Electron, and SQLite.\n'
                                  'This project taught me how to build software from the inside out.',
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
                              'Growth',
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
                              'I spent my first few weeks training:\n'
                                  '   • Learning Angular\n'
                                  '   • Understand how Electron wraps a web application into a desktop environment\n'
                                  '   • Getting familiar with the existing Node.js utilities used by the company.\n'
                                  'Once I had the fundamentals, I was handed the Figma file and told to start building.',
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
                              'Responsibilities',
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
                              'The UI was my first responsibility. I wasn\'t just coding it, I had permission '
                                  'to work on the figma file; change, add, remove.\n'
                                  'My first code was very messy, too many lines that could be shortened and do many duplicates. '
                                  'I learned from this mess a bit later how to clean it, turn duplicates into components. understand clean architecture instead of patching things together\n\n'
                                  'When Ui foundation was in place, I moved to the local db. I had 0 knowledge in SQLite before but I do have knowledge '
                                  'in queries so I learned it while building it. There was a bit of struggle with relationship building with tables but I got help from my coworkers then and it was super smooth from then on.\n\n'
                                  'My first 2-3 months were just me building TSB2 semi-completing the front-end and the database, when my manager noticed how far I was in the works, he has 2 coworkers who worked on TSB1 join me '
                                  'and have them implement the backend service and speed up the work to go Beta before the end of the year and getting published at the beginning of the new year.',
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
                              'TSB2 has been live for over 2 years. By the end of 2024, I stepped away to focus'
                                  'entirely on Laced, but the skills I learned from this project shaped everything I '
                                  'built afterward. TSB taught me how to learn fast, debug properly, designer cleaner solutions, '
                                  'and take ownership of a production codebase. Without that experience, I wouldn\'t have been able to build Laced'
                                  'as smoothly as I did.',
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
