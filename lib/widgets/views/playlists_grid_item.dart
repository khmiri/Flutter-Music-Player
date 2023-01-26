
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

    // using Transform to give staggered grid effect
    // adding offset only for right column
    return Transform.translate(
      offset:(index%2!=0)?const Offset(0.0,30):Offset.zero,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
          height: 40,
          width: 10,
           child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(dummy.imageAssets[index])),
    
        ),
      ),
    );
  }
}