import 'package:flutter/material.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI_Image_classifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(190, 79, 78, 78),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(177, 40, 133, 232),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


