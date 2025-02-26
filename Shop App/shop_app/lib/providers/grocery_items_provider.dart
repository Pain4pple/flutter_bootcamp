import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/grocery_item.dart';

class GroceryItemsNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryItemsNotifier() : super([]);
}

final groceryItemsProvider = StateNotifierProvider<GroceryItemsNotifier, List<GroceryItem>>((ref) {
  return GroceryItemsNotifier();
});
