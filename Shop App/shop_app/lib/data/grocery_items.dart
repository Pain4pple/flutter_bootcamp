import 'package:shop_app/data/categories.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/grocery_item.dart';

final List<GroceryItem> dummyGroceryItems = [
  GroceryItem(
    name: "Carrots",
    quantity: 5,
    category: categories[Categories.vegetable]!,
  ),
  GroceryItem(
    name: "Apples",
    quantity: 3,
    category: categories[Categories.fruits]!,
  ),
  GroceryItem(
    name: "Chicken Breast",
    quantity: 2,
    category: categories[Categories.meat]!,
  ),
  GroceryItem(
    name: "Milk",
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
    GroceryItem(
    name: "Lettuce",
    quantity: 1,
    category: categories[Categories.vegetable]!,
  ),
  // GroceryItem(
  //   name: "Bread",
  //   quantity: 2,
  //   category: categories[Categories.carbs]!,
  // ),
  // GroceryItem(
  //   name: "Chocolate",
  //   quantity: 4,
  //   category: categories[Categories.snacks]!,
  // ),
  // GroceryItem(
  //   name: "Salt",
  //   quantity: 1,
  //   category: categories[Categories.condiments]!,
  // ),
  // GroceryItem(
  //   name: "Frozen Pizza",
  //   quantity: 2,
  //   category: categories[Categories.frozen]!,
  // ),
];
