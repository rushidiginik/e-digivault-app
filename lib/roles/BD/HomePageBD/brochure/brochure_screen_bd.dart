import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/brochure/controller/brochure_controller.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

class BrochureScreen extends StatefulWidget {
  const BrochureScreen({super.key});

  @override
  State<BrochureScreen> createState() => _BrochureScreenState();
}

class _BrochureScreenState extends State<BrochureScreen> {
  late Size size;
  final BrochureController brochureController = Get.put(BrochureController());
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: "Brochure", showBack: true),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Obx(() {
            // Loading state
            if (brochureController.isLoading.value) {
              return _buildLoadingState();
            }

            // Error state
            if (brochureController.errorMessage.value != null) {
              return _buildErrorState();
            }

            // PDF Container
            if (brochureController.brochureUrl.value != null &&
                brochureController.brochureUrl.value!.isNotEmpty) {
              return _buildPDFContainer();
            }

            // No brochure available
            return _buildEmptyState();
          }),
        ),
      ),
    );
  }

  Widget _buildPDFContainer() {
    return Column(
      children: [
        Container(
          height: 506, // Fixed height
          width: size.width * 0.91, // 91% of screen width
          decoration: BoxDecoration(
            border: Border.all(color: AppStyles.grey7C, width: 9),
            borderRadius: BorderRadius.circular(0), // Sharp corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: PDF().cachedFromUrl(
              brochureController.brochureUrl.value!,
              placeholder: (progress) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_progress != progress && mounted) {
                    setState(() => _progress = progress);
                  }
                });
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularLoader(),
                      SizedBox(height: 12),
                      textSemiBold(
                        text: 'Loading ${_progress.toStringAsFixed(0)}%',
                        fontSize: 14,
                      ),
                    ],
                  ),
                );
              },
              errorWidget: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: Colors.red),
                    SizedBox(height: 12),
                    textMedium(
                      text: "Failed to load",
                      fontSize: 14,
                      fontColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: textMedium(
            text: "Scroll for more",
            fontSize: 12,
            fontColor: AppStyles.grey28,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Center(child: CircularLoader());
  }

  Widget _buildErrorState() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red),
            SizedBox(height: 16),
            textMedium(
              text: brochureController.errorMessage.value!,
              fontSize: 14,
              fontColor: Colors.red,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => brochureController.refreshBrochure(),
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

  Widget _buildEmptyState() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.library_books_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            textMedium(
              text: "No brochure available",
              fontSize: 16,
              fontColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
