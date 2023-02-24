import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'utils/router.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Defines the routes for the app
      onGenerateRoute: MyRouter.generateRoute,
      // Sets the title of the app

      title: 'Music App Player',
      // Sets the light theme of the app using the customLightTheme function

      theme: customLightTheme(),
      // Sets the dark theme of the app using the customDarkTheme function

      darkTheme: customDarkTheme(),
      // Sets the initial route of the app

      initialRoute: homeRoute,
    );
  }
}
