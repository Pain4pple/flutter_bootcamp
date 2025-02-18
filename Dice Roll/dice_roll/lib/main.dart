import 'package:dice_roll/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home:  Scaffold(body: GradientContainer(Color.fromARGB(255, 255, 234, 234),Color.fromARGB(255, 176, 120, 255))),
    ),
  );
}


