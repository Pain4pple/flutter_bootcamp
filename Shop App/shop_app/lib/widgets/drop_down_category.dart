import 'package:flutter/material.dart';
import 'package:shop_app/data/grocery_items.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/grocery_item.dart';
import 'package:shop_app/widgets/grocery_item_render.dart';

class DropDownCategory extends StatefulWidget {
  DropDownCategory({
    super.key,
    required this.category,
    required this.filteredItems,
    required this.onRemoveGroceryItem,
  });

  final Category category;
  final List<GroceryItem> filteredItems;
  void Function(GroceryItem groceryItem) onRemoveGroceryItem;
  @override
  State<DropDownCategory> createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
  var isVisible = true;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    final filteredItems = widget.filteredItems;

    return Column(
      children: [
        GestureDetector(
          onTap: toggleVisibility,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 145, 159, 53),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(16, 65, 171, 95),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icon(
                //   category.icon,
                //   size: 15,
                //   color: const Color.fromARGB(250, 197, 219, 140),
                // ),
                // const SizedBox(width: 10),
                Text(
                  category.title,
                  style: TextStyle(
                    color: const Color.fromARGB(250, 197, 219, 140),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  isVisible
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: const Color.fromARGB(250, 197, 219, 140),
                ),
              ],
            ),
          ),
        ),

        Visibility(
          visible: isVisible,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              color: Color.fromARGB(255, 254, 255, 210),
            ),
            child:
                filteredItems.isEmpty
                    ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("No items in this category"),
                    )
                    : SizedBox(
                      height: filteredItems.length * 55.0,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ValueKey(filteredItems[index]),
                            onDismissed: (direction) {
                              widget.onRemoveGroceryItem(filteredItems[index]);
                            },
                            child: GroceryItemRender(
                              groceryItem: filteredItems[index],
                            ),
                          );
                        },
                      ),
                    ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
