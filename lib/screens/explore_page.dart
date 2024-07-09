import 'package:flutter/material.dart';
import 'package:quouch_app/widgets/custom_sliver_app_bar.dart';
import 'package:quouch_app/widgets/experience_the_world_component.dart';
import 'package:quouch_app/widgets/explore_city_grid.dart';
import 'package:quouch_app/widgets/live_anywhere_component.dart';
import 'package:quouch_app/widgets/section_title.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 32),
                  SectionTitle(text: 'Explore nearby'),
                  SizedBox(height: 24),
                  ExploreCityGrid(),
                  SizedBox(height: 48),
                  SectionTitle(
                    text: 'Live anywhere',
                  ),
                  SizedBox(height: 24),
                  LiveAnywhereComponent(),
                  SizedBox(height: 32),
                  SectionTitle(
                    text: 'Experience the world',
                    subtitle:
                        'Unique activities with local experts—in person or online',
                  ),
                  SizedBox(height: 24),
                  ExperienceTheWorldComponent(),
                  SizedBox(height: 24)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
