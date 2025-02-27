import 'package:fave_places/models/category.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  CustomButtons({super.key, required this.sortOnClick, required this.category});

  void Function() sortOnClick;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      onPressed: sortOnClick,
      child: Row(
        children: [
          // Image.network(''),
          Text(category.iconSVG),
          SizedBox(width: 5),
          Text(category.title),
        ],
      ),
    );
  }
}
