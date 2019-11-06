import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
import '../models/ball_api.dart';
import 'dart:async';

class Screen extends StatefulWidget {
  Screen({this.title = 'Ballers'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {
  TargetPlatform _platform = TargetPlatform.iOS;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/tomisin-edc61.appspot.com/o/90'sFootball.mp4?alt=media&token=fba4537b-8f71-4a33-bb6f-0affb775df25");
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: false,
      isLive: false,
      allowedScreenSleep: false,
      //deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft],
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );

    _timer = new Timer(const Duration(seconds: 60), () {
      setState(() {
        _chewieController.enterFullScreen();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ballers = Provider.of<BallsApi>(context, listen: false).getBalls();
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: GestureDetector(
                child: Icon(Icons.keyboard_backspace, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            actions: <Widget>[
              Hero(
                  tag: "ball",
                  child:
                      Image.asset("images/${ballers[2].name}.png", width: 50.0))
            ],
          ),
          backgroundColor: CupertinoColors.darkBackgroundGray,
          body: Column(
            children: [
              // Padding(child:CircleAvatar(backgroundImage: AssetImage("images/${ballers[2].name}.png"),radius: 30.0,backgroundColor: Colors.transparent,),padding: EdgeInsets.only(left: 15.0)),
              SizedBox(height: 30.0),
              Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}
