import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickedImage});

  final void Function(File image) onPickedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _takenImage;
  void _takeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _takenImage = File(pickedImage.path);
    });

    widget.onPickedImage(_takenImage!);
  }

  @override
  Widget build(BuildContext context) {
    //if the picture is yet not taken, this button will be shown
    Widget content = TextButton.icon(
      onPressed: _takeImage,
      icon: Icon(Icons.camera, size: 35),
      label: Text('Take Picture'),
    );
    //if the image is taken then this image will be shown
    if (_takenImage != null) {
      content = GestureDetector(
        onDoubleTap: _takeImage,
        child: Image.file(
          _takenImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(
            context,
          ).colorScheme.primary.withAlpha((255 * 0.3).toInt()),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
