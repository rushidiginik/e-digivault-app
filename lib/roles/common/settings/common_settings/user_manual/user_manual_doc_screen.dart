import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/user_manual/controller/user_manul_doc_controller.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class UserManualDocScreen extends StatefulWidget {
  final bool isFromDoc;

  const UserManualDocScreen({super.key, required this.isFromDoc});

  static create(bool isFromDoc) {
    return UserManualDocScreen(isFromDoc: isFromDoc);
  }

  @override
  State<UserManualDocScreen> createState() => _UserManualDocScreenState();
}

class _UserManualDocScreenState extends State<UserManualDocScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final UserManualController userManualController = Get.put(
    UserManualController(),
  );

  VideoPlayerController? _controller; //  make it nullable
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    userManualController.getUserManual();

    // Fetch video URL first, then initialize video controller
    userManualController.getUserVideo().then((_) {
      final videoUrl = userManualController.userVideo;

      if (videoUrl != null && videoUrl.isNotEmpty) {
        _initializeVideo(videoUrl);
      } else {
        _initializeVideo(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        );
      }
    });
  }

  void _initializeVideo(String url) {
    _controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        setState(() {}); // ✅ Refresh UI when ready
      })
      ..setLooping(true);
  }

  void _togglePlayPause() {
    if (_controller == null || !_controller!.value.isInitialized) return;

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

  @override
  void dispose() {
    if (!widget.isFromDoc && _controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(
        title: "User_Manual",
        //actionWidget: [HeaderAction(), SizedBox(width: 8)],
      ),
      body: Obx(
        () => userManualController.isLoading.value
            ? const CircularLoader()
            : SafeArea(
                child: widget.isFromDoc
                    ? _userManualDocSection()
                    : _userVideoSection(),
              ),
      ),
    );
  }

  Widget _userManualDocSection() {
    return Column(
      children: [
        Expanded(
          child: PDF().cachedFromUrl(
            userManualController.documentText,
            placeholder: (progress) => Center(child: Text("$progress%")),
            errorWidget: (error) =>
                Center(child: Text("Error loading PDF\n$error")),
          ),
        ),
      ],
    );
  }

  Widget _userVideoSection() {
    if (_controller == null) {
      //  Not initialized yet
      return const Center(child: CircularLoader());
    }

    return Center(
      child: _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller!),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: VideoProgressIndicator(
                      _controller!,
                      allowScrubbing: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause_circle : Icons.play_circle,
                      color: AppStyles.whiteColor,
                      size: 60,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                ],
              ),
            )
          : const CircularLoader(),
    );
  }

  // === Your HTML content ===
  final String _manualHtml = r'''
<main class="wrap">
  <h3>1. Introduction</h3>
  <div class="card">
    <p><strong>Welcome to Digivawlt</strong></p>
    <p>Digivawlt is a secure platform that allows property owners to complete eKhata services for large properties without the hassle of visiting government offices. Using the legally authorized Power of Attorney (POA) process, we act on your behalf to complete all required formalities, documentation, and approvals.</p>
  </div>
  <h3>2. Key Features</h3>
  <ul>
    <li><strong>Secure Document Upload</strong> – Upload all necessary property documents directly in the app.</li>
    <li><strong>POA Authorization</strong> – Sign and submit a digital Power of Attorney so we can act on your behalf.</li>
    <li><strong>Real-Time Status Tracking</strong> – Monitor progress of your eKhata service request.</li>
    <li><strong>Notifications &amp; Alerts</strong> – Get instant updates when there’s movement in your application.</li>
    <li><strong>History &amp; Records</strong> – Access previous service requests and completed documents anytime.</li>
  </ul>
  <h3>3. Getting Started</h3>
  <ul>
    <li>Download Digivawlt from the official app store or use the web version.</li>
    <li>Click <em>Create Account</em>.</li>
    <li>Enter full details and verify via OTP.</li>
  </ul>
  <h3>4. Submitting an eKhata Service Request</h3>
  <ul>
    <li>Tap <em>New Service Request</em>.</li>
    <li>Select Property Type and Service Type.</li>
    <li>Upload Required Documents.</li>
    <li>Authorize POA and complete payment.</li>
  </ul>
  <h3>5. Support</h3>
  <ul>
    <li><strong>In-App Chat</strong> – 9:00 AM to 7:00 PM (Mon–Sat)</li>
    <li><strong>Email</strong> – support@digivawlt.com</li>
    <li><strong>Phone</strong> – +91-XXXXXXXXXX</li>
  </ul>
</main>
''';
}
