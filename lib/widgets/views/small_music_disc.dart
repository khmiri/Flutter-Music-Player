import 'package:flutter/material.dart';

import '../../utils/dummy_data.dart';

class SmallMusicDisc extends StatefulWidget {
  const SmallMusicDisc({
    Key? key,
  }) : super(key: key);

  @override
  State<SmallMusicDisc> createState() => _SmallMusicDiscState();
}

class _SmallMusicDiscState extends State<SmallMusicDisc>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: Colors.white),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: Offset(5, 4))
            ]),
        child: Stack(alignment: Alignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              songs[0]["imgPath"],
              height: 60,
              width: 60,
            ),
          ),
          Container(
            height: 15,
            width: 15,
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
