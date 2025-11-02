import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class ProjectActionButtonData {
  final String iconAsset;     // e.g. 'assets/images/playstore.png'
  final String label1;         // e.g. 'Checkout\nWebsite' or 'Get on\nApp Store'
  final String label2;
  final VoidCallback onTap;

  const ProjectActionButtonData({
    required this.iconAsset,
    required this.label1,
    required this.label2,
    required this.onTap,
  });
}

class ProjectActionButton extends StatelessWidget {
  final ProjectActionButtonData data;

  const ProjectActionButton({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    // matches your pill vibe: rounded, light bg-ish to stand off the green card
    return GestureDetector(
      onTap: data.onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 145,
          maxWidth: 150, // ⬅️ give it breathing room, not fixed
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.accentOrange, // warm brownish pill like screenshot footer cards
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              data.iconAsset,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            // allow 2-line label like in your screenshot
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label1,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    height: 1.2,
                    color: AppTheme.textWhite,
                    // fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  data.label2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    height: 1.2,
                    color: AppTheme.textWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
