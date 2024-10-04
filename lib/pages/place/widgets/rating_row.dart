import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow(
      {super.key, required this.rating, required this.numberOfRatings});

  final double? rating;
  final int? numberOfRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.star,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 4),
        Text(
          rating.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 4),
        Text(
          '(${numberOfRatings.toString()})',
          style: const TextStyle(fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
