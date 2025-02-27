import 'package:flutter/widgets.dart';

enum Categories { mountains, temples, beaches, trails, parks, forests, cafe, restaurant, malls }

class Category {
  Category({required this.title, required this.description, required this.iconSVG});

  final String title;
  final String description;
  final String iconSVG;
}
