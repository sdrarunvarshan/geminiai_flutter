import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_ai/view/home_page.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyAG-lc64EjUwpynyWpO_6cjW3Gdrp_w8bE');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'gemini_ai',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SectionTextInput());
  }
}
