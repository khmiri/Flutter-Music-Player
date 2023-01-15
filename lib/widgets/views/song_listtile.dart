import 'package:flutter/material.dart';

class SongListTile extends StatelessWidget {
  final Map? songData;

  const SongListTile({
    this.songData,
    Key? key,
  })  : assert(songData != null, "SongData cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: SizedBox(
          height: 100,
          //ClipRRect so Image widget can have rounded corners
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(songData!["imgPath"].toString()),
          ),
        ),
        title: Text(songData!["title"].toString()),
        subtitle: Text(songData!["subTitle"].toString()),
      ),
    );
  }
}