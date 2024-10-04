import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:quouch_app/models/models.dart';
import 'package:quouch_app/pages/place/place.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:quouch_app/widgets/widgets.dart';

class PlaceListPage extends StatelessWidget {
  const PlaceListPage({required this.placeList, super.key});

  final PlaceList placeList;

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;
    buildCardTiles() {
      List<Widget> widgets = placeList.savedPlaces
          .map(
            (p) => PlaceCardWidget(
              place: p,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Theme(
                      data: Theme.of(context),
                      child: PlacePage(
                        place: p,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
          .toList();
      return intersperse(const SizedBox(height: 32), widgets).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const AppBarBackButton(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        ),
        children: [
          ScreenHeaderText(
            titleText: placeList.title,
          ),
          const SectionDivider(),
          Text(
            placeList.numStaysText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          DividerBlock.vertical('md'),
          ...buildCardTiles(),
          DividerBlock()
        ],
      ),
    );
  }
}
