import 'package:flutter/material.dart';
import 'package:quouch_app/theme/spacing.dart';

class DividerBlock extends StatelessWidget {
  const DividerBlock({
    this.size = 'lg',
    this.orientation = 'vertical',
    super.key,
  });

  final String size;
  final String orientation;

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    if (orientation == 'vertical') {
      return SizedBox(
        height: spacing.findByKey(size),
      );
    } else {
      return SizedBox(
        width: spacing.findByKey(size),
      );
    }
  }

  static vertical(String size) {
    return DividerBlock(
      size: size,
      orientation: 'vertical',
    );
  }

  static horizontal(String size) {
    return DividerBlock(
      size: size,
      orientation: 'horizontal',
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 48,
      thickness: 1,
    );
  }
}
