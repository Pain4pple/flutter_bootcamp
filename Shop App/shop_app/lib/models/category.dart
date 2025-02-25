import 'package:flutter/material.dart';

enum Categories {
  fruits,
  meat,
  vegetable,
  dairy,
  carbs,
  fish,
  beverages,
  snacks,
  grains,
  condiments,
  frozen,
}

class Category {
  const Category({
    required this.title,
    required this.color,
    required this.icon,
    required this.description,
    this.image,
  });

  final String title;
  final Color color;
  final IconData icon;
  final String description;
  final String? image;
}
