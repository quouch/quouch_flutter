import 'package:flutter/material.dart';
import 'package:quouch_app/mocks/cities.dart';
import 'package:quouch_app/theme/spacing.dart';

class ExploreCityGrid extends StatelessWidget {
  const ExploreCityGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;
    return SizedBox(
      height: 200,
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          childAspectRatio: .33,
          padding: EdgeInsets.symmetric(horizontal: spacing.lg),
          scrollDirection: Axis.horizontal,
          children: cityWidgets),
    );
  }
}
