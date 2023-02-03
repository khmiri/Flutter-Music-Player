import 'package:flutter/material.dart';
import '../../utils/dummy_data.dart' as dummy;

class PlaylistsGridItem extends StatelessWidget {
  const PlaylistsGridItem({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    // we will use this Tween to add animation Playlist title [Text] and [Icon]
    // using [TweenAnimationBuilder]
    final Tween<Offset> offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -20),
      end: Offset.zero,
    );

    // using [Transform] to give staggered grid effect
    // adding offset only for right column
    return Transform.translate(
      //
      // if the item's [index] is odd add vertical offset  else add nothing
      //
      offset: (index % 2 != 0) ? const Offset(0.0, 30) : Offset.zero,

      child: Stack(
        alignment: Alignment.center,
        children: [
          Card(
            shadowColor: Colors.black,
            elevation: 20,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(dummy.imageAssets[index])),
            ),
          ),
          //Using Tween Animation to animate the [Align] widget that contains 
          // our Playlist's Title [Text] and Play icon [Icon]
          TweenAnimationBuilder(
            tween: offsetAnimation,
            // the bigger the index gets the slower it shows up
            // depending on the index we're making longer duration for animation
            // the index [0] has always 300 ms, index [1] will have 100*(1+1)=200 ms ...
            //
            duration:
                Duration(milliseconds: index == 0 ? 200 : 100 * (index + 1)),
            // passing  Translate animation to this builder
            // this will shift the child by the value of [offsetAnimation]
            // and all that will be animated
            builder: (context, value, child) => Transform.translate(
              offset: value,
              child: child,
            ),
            // the child that will be animated
           //
            child: Align(
              // Aligning the child [Column] to be in the bottom left of the stack widget
                alignment: Alignment.bottomLeft,
                child: Padding(
                  // adding padding so the child does touch the edges of the stack widget [Card]
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // property lets the column take children's height
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon widget, default color is white 
                      const Icon(
                        Icons.play_lesson,
                        size: 50,
                      ),
                      // TO DO : title must be passed by the contrustor 
                      Text(
                        "Playlist name",
                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
