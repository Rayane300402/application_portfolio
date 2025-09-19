import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class ProjectsSheet extends StatelessWidget {
  const ProjectsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: Text(
          'Projects Content Here',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
