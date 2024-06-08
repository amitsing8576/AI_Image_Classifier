import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'output.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? image;

  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      final imageTemp = File(pickedImage.path);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      ('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 100,
            ),
            color: Theme.of(context).primaryColor,
            child: const Text(
              "Select Image",
              style: TextStyle(
                color: Color.fromARGB(250, 247, 246, 246),
                fontSize: 20,
              ),
            ),
          ),
          onPressed: () async {
            await pickImage();
            if (image != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Output(imagePath: image!.path),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
