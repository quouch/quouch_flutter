import 'package:flutter/material.dart';

class ScreenHeaderText extends StatelessWidget {
  const ScreenHeaderText({required this.titleText, super.key});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(titleText, style: theme.textTheme.titleLarge);
  }
}
