import 'package:flutter/material.dart';
import 'package:mplayer/screens/home_Screen.dart';
import 'package:get/get.dart';
import 'package:mplayer/screens/playlist_screen.dart';
import 'package:mplayer/screens/song_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      home:  HomeScreen(),
      getPages: [
        GetPage(name: '/', page:() => HomeScreen()),
        GetPage(name: '/song', page:() => SongScreen()),
        GetPage(name: '/playlist', page:() => PlaylistScreen()),
      ],
    );
  }
}

