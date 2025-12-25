import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late Size size;
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
          )
          ..initialize().then((_) {
            setState(() {}); // Refresh UI when video is loaded
          });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        isPlaying = false;
      } else {
        _controller.play();
        isPlaying = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: "Video Promo", showBack: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: size.height * 0.85, // Takes most of the screen
            decoration: BoxDecoration(
              color: AppStyles.greyDE.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppStyles.greyDE, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _controller.value.isInitialized
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        // Video Player
                        Center(
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),

                        // Play/Pause Button Overlay
                        Positioned(
                          child: GestureDetector(
                            onTap: _togglePlayPause,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: AppStyles.whiteColor,
                                size: 40,
                              ),
                            ),
                          ),
                        ),

                        // Video Progress Indicator at Bottom
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                              playedColor: AppStyles.primaryColor,
                              bufferedColor: AppStyles.greyDE,
                              backgroundColor: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(child: CircularLoader()),
            ),
          ),
        ),
      ),
    );
  }
}
