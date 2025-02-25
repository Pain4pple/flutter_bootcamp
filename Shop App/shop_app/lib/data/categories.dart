import 'package:flutter/material.dart';
import 'package:shop_app/models/category.dart';

const categories  = {
  Categories.fruits: Category(
    title: "🍉 Fruits",
    color: Colors.red,
    icon: Icons.apple,
    description: "Fresh and organic fruits like apples, bananas, and berries.",
    image: "assets/images/fruits.png",
  ),
  Categories.meat: Category(
    title: "🥩 Meat",
    color: Colors.brown,
    icon: Icons.lunch_dining,
    description: "Various kinds of meat including beef, pork, and chicken.",
    image: "assets/images/meat.png",
  ),
  Categories.vegetable: Category(
    title: "🥬 Vegetables",
    color: Colors.green,
    icon: Icons.grass,
    description: "Healthy vegetables such as carrots, spinach, and potatoes.",
    image: "assets/images/vegetables.png",
  ),
  Categories.dairy: Category(
    title: "🧀 Dairy",
    color: Colors.blue,
    icon: Icons.icecream,
    description: "Milk, cheese, yogurt, and other dairy products.",
    image: "assets/images/dairy.png",
  ),
  Categories.carbs: Category(
    title: "🥐 Carbs",
    color: Colors.orange,
    icon: Icons.bakery_dining,
    description: "Bread, pasta, rice, and other carbohydrate-rich foods.",
    image: "assets/images/carbs.png",
  ),
  // Categories.fish: Category(
  //   title: "Fish",
  //   color: Colors.cyan,
  //   icon: Icons.set_meal,
  //   description: "Fresh and frozen fish such as salmon and tuna.",
  //   image: "assets/images/fish.png",
  // ),
  // Categories.beverages: Category(
  //   title: "Beverages",
  //   color: Colors.purple,
  //   icon: Icons.local_cafe,
  //   description: "Juices, soft drinks, tea, and coffee.",
  //   image: "assets/images/beverages.png",
  // ),
  // Categories.snacks: Category(
  //   title: "Snacks",
  //   color: Colors.yellow,
  //   icon: Icons.fastfood,
  //   description: "Chips, cookies, and other quick bites.",
  //   image: "assets/images/snacks.png",
  // ),
  // Categories.grains: Category(
  //   title: "Grains",
  //   color: Colors.brown,
  //   icon: Icons.rice_bowl,
  //   description: "Oats, quinoa, barley, and other grains.",
  //   image: "assets/images/grains.png",
  // ),
  // Categories.condiments: Category(
  //   title: "Condiments",
  //   color: Colors.deepOrange,
  //   icon: Icons.soup_kitchen,
  //   description: "Sauces, spices, and seasonings.",
  //   image: "assets/images/condiments.png",
  // ),
  // Categories.frozen: Category(
  //   title: "Frozen Food",
  //   color: Colors.indigo,
  //   icon: Icons.ac_unit,
  //   description: "Frozen vegetables, meat, and ready-to-eat meals.",
  //   image: "assets/images/frozen.png",
  // ),
};