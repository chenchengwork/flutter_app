import "package:flutter/material.dart";
import 'package:fijkplayer/fijkplayer.dart';

class FijkplayerPage extends StatefulWidget {
  var title = "测试FijkPlayer";

  @override
  _FijkplayerPageState createState() => _FijkplayerPageState();
}


class _FijkplayerPageState extends State<FijkplayerPage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(
        // flv
        // "https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv",

        // m3u8
        // "https://d2zihajmogu5jn.cloudfront.net/bipbop-advanced/bipbop_16x9_variant.m3u8",

        // 海康摄像头(rtsp)
        "rtsp://admin:1qaz2wsx@170.16.0.110:554/Streaming/Channels/101",

        // 大华摄像头(非标准rtsp)
        // "rtsp://admin:1qaz2wsx@170.16.0.102:554/cam/realmonitor?channel=1&subtype=0",

        // rtmp
        // "rtmp://yuexiudata.kitchenkankan.com:9109/live/AXPqqFvBpaE7QKW0JOrC_480_360",

        // "rtsp://170.16.0.62:5540/live/fce7f101de94475eb6b8a4ad092a7c3f_1280_720",

        autoPlay: true,
        showCover: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FijkView(player: player),
      ),
    );
  }
}