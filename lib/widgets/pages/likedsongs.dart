import 'package:flutter/material.dart';
import '../views/my_app_bar.dart';
import '../views/mybottom_navbar.dart';
import '../../utils/dummy_data.dart' as dummy;
import '../views/song_listtile.dart';
class LikedSongs extends StatelessWidget {
  const LikedSongs({super.key});

 @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(title: "Liked",),
        bottomNavigationBar: MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.liked.toString()),
       body:       Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    width: double.infinity,
                    height: 300,
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //Generating a list
                      //by mapping through a list of songs (images and titles)
                      //
                      children: dummy.songs.map((e) {
                        //Recent item ( ListTile )
                        //using Custom widget called SongListTile

                        return SongListTile(songData: e);
                      }).toList(),
                    ),
                  ),
      ),
    );
  }
}