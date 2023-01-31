import 'package:flutter/material.dart';
import '../views/my_app_bar.dart';
import '../views/mybottom_navbar.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: const MyAppBar(title: "SearchPage",),
        bottomNavigationBar: MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.search.toString()),
        body: Container(),
      ),
    );
  }
}