import 'package:shop_app/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class GroceryItem {
  GroceryItem({required this.name, required this.quantity, required this.category, required this.id});

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
