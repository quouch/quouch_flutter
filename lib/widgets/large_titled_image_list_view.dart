import 'package:flutter/material.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:quouch_app/widgets/large_titled_image_widget.dart';

class LargeTitledImageListView extends StatelessWidget {
  const LargeTitledImageListView({required this.widgets, super.key});
  final List<LargeTitledImageWidget> widgets;

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return LimitedBox(
      maxHeight: 360,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widgets.length,
        padding: EdgeInsets.symmetric(horizontal: spacing.lg),
        itemBuilder: (_, index) => widgets[index],
        separatorBuilder: (_, index) => const SizedBox(width: 12),
      ),
    );
  }
}
