import 'package:flutter/material.dart';
import 'package:music_app/widgets/pages/homepage.dart';
import 'package:music_app/widgets/pages/likedsongs.dart';
import 'package:music_app/widgets/pages/playlistpage.dart';
import 'package:music_app/widgets/pages/singleplaylist.dart';
import '../utils/constants.dart';

class MyRouter {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) =>const MyHomePage());
      case singleplaylistRoute:
        return MaterialPageRoute(builder: (_) =>const SinglePlaylist());
        case playlistsRoute:
        return MaterialPageRoute(builder: (_) =>const PlayListsPage());
        case likedSongsRoute:
        return MaterialPageRoute(builder: (_) =>const LikedSongs());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}