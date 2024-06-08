import 'package:flutter/material.dart';
import 'upload.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                height: 50,
              ),
              const Icon(
                Icons.image,
                size: 152,
                color: Color.fromARGB(237, 251, 244, 244),
              ),
              const SizedBox(
                width: 10,
                height: 50,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(117, 35, 132, 236),
                  border: Border.all(
                      color: const Color.fromARGB(117, 40, 133, 232), width: 5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Upload(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
