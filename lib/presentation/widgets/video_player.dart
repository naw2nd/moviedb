import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/presentation/bloc/movie_videos/movie_videos_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final int id;
  const VideoPlayer({super.key, required this.id});
  @override
  State<VideoPlayer> createState() => VideoPlayerState();
}

class VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieVideosBloc>().add(OnFetchMovieVideos(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieVideosBloc, MovieVideosState>(
        listener: (context, state) {
      if (state is MovieVideosHasData) {
        final videos = state.result;
        if (videos.isNotEmpty) {
          controller = YoutubePlayerController(
            initialVideoId: state.result.elementAt(0).key,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: true,
              loop: true,
              hideControls: true,
            ),
          );
        }
      }
    }, builder: (context, state) {
      if (state is MovieVideosLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MovieVideosHasData) {
        final videos = state.result;
        if (videos.isNotEmpty && controller != null) {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller!,
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) {
              return player;
            },
          );
        } else {
          const Text('No Trailer Available');
        }
      }
      return const Text('Failed');
    });
  }
}
