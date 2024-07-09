import 'package:flutter/material.dart';
import 'package:quouch_app/mocks/places.dart';
import 'package:quouch_app/mocks/users.dart';
import 'package:quouch_app/models/stay.dart';

Stay aspenStay = Stay(
  place: aspen,
  people: [testProfile],
  dateTimeRange: DateTimeRange(
    start: DateTime(2020, 3, 13),
    end: DateTime(2020, 3, 15),
  ),
);
