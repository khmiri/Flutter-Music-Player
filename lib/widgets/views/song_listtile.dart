import 'package:flutter/material.dart';

class SongListTile extends StatelessWidget {
  // Represents all song needed infos [image path, title, subtitle]
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
        //Song title 
        title: Text(songData!["title"].toString()),
        //Song subtitle 
        subtitle: Text(songData!["subTitle"].toString()),
      ),
    );
  }
}