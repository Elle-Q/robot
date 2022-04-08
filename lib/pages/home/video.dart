import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';
import '../../constants/constants.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  late String _streamUrl =
      'https://media.w3.org/2010/05/sintel/trailer.mp4';
  late VideoPlayerController _viewController;

  bool _isPlaying = true;


  @override
  void initState() {
    super.initState();

    _viewController = VideoPlayerController.network(_streamUrl,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((value) =>
      {
        setState(() {
          _viewController.play();
        })
      });

    _viewController.setLooping(true);
  }

  @override
  void dispose() async {
    super.dispose();
    await _viewController.dispose();
  }

  void _togglePlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _viewController.play();
      } else {
        _viewController.pause();
      }
    });
  }

  void _toggleSwapView() {

  }

  void _flicker() {}

  IconButton makeButton(onpress, icon) {
    return IconButton(
      iconSize: 30,
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerRight,
      icon: icon,
      color: kPrimaryColor,
      onPressed: onpress,
    );
  }

  // video controller bar
  Container buildVideoControl() {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.all(0),
      color: Colors.black,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        makeButton(
            _togglePlaying,
            _isPlaying
                ? const Icon(Icons.stop_circle_rounded)
                : const Icon(Icons.play_circle_fill_rounded)),
        makeButton(_flicker, const Icon(Icons.photo_camera)),
        makeButton(_toggleSwapView, const Icon(Icons.swap_horizontal_circle))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_viewController.value.isInitialized ) {
      return Container();
    }
    return Column(
      children: [
        Stack(children: [
          AspectRatio(
            aspectRatio: _viewController.value.aspectRatio,
            child: VideoPlayer(_viewController),
          ),
        ]),
        buildVideoControl(),
      ],
    );
  }
}
