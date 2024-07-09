import 'package:flutter/material.dart';
import 'package:quouch_app/mocks/images.dart';
import 'package:quouch_app/widgets/large_titled_image_list_view.dart';
import 'package:quouch_app/widgets/large_titled_image_widget.dart';

class ExperienceTheWorldComponent extends StatelessWidget {
  const ExperienceTheWorldComponent({super.key});
  @override
  Widget build(BuildContext context) {
    const widgets = [
      LargeTitledImageWidget(
        text: 'Online Experiences',
        subtitle: 'AirbnbClone the world without leaving home.',
        imageUrl: elderlyCoupleTabletImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Experiences',
        subtitle: 'Things to do wherever you are.',
        imageUrl: couplePotteryImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Adventures',
        subtitle: 'Multi-day trips with meals and stays.',
        imageUrl: womanCliffImageUrl,
      ),
    ];
    return const LargeTitledImageListView(widgets: widgets);
  }
}
