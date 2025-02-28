import 'package:fave_places/data/categories.dart';
import 'package:fave_places/models/category.dart';
import 'package:fave_places/models/place.dart';
import 'package:fave_places/providers/place_provider.dart';
import 'package:fave_places/widgets/image_input.dart';
import 'package:fave_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void _saveNewPlace() {
    if (_formKey.currentState!.validate() && _selectedImage != null && _selectedLocation != null) {
      _formKey.currentState!.save();
      final newPlace = Place(
        name: nameController.text,
        location: _selectedLocation!,
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

  void getLocation(PlaceLocation location) {
    _selectedLocation = location;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 234, 238),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 234, 234, 238), Color.fromARGB(30, 244, 160, 104)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text('Add a new', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 17, 9, 33))),
                      Text(' Place', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          ImageInput(saveImage: takeImage),
                          SizedBox(height: 15),
                          _buildLabel('Name'),
                          _buildTextField(nameController, 'e.g. Boracay'),
                          SizedBox(height: 12),
                          _buildLabel('Description'),
                          _buildTextField(descController, 'e.g. loved the beaches in station 2'),
                          SizedBox(height: 12),
                          _buildLabel('Location'),
                          LocationInput(getLocation: getLocation),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Cancel'),
                                style: ButtonStyle(elevation: WidgetStateProperty.all(0)),
                              ),
                              SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: _saveNewPlace,
                                child: Text('Submit'),
                                style: ButtonStyle(elevation: WidgetStateProperty.all(0)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(children: [Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33)))]);
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(55, 127, 125, 136)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText, hintStyle: TextStyle(color: const Color.fromARGB(91, 0, 0, 0)), border: InputBorder.none),
        validator: (value) => value == null || value.isEmpty ? 'This field cannot be empty' : null,
      ),
    );
  }
}
