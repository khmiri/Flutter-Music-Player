import 'package:flutter/material.dart';

import '../../utils/dummy_data.dart';

class SmallMusicDisc extends StatefulWidget {
  const SmallMusicDisc({
    required this.size,
    Key? key,
  }) : super(key: key);

  final double? size;

  @override
  State<SmallMusicDisc> createState() => _SmallMusicDiscState();
}

class _SmallMusicDiscState extends State<SmallMusicDisc>
    with SingleTickerProviderStateMixin {
  // animation controller to animate
  //the playing song's disc above the bottom nav bar
  late AnimationController animationController;

  @override
  initState() {
    //
    // intitialising the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    //
    // disposing animation controlelr
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    // RotationTransition is the widget that will rotate our container
    //
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
      // our circular container
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.white),
          //adding shadow with two colors black38 and pink300
          boxShadow: [
            const BoxShadow(
                color: Colors.black38,
                blurRadius: 20,
                spreadRadius: 5,
                offset: Offset(5, 4)),
            BoxShadow(
                color: Colors.pink.shade50,
                blurRadius: 20,
                spreadRadius: 3,
                offset: const Offset(1, 2))
          ],
        ),

        //
        //stack widget to draw above the circular shape
        // so we can have a disc hole in the center
        //
        
        child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(widget.size!),
                //Clipping the image
                // TODO: image path needs to be passed through the constructor
                child: Image.asset(
                  songs[0]["imgPath"],
                  height: widget.size,
                  width: widget.size,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: widget.size! / 4,
                width: widget.size! / 4,
                decoration: BoxDecoration(
                    color: const Color(0xffbae6f3),
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.white)),
              ),
            ]),
      ),
    );
  }
}
