import 'package:fave_places/models/category.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

class Place {
  Place({
    required this.name,
    required this.lat,
    required this.long,
    required this.date,
    required this.imageUrl,
    required this.category,
    required this.description,
  }) : id = uuid.v4();

  final String id;
  final String name;
  String? description;
  final String lat;
  final String long;
  final DateTime date;
  final String imageUrl;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
