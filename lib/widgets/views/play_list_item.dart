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
          //Album cover image path, if null we use default pic
          child: Image.asset(
            widget.imagePath ?? "assets/images/ph.png",
            height: isSelected ? 300 : 250,
            width: 200,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
