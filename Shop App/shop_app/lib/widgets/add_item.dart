import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/data/categories.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/grocery_item.dart';
import 'package:http/http.dart' as http;

class AddItem extends StatefulWidget {
  AddItem({super.key, required this.onAddGroceryItem});

  void Function(GroceryItem groceryItem) onAddGroceryItem;
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQty = 0;
  var _selectedCategory = categories[Categories.fruits];

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https('shop-app-e0fdb-default-rtdb.firebaseio.com', 'shopping-list.json');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name': _enteredName, 'quantity': _enteredQty, 'category': _selectedCategory?.title}),
      );

      final resData = json.decode(response.body);
      if (!context.mounted) {
        return;
      }
      widget.onAddGroceryItem(GroceryItem(name: _enteredName, quantity: _enteredQty, category: _selectedCategory!, id: resData['name']));
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Adding new item')));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 254, 255, 210), borderRadius: BorderRadius.circular(20)),
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: 325,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: Theme.of(context).copyWith().colorScheme.primary,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(color: const Color.fromARGB(83, 255, 214, 64), borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'e.g. lettuce, tortilla, apple...',
                            hintStyle: TextStyle(fontSize: 10),
                            labelText: 'Name',
                            labelStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                          ),
                          onSaved: (String? value) {
                            _enteredName = value!;
                          },
                          validator: (String? value) {
                            return (value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50)
                                ? 'A valid item name is required'
                                : null;
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(color: const Color.fromARGB(83, 255, 214, 64), borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                initialValue: '1',
                                style: TextStyle(fontSize: 14, color: Colors.black),
                                decoration: const InputDecoration(labelText: 'Qty', labelStyle: TextStyle(fontSize: 15), border: InputBorder.none),
                                keyboardType: TextInputType.numberWithOptions(),
                                onSaved: (String? value) {
                                  _enteredQty = int.tryParse(value!)!;
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a number';
                                  }
                                  if (double.tryParse(value) == null || double.tryParse(value)! <= 0) {
                                    return 'Invalid number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(color: const Color.fromARGB(83, 255, 214, 64), borderRadius: BorderRadius.circular(20)),
                              child: DropdownButtonFormField(
                                value: _selectedCategory,
                                style: TextStyle(fontSize: 14, color: Colors.black),
                                decoration: const InputDecoration(labelText: 'Category', border: InputBorder.none),
                                items:
                                    categories.values.map((Category category) {
                                      return DropdownMenuItem<Category>(value: category, child: Text(category.title));
                                    }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCategory = value!;
                                  });
                                },
                                validator: (value) => value == null ? 'Please select a category' : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.reset();
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(const Color.fromARGB(36, 134, 227, 131)),
                              elevation: MaterialStateProperty.all(0.0),
                            ),
                            child: Text('Reset', style: TextStyle(color: const Color.fromARGB(255, 84, 128, 96))),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _saveItem,
                            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Theme.of(context).copyWith().colorScheme.primary)),
                            child: Text('Save', style: TextStyle(color: const Color.fromARGB(255, 255, 254, 234))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
