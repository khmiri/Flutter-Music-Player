import 'package:flutter/material.dart';

class PlayListItem extends StatefulWidget {
  //indicates the index of this widget within the list ( in PageView)
  final int? index;
  //which index is visible, if the current we would change the size of this widget
  final int? selectedIndex;
  //Playlist cover or background path
  final String? imagePath;

  //
  const PlayListItem({
    required this.index,
    required this.selectedIndex,
    this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayListItem> createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
  @override
  Widget build(BuildContext context) {
    // [True] if this widget's index equals the selected item within the list ( in PageView)
    bool isSelected = (widget.index == widget.selectedIndex);
     // we will use this Tween to add animation Playlist title [Text] and [Icon]
    // using [TweenAnimationBuilder]
    final Tween<Offset> offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -20),
      end: Offset.zero,
    );

    // Align widget so we can adjust the item's size inside the PageView.
    return Align(
      child: AnimatedContainer(
        // if Selected [True] the hight should be higher.
        height: isSelected ? 300 : 250,
        // width is fixed.
        width: 250,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius:15,
              spreadRadius: .1,
             offset: Offset(10,10),
            ),
          ],
        ),
        // Define how long the animation should take.
        duration: const Duration(milliseconds: 400),
        // Provides an optional curve to make the animation feel smoother.
        curve: Curves.easeIn,
        //Playlist background
        //
        // ClipRRect to clip Image widget and give it rounded corners
        //
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          //Album image path, if null, we'd use a placeholder
          child: Stack(
            alignment: Alignment.center,
            children: [Image.asset(
              widget.imagePath ?? "assets/images/ph.png",
              height: 300,
              //width: 200,
              fit: BoxFit.fitHeight,
            ),
            // Showing Icon and title only if item is displayed ( selected )
            isSelected?
            TweenAnimationBuilder(
            tween: offsetAnimation,
            // the bigger the index gets the slower it shows up
            // depending on the index we're making longer duration for animation
            // the index [0] has always 300 ms, index [1] will have 100*(1+1)=200 ms ...
            //
            duration:
                Duration(milliseconds: widget.index == 0 ? 200 : 100 * (widget.index !+1 )),
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
                        Icons.play_circle_filled_rounded,
                        size: 50,
                      ),
                      //TODO: title must be passed through the contrustor 
                      Text(
                        "Playlist name",
                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                      ),
                    ],
                  ),
                )),
          ):const SizedBox(),
            ]
          ),
        ),
      ),
    );
  }
}
