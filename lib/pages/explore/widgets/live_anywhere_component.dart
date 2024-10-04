import 'package:flutter/material.dart';
import 'package:quouch_app/mocks/images.dart';
import 'package:quouch_app/widgets/widgets.dart';

class LiveAnywhereComponent extends StatelessWidget {
  const LiveAnywhereComponent({super.key});

  @override
  Widget build(BuildContext context) {
    const liveAnywhereWidgets = [
      LargeTitledImageWidget(
        text: 'Entire homes',
        imageUrl: modernHouseImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Unique stays',
        imageUrl: uniqueLakeCabinImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Cabins and cottages',
        imageUrl: cabinImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Pets allowed',
        imageUrl: dogBeingLovedImageUrl,
      )
    ];
    return const LargeTitledImageListView(widgets: liveAnywhereWidgets);
  }
}
