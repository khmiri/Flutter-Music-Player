import 'package:flutter/material.dart';


import '../views/my_app_bar.dart';
import '../views/mybottom_navbar.dart';

class LikedSongs extends StatelessWidget {
  const LikedSongs({super.key});

 @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: const MyAppBar(title: "Liked",),
        bottomNavigationBar: MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.liked.toString()),
        body: Container(),
      ),
    );
  }
}