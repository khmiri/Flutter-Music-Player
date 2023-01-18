import 'package:flutter/material.dart';
import 'package:music_app/widgets/views/my_app_bar.dart';
import 'package:music_app/widgets/views/mybottom_navbar.dart';

 enum BottomNavBarSelectedItem { home, search, playlists, liked }

class PlayListsPage extends StatelessWidget {
  const PlayListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: const MyAppBar(title:"Playlists"),
        bottomNavigationBar: MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.playlists.toString()),
        body: Container(),
      ),
    );
  }
}
