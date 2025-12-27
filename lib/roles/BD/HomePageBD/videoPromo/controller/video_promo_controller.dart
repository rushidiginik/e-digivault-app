import 'package:e_digivault_org_app/roles/BD/HomePageBD/videoPromo/controller/video_promo_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPromoController extends GetxController {
  final isLoading = false.obs;
  final Rx<String?> videoUrl = Rx(null);
  final Rx<String?> videoTitle = Rx(null);
  final Rx<String?> errorMessage = Rx(null);

  final VideoPromoService service = VideoPromoService();

  @override
  void onInit() {
    super.onInit();
    fetchLatestPromoVideo();
  }

  /// Fetch latest promo video
  Future<void> fetchLatestPromoVideo() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await service.getAllPromoVideos();

      if (response != null && response.success == true) {
        if (response.data != null) {
          videoUrl.value = response.data!.videoUrl;
          videoTitle.value = response.data!.title;

          debugPrint("✅ Promo video loaded: ${response.data!.title}");
          debugPrint("🎥 Video URL: ${response.data!.videoUrl}");
          debugPrint("👁️ View Count: ${response.data!.viewCount}");
        } else {
          errorMessage.value = "No promo video available";
          debugPrint("⚠️ No promo video found");
        }
      } else {
        errorMessage.value = response?.message ?? "Failed to load promo video";
        debugPrint("⚠️ Failed to fetch promo video");
      }
    } catch (e, stackTrace) {
      errorMessage.value = "An error occurred";
      debugPrint("❌ Promo video fetch error: $e");
      debugPrint("Stack trace: $stackTrace");
    } finally {
      isLoading.value = false;
    }
  }

  /// Refresh promo video
  Future<void> refreshPromoVideo() async {
    await fetchLatestPromoVideo();
  }
}
