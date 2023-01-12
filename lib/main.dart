import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'widgets/pages/homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music App Player',
      theme: customLightTheme(),
      darkTheme: customDarkTheme(),
      home: const MyHomePage(title: 'Flutter Music App Player'),
    );
  }
}

