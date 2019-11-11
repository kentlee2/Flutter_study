import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  final String videoUrl;

  VideoInfo(this.videoUrl);

  @override
  State<StatefulWidget> createState() => VideoInfoStateWidget(videoUrl);
}

class VideoInfoStateWidget extends State<VideoInfo> {
  VideoPlayerController _controller;
  final String videoUrl;
  bool _isPlaying = false;
  Color pickColor = Color(0xffffffff); //默认主题色
  VideoInfoStateWidget(this.videoUrl);

  @override
  void initState() {
    super.initState();
    print("视频地址："+videoUrl);
    _controller = VideoPlayerController.network(this.videoUrl)

      // 播放状态
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      // 在初始化完成后必须更新界面
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:AppBar(
          title: Text("预告片"),
        ) ,
        body:  Center(
          child: _controller.value.initialized
              // 加载成功
              ?  AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              :  Container(child: Text("加载失败，"+videoUrl),),
        ),
        floatingActionButton:  FloatingActionButton(
          onPressed: _controller.value.isPlaying
              ? _controller.pause
              : _controller.play,
          child:  Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
    );
  }
}
