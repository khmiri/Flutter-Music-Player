import 'package:flutter/material.dart';
import '../views/my_app_bar.dart';
import '../views/mybottom_navbar.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(title: "Search",),
        bottomNavigationBar: MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.search.toString()),
        body: SingleChildScrollView(child:  Column(children:  [
           Center(
             child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              margin: const EdgeInsets.all(10),
              padding:const EdgeInsets.all(8),
              decoration:const BoxDecoration(color:Colors.black12,borderRadius: BorderRadius.all(Radius.circular(10))),
               child:const TextField(decoration: InputDecoration(
                        hintText: 'Song, Playlist, Artist...', border: InputBorder.none),
                        ),
             ),
           )
        ],)),
      ),
    );
  }
}