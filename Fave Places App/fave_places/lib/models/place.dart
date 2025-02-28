import 'dart:io';

import 'package:fave_places/models/category.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Categories { mountains, temples, beaches, trails, parks, forests, cafe, restaurant, malls }

class PlaceLocation {
  const PlaceLocation({required this.lat, required this.long, required this.address});

  final double lat;
  final double long;
  final String address;
}

class Place {
  Place({required this.name, required this.location, required this.date, required this.imageUrl, required this.description, String? id})
    : id = id ?? uuid.v4();

  final String id;
  final String name;
  String? description;
  final PlaceLocation location;
  final DateTime date;
  final File imageUrl;
  // final String category;

  String get formattedDate {
    return formatter.format(date);
  }
}
