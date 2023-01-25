import 'package:flutter/material.dart';
import 'package:music_app/widgets/views/my_app_bar.dart';
import 'package:music_app/widgets/views/mybottom_navbar.dart';
import '../../utils/dummy_data.dart' as dummy;
import '../views/playlists_grid_item.dart';

enum BottomNavBarSelectedItem { home, search, playlists, liked }

class PlayListsPage extends StatefulWidget {
  const PlayListsPage({super.key});

  @override
  State<PlayListsPage> createState() => _PlayListsPageState();
}

class _PlayListsPageState extends State<PlayListsPage>
    with SingleTickerProviderStateMixin {

final Tween<Offset> _offsetAnimation = Tween<Offset>(
    begin:const Offset(0,-20),
    end:  Offset.zero,
  );


 

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        //
        appBar: const MyAppBar(title: "Playlists"),
        //
        bottomNavigationBar: MyBottomNavBar(
            selectedItem: BottomNavBarSelectedItem.playlists.toString()),

        //
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
                    return TweenAnimationBuilder(
                      tween: _offsetAnimation,
                      //curve: Curves.linear,
                      duration:  Duration(milliseconds:index==0? 100:100*(index+1)),
                      builder: (context, value, child) =>  Transform.translate(offset: value,child: child,),
                      child: PlaylistsGridItem(index: index),
                    );

                    //return PlaylistsGridItem(index: index);
                  })),
            ),
          ]),
        ),
      ),
    );
  }
}
