
import 'package:flutter/material.dart';

class PlayListItem extends StatefulWidget {
  final int? index;
  final int? selectedIndex;
  const PlayListItem({
    required this.index,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayListItem> createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = (widget.index == widget.selectedIndex);

    return Align(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: AnimatedContainer(
          height: isSelected ? 300 : 250,
          width:  200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          // Define how long the animation should take.
          duration: const Duration(milliseconds: 400),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          child: Text("this item is ${widget.index} , ${widget.selectedIndex}"),
        ),
      ),
    );
  }
}