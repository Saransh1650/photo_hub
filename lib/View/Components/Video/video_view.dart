import 'package:assignment_app/Model/data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoView extends StatefulWidget {
  final String videoUrl, title;
  final Hit hits;

  const VideoView(
      {super.key,
      required this.videoUrl,
      required this.title,
      required this.hits});

  @override
  // ignore: library_private_types_in_public_api
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye_sharp,
                      size: 30,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      "${widget.hits.views}",
                      style:const TextStyle(fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 92, 89, 89),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.thumb_up,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${widget.hits.likes}",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 92, 89, 89),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("page URL"),
              trailing: Text(widget.hits.pageUrl),
            ),
            ListTile(
              leading: const Icon(Icons.type_specimen),
              title: const Text("Type"),
              trailing: Text("${widget.hits.type}"),
            ),
            ListTile(
              leading: const Icon(Icons.tag_sharp),
              title: const Text("Tags"),
              trailing: Text(widget.hits.tags),
            ),
            ListTile(
              leading: const Icon(Icons.timelapse_sharp),
              title: const Text("Duration"),
              trailing: Text("${widget.hits.duration}"),
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text("Downloads"),
              trailing: Text("${widget.hits.downloads}"),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text("comments"),
              trailing: Text("${widget.hits.comments}"),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
