import 'package:flutter/material.dart';
import 'package:music_app/widgets/views/my_app_bar.dart';
import 'package:music_app/widgets/views/mybottom_navbar.dart';
import '../../utils/dummy_data.dart' as dummy;

enum BottomNavBarSelectedItem { home, search, playlists, liked }

class PlayListsPage extends StatelessWidget {
  const PlayListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: const MyAppBar(title: "Playlists"),
        bottomNavigationBar: MyBottomNavBar(
            selectedItem: BottomNavBarSelectedItem.playlists.toString()),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                  ),
                  itemCount: dummy.imageAssets.length,
                  itemBuilder: ((context, index) {
                    return gridItemBuilder(index);
                  })),
            ),
          ]),
        ),
      ),
    );
  }


// TO DO: Create a Widget class 
  Widget gridItemBuilder(int index) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SizedBox(
        height: 40,
        width: 10,
         child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset(dummy.imageAssets[index])),

      ),
    );
  }
}
