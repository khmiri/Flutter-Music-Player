import 'package:flutter/material.dart';

import 'small_music_disc.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  // for the container that conatains the music player controllers
  //above the bottom nav bar
  double playerHeight = 200;
  // this boolean tells us if we're showing the music player
  // in fullsize or it's minimized
  bool fullsize = false;
  //this boolean tells us if the song is playing so we can
  //change the play icon inside the button
  bool isPlaying = false;
  //
  //favorite icon outlined when false, filled when true
  //
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //behavior: HitTestBehavior.opaque,
      behavior: HitTestBehavior.translucent,

      onTap: () {
        if (fullsize == false) changeHeight();
      },
      onVerticalDragStart: (details) {
        changeHeight();
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceOut,
          // a blue container above the bottom nav bar
          // which will show the current playing song
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: playerHeight,
          decoration: const BoxDecoration(
            color: Color(0xffbae6f3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: fullsize ? 500 : 60,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // a small animated disc wich will show the image of the song
                    SmallMusicDisc(size: fullsize ? 300 : 60),
                    //
                    SizedBox(
                      height: fullsize ? 60 : 0,
                      width: fullsize ? 300 : 30,
                    ),

                    // this column will contains the song's and the artist's name
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Songs name",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Songs name",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                      
                    ),
                    //
                    // add to favorite icon button
                    //
                    InkWell(
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: Colors.black,
                      ),
                      onTap: () {
                        // TODO: icon needs to change when clicked
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    //
                    // play and pause button
                    //
                    GestureDetector(
                         onTap: () {
                        // TODO: icon needs to change when clicked
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                   
                    ),
                  ],
                ),
              ))),
    );
  }



  // this method needs to depend on the screen size 
  // using ´MediaQuery´ 
  // the height here is fixed and final, which causes unresponsive experience 

  void changeHeight() {
    setState(() {
      // TODO: playerhigt needs to be SOLID

      if (playerHeight == 200) {
        playerHeight = 900;
        fullsize = !fullsize;
      } else {
        playerHeight = 200;
        fullsize = !fullsize;
      }
    });
  }
}
