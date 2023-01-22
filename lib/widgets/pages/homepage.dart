import 'package:flutter/material.dart';
import '../views/my_app_bar.dart';
import '../views/mybottom_navbar.dart';
import '../views/rotated_text_btn.dart';
import '../views/play_list_item.dart';
import '../views/song_listtile.dart';
import '../../utils/dummy_data.dart' as dummy;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  
 enum BottomNavBarSelectedItem { home, search, playlists, liked }


class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController(viewportFraction: 0.8);

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final querySize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      //Custom AppBar with title and icon
      appBar: const MyAppBar(title: "Discover"),
      //
      //Custom bottom navBar
      bottomNavigationBar:  MyBottomNavBar(selectedItem: BottomNavBarSelectedItem.home.toString(),),
      //
      body: SafeArea(
        child: SingleChildScrollView(
            child: Row(
          children: [
            // first column starting from the left of the screen
            // this column contains only Text Buttons ( Playlists, recent and liked)
            //
            SizedBox(
              width: querySize.width * .2,
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 350,
                    // Top/First button 
                    child: RotatedTextBtn(
                      myLable: "Your Playlists",
                      myIcon: Icons.collections,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    // decoration: const BoxDecoration(color: Colors.deepPurple),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          RotatedTextBtn(
                            myLable: "Recent",
                          ),
                          RotatedTextBtn(
                            myLable: "Liked",
                            disabled: true,
                            //myIcon: Icons.collections,
                          ),
                        ]),
                  )
                ],
              ),
            ),
            // second column
            SizedBox(
              width: querySize.width * .8,
              child: Column(
                children: [
                  SizedBox(
                    //padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 350,
                    // decoration: const BoxDecoration(color: Colors.purple),
                    child: PageView.builder(
                      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                      /// Use [Axis.vertical] to scroll vertically.
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          selectedItem = index;
                        });
                      },
                      controller: controller,
                      padEnds: false,
                      itemBuilder: ((context, index) => PlayListItem(
                            index: index,
                            selectedIndex: selectedItem,
                            imagePath: dummy.imageAssets[index],
                          )),
                    ),
                  ),
                  Container(
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
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }


  
}


