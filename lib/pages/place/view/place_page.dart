import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:quouch_app/mocks/places.dart';
import 'package:quouch_app/models/models.dart';
import 'package:quouch_app/pages/place/place.dart';
import 'package:quouch_app/theme/spacing.dart';
import 'package:quouch_app/widgets/widgets.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({required this.place, super.key});

  final Place place;

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  Place get place => widget.place;

  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = true;
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(
            left: spacing.lg,
            right: spacing.lg,
            top: spacing.md,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        '\$${place.costPerNight.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text(
                        ' / night',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  RatingRow(
                      rating: place.rating,
                      numberOfRatings: place.numberOfRatings),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(164, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Check availability',
                ),
              )
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            leading: CircularIconButton(
              iconData: Icons.close,
              onPressed: () {
                Navigator.pop(context);
              },
              iconColor: Colors.grey[800],
            ),
            actions: [
              CircularIconButton(
                iconData: Icons.ios_share,
                iconSize: 20,
                onPressed: () {},
                iconColor: Colors.grey[800],
              ),
              CircularIconButton(
                iconData: isFavorited ? Icons.favorite : Icons.favorite_border,
                iconSize: 20,
                onPressed: () {
                  setState(() {
                    isFavorited = !isFavorited;
                  });
                },
                iconColor:
                    isFavorited ? Theme.of(context).primaryColor : Colors.black,
              ),
              const SizedBox(
                width: 12,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: PageViewWithIndicators(
                type: IndicatorType.numbered,
                children: place.imageUrls
                    .map((e) => Hero(
                          tag: e,
                          child: Image.network(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
              ),
            ),
            expandedHeight: 280,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spacing.lg, vertical: spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: intersperse(
                          const SizedBox(width: 6),
                          [
                            RatingRow(
                              rating: place.rating,
                              numberOfRatings: place.numberOfRatings,
                            ),
                            const Text('·'),
                            if (place.owner.isSuperhost) ...[
                              Icon(
                                Icons.verified,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                              const Text('Superhost'),
                            ]
                          ],
                        ).toList(),
                      ),
                      const SizedBox(height: 8),
                      Text('${place.city}, ${place.state}, ${place.country}'),
                      const SectionDivider(),
                      Row(
                        children: [
                          Text(
                            'Entire ${place.typeText}\nhosted by ${place.owner.name}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                              place.owner.profileImageUrl,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          ...intersperse(
                            const SizedBox(
                              width: 12,
                              child: Center(
                                child: Text('·'),
                              ),
                            ),
                            [
                              Text('${place.guestCount} guests'),
                              Text(place.numGuestsText),
                              Text(place.numBedsText),
                              Text(place.numBathsText),
                            ],
                          ),
                        ],
                      ),
                      const SectionDivider(),
                      ...intersperse(
                        const SizedBox(
                          height: 24,
                        ),
                        [
                          PlaceDetailListTile(
                            iconData: Icons.home_outlined,
                            title: 'Entire home',
                            subTitle:
                                "You'll have the ${place.typeText} to yourself.",
                          ),
                          const PlaceDetailListTile(
                            iconData: Icons.flare_outlined,
                            title: 'Enhanced Clean',
                            subTitle:
                                "This host is committed to Flutter UI's 5-step enhanced cleaning process.",
                          ),
                          const PlaceDetailListTile(
                            iconData: Icons.sensor_door_outlined,
                            title: 'Self check-in',
                            subTitle: 'Check yourself in with the keypad',
                          ),
                          const PlaceDetailListTile(
                            iconData: Icons.calendar_today_outlined,
                            title: 'Free cancellation for 48 hours',
                            subTitle:
                                'After that, cancel up to 7 days before check-in and get a 50% refund, minus the service fee.',
                          ),
                          const PlaceDetailListTile(
                            iconData: Icons.gavel_outlined,
                            title: 'House rules',
                            subTitle: "This host doesn't allow smoking.",
                          ),
                        ],
                      ),
                      const SectionDivider(),
                      Text(
                        place.description ?? loremIpsumText,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: const [
                            Text(
                              'Show more',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: const Text(
                            'Contact host',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 64),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
