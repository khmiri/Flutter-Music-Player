import 'package:flutter/material.dart';

import 'small_music_disc.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
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
  //to get the screen's height
  double screenHeight = 900;
  // animating pause play icon
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    //initializing animation controller
    // will be used to animate pause/play icon within play button

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    );

    //initializing animation tween type double
    // will be used to animate oause/play icon
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // disposing controller
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //getting height of this screen
    // so we can expand the music player's height depending on the screen's height when clicked
    screenHeight = MediaQuery.of(context).size.height - 100;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // the music player height will change
      // when the user tap within its bounds
      // only if the player is minimized
      onTap: () {
        if (fullsize == false) changeHeight(screenHeight);
      },
      // the music player height will change
      // when the user drag within its bounds
      onVerticalDragStart: (details) {
        changeHeight(screenHeight);
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
                height: fullsize ? 600 : 60,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // a small animated disc wich will show the image of the song
                    SmallMusicDisc(size: fullsize ? 300 : 60),
                    //this sizedbox is used to seperate widgets when the container is expanded
                    // so the next items in [Wrap] will be sent to new line
                    SizedBox(
                      height: fullsize ? 60 : 0,
                      width: fullsize ? 300 : 30,
                    ),
                    fullsize
                        ? const LinearProgressIndicator(
                            backgroundColor: Colors.black,
                            value: 30,
                            minHeight: 3,
                          )
                        : const SizedBox(),

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
                      onTap: () {
                        // [isFav] bool to change icon  when clicked
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      child: Icon(
                        // changing Favorite icon when [isFav] bool changed
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    //
                    // play and pause button
                    //
                    GestureDetector(
                      onTap: () {
                        // isPlaying bool to change pause/play icon when clicked
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                        if (isPlaying) {
                          controller.reverse();
                        } else {
                          controller.forward();
                        }
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: fullsize ? 200 : 50,
                        width: fullsize ? 200 : 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(fullsize ? 50 : 20))),
                        child: AnimatedIcon(
                          // changing play/pause icon when [isPlaying] bool changed
                          //isPlaying ? Icons.pause : Icons.play_arrow,
                          icon: AnimatedIcons.pause_play,
                          progress: animation,
                          color: Colors.black,
                          size: fullsize ? 100 : 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  // this method depend on the screen size to change the music player height
  // using ´MediaQuery´
  // fixed and final value causes unresponsive experience

  void changeHeight(mediaQueryHeight) {
    setState(() {
      // TODO: playerheight needs to be SOLID

      if (playerHeight == 200) {
        playerHeight = mediaQueryHeight;
        fullsize = !fullsize;
      } else {
        playerHeight = 200;
        fullsize = !fullsize;
      }
    });
  }
}
