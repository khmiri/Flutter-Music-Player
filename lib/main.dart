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

        // routes defined in a seperated file
      onGenerateRoute: MyRouter.generateRoute,

      title: 'Music App Player',
      theme: customLightTheme(),

      darkTheme: customDarkTheme(),
      
      initialRoute: homeRoute,
     
    );
  }
}

