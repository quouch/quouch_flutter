import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:quouch_app/models/place.dart';
import 'package:quouch_app/screens/place_list_page.dart';
import 'package:quouch_app/theme/spacing.dart';
import 'package:quouch_app/widgets/featured_images_card.dart';
import 'package:quouch_app/widgets/screen_header_text.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({required this.savedLists, super.key});
  final List<PlaceList> savedLists;

  List<Widget> _buildSavedListWidgets(BuildContext context) {
    List<Widget> widgets = savedLists.map((list) {
      List<String> chosenImages = [];
      Map<int, Queue<String>> placeImageMapping = {};
      for (var place in list.savedPlaces) {
        placeImageMapping[place.hashCode] = Queue.from(place.imageUrls);
      }

      bool keepGoing;
      do {
        keepGoing = false;
        for (var entry in placeImageMapping.entries) {
          if (entry.value.isNotEmpty) {
            chosenImages.add(entry.value.removeFirst());
          }
          if (entry.value.isNotEmpty) keepGoing = true;
        }
      } while (keepGoing);

      return SizedBox(
        height: 280,
        child: FeaturedImagesCard(
          imageUrls: chosenImages,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Theme(
                data: Theme.of(context),
                child: PlaceListPage(
                  placeList: list,
                ),
              ),
            ),
          ),
          titleText: list.title,
          subtitleText: list.numStaysText,
        ),
      );
    }).toList();

    return intersperse(const SizedBox(height: 24), widgets).toList();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.xl,
        ),
        children: [
          const ScreenHeaderText(titleText: 'Saved'),
          const SizedBox(height: 16),
          ..._buildSavedListWidgets(context),
        ],
      ),
    );
  }
}
