import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme.dart';

class MiniSkillItem {
  final String label;
  final String asset; // png or svg
  const MiniSkillItem(this.label, this.asset);
}

class MiniSkillGrid extends StatelessWidget {
  final String title;
  final List<MiniSkillItem> items;
  final EdgeInsets padding;
  final double iconSize;

  const MiniSkillGrid({
    super.key,
    required this.title,
    required this.items,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final w = MediaQuery.of(context).size.width;

    // 3 per row on normal phones, 4 on wider screens.
    final crossAxisCount = w >= 520 ? 4 : 3;

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: t.displayMedium!.copyWith(
                fontSize: 14,
                letterSpacing: 1.0,
                color: AppTheme.textWhite,
              )),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.6, // wider than tall to fit label
            ),
            itemBuilder: (context, i) {
              final it = items[i];
              final isSvg = it.asset.toLowerCase().endsWith('.svg');

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: isSvg
                        ? SvgPicture.asset(it.asset,
                        fit: BoxFit.contain,
                        theme: const SvgTheme(currentColor: AppTheme.textWhite))
                        : Image.asset(it.asset, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    it.label.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: t.bodyMedium!.copyWith(
                      fontSize: 11,
                      height: 1.1,
                      color: AppTheme.textWhite,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
