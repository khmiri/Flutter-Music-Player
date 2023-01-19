import 'package:flutter/material.dart';
import '../views/my_app_bar.dart';
import '../views/mybottom_navbar.dart';


class SinglePlaylist extends StatelessWidget {
  const SinglePlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: const MyAppBar(title: "Playlist",),
        bottomNavigationBar: MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.search.toString()),
        body: Container(),
      ),
    );
  }
}