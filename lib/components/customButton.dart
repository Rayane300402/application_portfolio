import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final dynamic onTap;
  const CustomButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.primaryGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
