import 'package:flutter/material.dart';
import 'package:mplayer/models/playlist_model.dart';
import 'package:mplayer/models/song_model.dart';
import 'package:mplayer/widgets/playlist_card.dart';

import '../widgets/section_header.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song>songs =Song.songs;
    List<Playlist>playlists=Playlist.playlists;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
              Colors.deepPurple.shade900.withOpacity(0.8),
              Colors.deepPurple.shade300.withOpacity(0.8)
            ]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              _PlaylistMusic(playlists: playlists)
            ],
          ),
        )
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SectionHeader(title: 'Playlists'),
          ListView.builder(
            padding: EdgeInsets.only(top: 20),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: playlists.length,
              itemBuilder: ((context,index){
                return PlaylistCard(playlist: playlists[index]);
            })),
        ],
      ),
    );
  }
}



class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0),
      child: Column(
        children: [
           Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: const SectionHeader(title: 'Trending Music',),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder:(context,index){
                  return SongCard(
                      song: songs[index]);
                }
            ),
          ),
        ],
      ),
    );
  }
}





class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome',
          style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(
            height: 7,
          ),
          Text('Enjoy your playlist',
            style:Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(
                fontWeight: FontWeight.bold) ,),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
                hintStyle:Theme.of(context).textTheme.bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none
              )

            ),
          )
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor:Colors.white ,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined),
            label: 'Play'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Profile'),

      ],
    );
  }
}
class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: CircleAvatar(

          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}

