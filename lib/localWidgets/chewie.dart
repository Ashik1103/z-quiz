

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class ChewieList extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieList({@required this.videoPlayerController,this.looping,Key key}):super (key:key); 
  @override
  _ChewieListState createState() => _ChewieListState();
}

class _ChewieListState extends State<ChewieList> {
  ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    _chewieController=ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: widget.looping,
    );
  }
  @override
 
 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(controller: _chewieController),
    );
      
    
  }
   @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
