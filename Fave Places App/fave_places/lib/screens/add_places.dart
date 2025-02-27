import 'package:fave_places/data/categories.dart';
import 'package:fave_places/models/category.dart';
import 'package:fave_places/models/place.dart';
import 'package:fave_places/providers/place_provider.dart';
import 'package:fave_places/widgets/image_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  // final Category category;

  File? _selectedImage;

  void _saveNewPlace() {
    if (_formKey.currentState!.validate() && _selectedImage != null) {
      _formKey.currentState!.save();

      final newPlace = Place(
        name: nameController.text,
        lat: '',
        long: '',
        date: DateTime.now(),
        imageUrl: _selectedImage!,
        category: categories[Categories.parks]!,
        description: descController.text,
      );

      ref.read(userPlacesProvider.notifier).addPlace(newPlace);
      Navigator.of(context).pop();
    }
  }

  void takeImage(File image) {
    _selectedImage = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 238),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 234, 234, 238), Color.fromARGB(30, 232, 126, 55)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //header row
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text('Add a new', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 17, 9, 33))),
                          const Text(' Place', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ),

                  //camera field
                  ImageInput(saveImage: takeImage),
                  SizedBox(height: 15),

                  //textfield label
                  Row(
                    children: [
                      const Text('Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                    ],
                  ),
                  SizedBox(height: 12),

                  //name textfield
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(55, 127, 125, 136)),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'e.g. Boracay',
                              hintStyle: TextStyle(color: const Color.fromARGB(91, 0, 0, 0)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  //textfield label
                  SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                    ],
                  ),
                  SizedBox(height: 12),

                  //desc textfield
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(55, 127, 125, 136)),
                          child: TextFormField(
                            controller: descController,
                            decoration: InputDecoration(
                              hintText: 'e.g. loved the beaches in station 2',
                              hintStyle: TextStyle(color: const Color.fromARGB(91, 0, 0, 0)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),

                  //  //textfield label
                  //   SizedBox(height: 12),
                  //   Row(
                  //     children: [
                  //       const Text('Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                  //     ],
                  //   ),
                  //   SizedBox(height: 12),

                  //   //desc textfield
                  //   Row(
                  //     children: [
                  //       Flexible(
                  //         child: Container(
                  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //           height: 50,
                  //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(55, 127, 125, 136)),
                  //           child: DropdownButtonFormField(
                  //            items: [

                  //            ],
                  //            onChanged: (value) {
                  //              = value;
                  //            },
                  //            validator: (value) {
                  //              if(value==null){
                  //               return "Category is required";
                  //              }
                  //              return null;
                  //            },
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   SizedBox(height: 25),

                  //extra buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('cancel'),
                        style: ButtonStyle(elevation: WidgetStateProperty.all(0)),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(onPressed: _saveNewPlace, child: Text('submit'), style: ButtonStyle(elevation: WidgetStateProperty.all(0))),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
