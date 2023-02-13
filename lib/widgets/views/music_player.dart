import 'package:flutter/material.dart';

import 'small_music_disc.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      // a blue container above the bottom nav bar
      // which will show the current playing song
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xffbae6f3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // a small animated disc wich will show the image of the song
                   const SmallMusicDisc(),
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
                  // add to favorite icon button
                  InkWell(
                    child: const Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // TODO: icon needs to change when clicked
                    },
                  ),

                  // play and pause button
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      // TODO: icon needs to change when clicked
                    },
                  ),
                ],
              ),
            )));
  }
}
