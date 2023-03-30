import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButton extends StatelessWidget {
  const PlayerButton({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
             stream: audioPlayer.sequenceStateStream,
            builder: (context,index){
               return IconButton(
                 iconSize: 45,
                   onPressed: audioPlayer.hasPrevious ? audioPlayer.seekToPrevious :null ,
                   icon: Icon(Icons.skip_previous,
                   color: Colors.white,
                   )
               );
            }

        ),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context,snapshot){
              if(snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState = playerState!
                    .processingState;

                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    width: 64.0,
                    height: 64.0,
                    margin: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  );
                }
                else if (!audioPlayer.playing) {
                  return IconButton(
                      onPressed: audioPlayer.play,
                      iconSize: 75,
                      icon: Icon(Icons.play_circle, color: Colors.white)
                  );
                }
                else if (processingState != ProcessingState.completed) {
                  return IconButton(
                      onPressed: audioPlayer.pause,
                      iconSize: 75,
                      icon: Icon(Icons.pause_circle, color: Colors.white)
                  );
                }
                else {
                  return IconButton(
                      onPressed: () =>
                          audioPlayer.seek(Duration.zero,
                              index: audioPlayer.effectiveIndices!.first),
                      iconSize: 75,
                      icon: Icon(Icons.replay_circle_filled_outlined,
                          color: Colors.white)
                  );
                }
              }
              else{
                return CircularProgressIndicator();
              }
            }
        ),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context,index){
              return IconButton(
                  iconSize: 45,
                  onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext :null ,
                  icon: Icon(Icons.skip_next,
                    color: Colors.white,
                  )
              );
            }

        ),
      ],
    );
  }
}