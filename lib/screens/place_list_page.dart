import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:quouch_app/models/place.dart';
import 'package:quouch_app/screens/place_page.dart';
import 'package:quouch_app/theme/spacing.dart';
import 'package:quouch_app/widgets/app_bar_back_button.dart';
import 'package:quouch_app/widgets/divider_block.dart';
import 'package:quouch_app/widgets/place_card_widget.dart';
import 'package:quouch_app/widgets/screen_header_text.dart';

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
