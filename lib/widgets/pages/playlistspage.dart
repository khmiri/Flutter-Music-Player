import 'package:flutter/material.dart';
import 'package:music_app/widgets/views/my_app_bar.dart';
import 'package:music_app/widgets/views/mybottom_navbar.dart';
import '../../utils/dummy_data.dart' as dummy; // for dummy data
import '../views/playlists_grid_item.dart';

enum BottomNavBarSelectedItem { home, search, playlists, liked }

class PlayListsPage extends StatefulWidget {
  const PlayListsPage({super.key});

  @override
  State<PlayListsPage> createState() => _PlayListsPageState();
}

class _PlayListsPageState extends State<PlayListsPage>
     {

// we will use this Tween to add animation for every item inside the grid
// using [TweenAnimationBuilder]
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
        //Custom bottom Navigation bar
        //passing selected Item using [BottomNavBarSelectedItem] enum defined in the top of this page
        //to the constructor, in order to highlight the current page icon in the bottomNavBAR
        bottomNavigationBar: MyBottomNavBar(
            selectedItem: BottomNavBarSelectedItem.playlists.toString()),

        //
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                //
                // using Grid View to diplay all saved Playlists in thwo columns
                //
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    // The number of logical pixels between each child along the main axis.
                    mainAxisSpacing: 8,
                    //The number of logical pixels between each child along the cross axis.
                    crossAxisSpacing: 8,
                    //The number of children in the cross axis.
                    // AKA 2 columns
                    crossAxisCount: 2,
                    //The ratio of the cross-axis to the main-axis extent of each child.
                    childAspectRatio: 1,
                  ),
                  itemCount: dummy.imageAssets.length,
                  itemBuilder: ((context, index) {
                    return TweenAnimationBuilder(
                      tween: _offsetAnimation,
                      //curve: Curves.linear,
                      // the bigger the index gets the slower it shows up
                      // depending on the index we're making longer duration for animation
                      // the index [0] has always 100 ms, index [1] will have 100*(1+1)=200 ms ...
                      //
                      duration:  Duration(milliseconds:index==0? 100:100*(index+1)),
                      // passing  Translate animation to this builder 
                      // this will shift the child by the value of [_offsetAnimation] 
                      // and all that will be animated
                      builder: (context, value, child) =>  Transform.translate(offset: value,child: child,),
                      // the child that will be animated 
                      // - a costum widget [PlaylistsGridItem]
                       
                      child: PlaylistsGridItem(index: index),
                    );

                  })),
            ),
          ]),
        ),
      ),
    );
  }
}
