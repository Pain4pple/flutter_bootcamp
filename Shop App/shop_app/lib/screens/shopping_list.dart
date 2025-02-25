import 'package:flutter/material.dart';
import 'package:shop_app/data/categories.dart';
import 'package:shop_app/data/grocery_items.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/grocery_item.dart';
import 'package:shop_app/widgets/add_item.dart';
import 'package:shop_app/widgets/drop_down_category.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  // final List<GroceryItem> groceryItems = dummyGroceryItems;
  final List<GroceryItem> groceryItems = [];

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(child: AddItem(onAddGroceryItem: _saveNewItem));
      },
    );
  }

  List<GroceryItem> _filterItems(Category category) {
    return groceryItems.where((groceryItem) {
      return groceryItem.category == category;
    }).toList();
  }

  void _saveNewItem(GroceryItem groceryItem) {
    setState(() {
      groceryItems.add(groceryItem);
    });
  }

  void _removeItem(GroceryItem item) {
    final itemIndex = groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Item removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              groceryItems.insert(itemIndex, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = categories.values.toList();
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: const Color.fromARGB(255, 255, 253, 249),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 186, 182, 59),
                      const Color.fromARGB(255, 166, 190, 107),
                    ], // Adjust colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Listy 📝✨',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 251, 216),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${groceryItems.length.toString()} items in list',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:
                      groceryItems.isEmpty
                          ? Container(
                            color: const Color.fromARGB(255, 255, 251, 244),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Let\'s get started!',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                      255,
                                      190,
                                      186,
                                      176,
                                    ),
                                  ),
                                ),
                                Text(
                                  '\ntry adding items to your list! (≧ᗜ≦)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                      255,
                                      190,
                                      186,
                                      176,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Container(
                            color: const Color.fromARGB(255, 255, 251, 244),
                            child: ListView.builder(
                              itemCount: categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                final categoryEntry = categoryList[index];
                                final itemsUnderCategory = _filterItems(
                                  categoryEntry,
                                );
                                if (itemsUnderCategory.isNotEmpty) {
                                  return DropDownCategory(
                                    category: categoryEntry,
                                    filteredItems: itemsUnderCategory,
                                    onRemoveGroceryItem: _removeItem,
                                  );
                                }
                                return SizedBox.shrink();
                              },
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: RawMaterialButton(
        onPressed: _addItem,
        shape: CircleBorder(),
        fillColor: Color.fromARGB(255, 166, 190, 107),
        elevation: 0,
        padding: EdgeInsets.all(10),
        child: Text('✏️', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: null,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 186, 182, 59),
              const Color.fromARGB(255, 166, 190, 107),
            ], // Adjust colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(20.0);
}
