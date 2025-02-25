import 'package:flutter/material.dart';
import 'package:shop_app/models/grocery_item.dart';

class GroceryItemRender extends StatefulWidget {
  const GroceryItemRender({super.key, required this.groceryItem});

  final GroceryItem groceryItem;

  @override
  State<GroceryItemRender> createState() => _GroceryItemRenderState();
}

class _GroceryItemRenderState extends State<GroceryItemRender> {
   bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                ),
              ),
              Text(widget.groceryItem.name,style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null,),),
              const Spacer(),
              Text(widget.groceryItem.quantity.toString(),style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null,),),
            ],
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }
}
