import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';

class Output extends StatefulWidget {
  final String imagePath;

  const Output({
    super.key,
    required this.imagePath,
  });

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
  List? _output;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadModel().then((_) {
      classifyImage(widget.imagePath);
    });
  }

  Future<void> loadModel() async {
    String? res = await Tflite.loadModel(
      model: "assets/models/model.tflite",
    );
    print("Model loaded: $res");
  }

  classifyImage(String imagePath) async {
    print("Classifying image: $imagePath");
    var output = await Tflite.runModelOnImage(
      path: imagePath,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 2,
      threshold: 0.5,
      asynch: true,
    );
    print("Classification result: $output");
    setState(() {
      _output = output;
      loading = false;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(177, 40, 133, 232),
        title: const Text("AI Image Classifier"),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 242, 238, 238),
          fontSize: 20,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 10,
                height: 30,
              ),
              Image.file(
                File(widget.imagePath),
                width: 300,
                height: 250,
              ),
              const SizedBox(height: 20),
              loading
                  ? const CircularProgressIndicator()
                  : Text(
                      _output != null ? _output.toString() : 'No results',
                      style: const TextStyle(fontSize: 18),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
