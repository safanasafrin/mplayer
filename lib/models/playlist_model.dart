import 'song_model.dart';

class Playlist{
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl
  });

   static List<Playlist>playlists =[
     Playlist(
         title: 'Melody',
         songs: Song.songs,
         imageUrl: 'assets/images/goblin.png'
     ),
     Playlist(
         title: 'Techno',
         songs: Song.songs,
         imageUrl: 'assets/images/goblinost.png'
     ),

   ];
}
