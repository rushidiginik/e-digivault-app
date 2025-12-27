import 'package:e_digivault_org_app/roles/BD/HomePageBD/brochure/controller/brochure_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrochureController extends GetxController {
  final isLoading = false.obs;
  final Rx<String?> brochureUrl = Rx(null);
  final Rx<String?> errorMessage = Rx(null);

  final BrochureService service = BrochureService();

  @override
  void onInit() {
    super.onInit();
    fetchLatestBrochure();
  }

  /// Fetch latest brochure
  Future<void> fetchLatestBrochure() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await service.getAllBrochures(
        page: 1,
        limit: 1,
        isActive: true,
      );

      if (response != null && response.success == true) {
        if (response.data != null && response.data!.isNotEmpty) {
          final brochure = response.data!.first;
          brochureUrl.value = brochure.fileUrl;

          debugPrint("✅ Brochure loaded: ${brochure.title}");
          debugPrint("📄 PDF URL: ${brochure.fileUrl}");
        } else {
          errorMessage.value = "No brochure available";
          debugPrint("⚠️ No brochures found");
        }
      } else {
        errorMessage.value = response?.message ?? "Failed to load brochure";
        debugPrint("⚠️ Failed to fetch brochure");
      }
    } catch (e, stackTrace) {
      errorMessage.value = "An error occurred";
      debugPrint("❌ Brochure fetch error: $e");
      debugPrint("Stack trace: $stackTrace");
    } finally {
      isLoading.value = false;
    }
  }

  /// Refresh brochure
  Future<void> refreshBrochure() async {
    await fetchLatestBrochure();
  }
}
