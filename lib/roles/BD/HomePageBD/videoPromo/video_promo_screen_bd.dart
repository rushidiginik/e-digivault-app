import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/videoPromo/controller/video_promo_controller.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late Size size;
  VideoPlayerController? _controller;
  bool isPlaying = false;
  bool isInitializing = false;

  // Use Get.find() if controller exists, otherwise Get.put()
  late final VideoPromoController videoPromoController;

  @override
  void initState() {
    super.initState();

    // Try to find existing controller, otherwise create new one
    if (Get.isRegistered<VideoPromoController>()) {
      videoPromoController = Get.find<VideoPromoController>();
      // If video URL already exists, initialize video immediately
      if (videoPromoController.videoUrl.value != null &&
          videoPromoController.videoUrl.value!.isNotEmpty) {
        _initializeVideo(videoPromoController.videoUrl.value!);
      }
    } else {
      videoPromoController = Get.put(VideoPromoController());
    }

    // Listen for video URL changes
    ever(videoPromoController.videoUrl, (String? url) {
      if (url != null && url.isNotEmpty && mounted) {
        _initializeVideo(url);
      }
    });
  }

  void _initializeVideo(String url) {
    // Prevent multiple initializations
    if (isInitializing) return;

    // Don't reinitialize if already initialized with same URL
    if (_controller != null &&
        _controller!.value.isInitialized &&
        _controller!.dataSource == url) {
      setState(() {});
      return;
    }

    isInitializing = true;

    // Dispose old controller if exists
    _controller?.dispose();

    _controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize()
          .then((_) {
            if (mounted) {
              setState(() {
                isInitializing = false;
              });
            }
          })
          .catchError((error) {
            debugPrint("❌ Video initialization error: $error");
            if (mounted) {
              setState(() {
                isInitializing = false;
              });
            }
          });
  }

  void _togglePlayPause() {
    if (_controller != null && _controller!.value.isInitialized) {
      setState(() {
        if (_controller!.value.isPlaying) {
          _controller!.pause();
          isPlaying = false;
        } else {
          _controller!.play();
          isPlaying = true;
        }
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
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
          child: Obx(() {
            // Loading state (only for API fetch, not video initialization)
            if (videoPromoController.isLoading.value &&
                videoPromoController.videoUrl.value == null) {
              return _buildLoadingContainer();
            }

            // Error state
            if (videoPromoController.errorMessage.value != null) {
              return _buildErrorContainer();
            }

            // Video available
            if (videoPromoController.videoUrl.value != null &&
                videoPromoController.videoUrl.value!.isNotEmpty) {
              return _buildVideoContainer();
            }

            // No video available
            return _buildEmptyContainer();
          }),
        ),
      ),
    );
  }

  Widget _buildVideoContainer() {
    return Container(
      width: double.infinity,
      height: size.height * 0.85,
      decoration: BoxDecoration(
        color: AppStyles.greyDE.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppStyles.greyDE, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _controller != null && _controller!.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  // Video Player
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
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
                      _controller!,
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
    );
  }

  Widget _buildLoadingContainer() {
    return const Center(child: CircularLoader());
  }

  Widget _buildErrorContainer() {
    return Container(
      width: double.infinity,
      height: size.height * 0.85,
      decoration: BoxDecoration(
        color: AppStyles.greyDE.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppStyles.greyDE, width: 1),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              videoPromoController.errorMessage.value!,
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => videoPromoController.refreshPromoVideo(),
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyContainer() {
    return Container(
      width: double.infinity,
      height: size.height * 0.85,
      decoration: BoxDecoration(
        color: AppStyles.greyDE.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppStyles.greyDE, width: 1),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.video_library_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No promo video available",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
