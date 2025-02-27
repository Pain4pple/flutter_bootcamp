import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.saveImage});

  final void Function(File selectedFile) saveImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
      widget.saveImage(_selectedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Icon(Icons.camera_alt_rounded);
    if (_selectedImage != null) {
      content = ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.file(_selectedImage!, fit: BoxFit.cover));
    }
    return InkWell(
      onTap: _takePicture,
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(55, 127, 125, 136)),
        child: content,
      ),
    );
  }
}
