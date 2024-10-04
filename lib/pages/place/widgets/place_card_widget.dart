import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:quouch_app/models/place.dart';
import 'package:quouch_app/pages/place/place.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({required this.place, this.onTap, super.key});
  final Place place;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    const TextStyle defaultTextTheme =
        TextStyle(fontSize: 16, wordSpacing: 1, color: Colors.black);

    return InkWell(
      onTap: onTap as void Function()?,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: intersperse(
            const SizedBox(
              height: 6,
            ),
            [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 225,
                  child: Stack(
                    children: [
                      PageViewWithIndicators(
                        children: place.imageUrls
                            .map(
                              (e) => Hero(
                                tag: e,
                                child: Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'SUPERHOST',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: .75,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: StackedFavoriteButton(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RatingRow(
                rating: place.rating,
                numberOfRatings: place.numberOfRatings,
              ),
              DefaultTextStyle(
                style: defaultTextTheme,
                child: Row(
                  children: [
                    Text('Entire ${place.typeText}'),
                    const SizedBox(
                      width: 12,
                      child: Center(
                        child: Text('·'),
                      ),
                    ),
                    Text(place.numBedsText),
                  ],
                ),
              ),
              Text(place.title, style: defaultTextTheme),
              Row(children: [
                Text(
                  '\$${place.costPerNight.toStringAsFixed(0)}',
                  style: defaultTextTheme.copyWith(fontWeight: FontWeight.bold),
                ),
                const Text(
                  ' / night',
                  style: defaultTextTheme,
                )
              ]),
            ]).toList(),
      ),
    );
  }
}
