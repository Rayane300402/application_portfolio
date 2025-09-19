import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CustomCard extends StatelessWidget {
  final String label;
  final String imgPath;
  final dynamic onTap;
  final Color color;
  const CustomCard({super.key, required this.label, required this.imgPath, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IgnorePointer(    // keeps splash taps clean
              child: SvgPicture.asset(
                imgPath,
                colorFilter: ColorFilter.mode(
                  AppTheme.textWhite,
                  BlendMode.srcATop,
                ),
              ),
            ),

            const SizedBox(height: 10,),

            Text(
                label,
              style: textTheme.displayMedium!.copyWith(
                  fontSize: 20,
                  color: AppTheme.textWhite,
                  height: 1.6
              ),
            )
          ],
        ),
      ),
    );
  }
}
