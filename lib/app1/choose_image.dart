import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImage extends StatefulWidget {
  const ChooseImage({super.key});

  @override
  State<ChooseImage> createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  File? file;
  Future<void> choose_image(ImageSource source) async {
    var picker = ImagePicker();
    var pick = await picker.pickImage(source: source);
    if (pick != null) {
      setState(() {
        file = File(pick.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Image'), 
        actions: [
          IconButton(
            onPressed: () {
              choose_image(ImageSource.camera);
            },
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          file != null ? Image.file(file!) : const Text('no image'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          choose_image(ImageSource.gallery);
        },
        child: const Icon(Icons.image_search),
      ),
    );
  }
}
