import 'package:flutter/material.dart';
class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({

  required  this.title,
  required this.description,
  required this.url,
  required  this.coverUrl,
});

  static List<Song> songs=[
    Song(
        title: 'Aga-Naga',
        description: 'Song from PS-1',
        url: 'assets/music/pssong.mp3',
        coverUrl: 'assets/images/ps.jpeg'
    ),
    Song(
        title: 'Vaa Vaathi',
        description: 'Song from Vaathi',
        url: 'assets/music/teachersong.mp3',
        coverUrl: 'assets/images/vaathi.jpeg'
    ),

  ];

}
