import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('I love to create pretty sites and apps!',
            style: t.displayLarge!.copyWith(fontSize: 28)),
        const SizedBox(height: 12),
        Text(
          "Hello! and welcome to my portfolio.\n\n"
              "My name is Rayane AbdulHakim Al Naboulsi...",
          style: t.bodyMedium!.copyWith(height: 1.6),
        ),
      ],
    );
  }
}
