import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('AIY EXPERTS SOLUTIONS', style: t.displayMedium!.copyWith(fontSize: 18)),
        Text('January 2024 – Present', style: t.bodyMedium),
        const SizedBox(height: 6),
        Text("Software Developer\n• UX/UI + front-end in Flutter\n• Build/design process collab, etc.",
            style: t.bodyMedium!.copyWith(height: 1.6)),
      ],
    );
  }
}
