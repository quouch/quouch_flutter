import 'package:flutter/material.dart';
import 'package:quouch_app/models/models.dart';

class Stay {
  final Place place;
  final List<Profile> people;
  final DateTimeRange dateTimeRange;

  String get durationText =>
      '${monthMap[dateTimeRange.start.month]} ${dateTimeRange.start.day.toString()} — ${dateTimeRange.end.day.toString()}';

  Stay(
      {required this.place, required this.dateTimeRange, required this.people});
}
