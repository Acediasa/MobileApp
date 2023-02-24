import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(
                name: widget.name,
              )
            ));
          }, // Image tapped
          child: Image.asset(
            'assets/picture/${widget.name}.png',
            fit: BoxFit.cover, // Fixes border issues
            width: 300.0,
            height: 300.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,color: Colors.white,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\t${widget.name}.mp4"),
                  const Text("\tUsername\t\t\t\t6 Hours ago")
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}


class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _controller = VideoPlayerController.asset('assets/video/${widget.name}.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.name} player"),
        ),
        body: FutureBuilder<void>(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return VideoPlayer(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ));
  }
}
