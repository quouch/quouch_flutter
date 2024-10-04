import 'package:flutter/material.dart';
import 'package:quouch_app/theme/spacing.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.text, this.subtitle, super.key});

  final String text;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: textTheme.headlineMedium),
          if (subtitle != null && subtitle!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: const TextStyle(letterSpacing: -.25),
            )
          ]
        ],
      ),
    );
  }
}
