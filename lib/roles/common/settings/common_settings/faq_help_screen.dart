import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/controller/settings_controller.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/common_serachBar_withController.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqHelpScreen extends StatefulWidget {
  const FaqHelpScreen({super.key});

  @override
  State<FaqHelpScreen> createState() => _FaqHelpScreenState();
}

class _FaqHelpScreenState extends State<FaqHelpScreen> {
  final SettingsController settingsController = Get.find<SettingsController>();

  List<Map<String, String>> faqList = [];
  List<Map<String, String>> filteredFaqList = [];

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    settingsController.getFaqList();

    /// Fetch FAQ API
    settingsController.getFaqList().then((_) {
      if (settingsController.faqResponse != null) {
        /// Convert API → Map format UI expects
        faqList = settingsController.faqResponse!.data.map((faq) {
          return {"question": faq.title, "answer": faq.description};
        }).toList();

        filteredFaqList = List<Map<String, String>>.from(faqList);

        setState(() {});
      }
    });

    controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanged);
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final q = controller.text.trim().toLowerCase();

    if (q.isEmpty) {
      setState(() {
        filteredFaqList = List<Map<String, String>>.from(faqList);
      });
      return;
    }

    setState(() {
      filteredFaqList = faqList.where((faq) {
        final question = faq["question"]!.toLowerCase();
        final answer = faq["answer"]!.toLowerCase();
        return question.contains(q) || answer.contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: "Faq_Help"),
      body: Obx(
        () => settingsController.isFaqLoading.value
            ? CircularLoader()
            : SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonSearchBar(controller: controller),
                      const SizedBox(height: 12),

                      // FAQ list rendering
                      ...filteredFaqList.map(
                        (faq) =>
                            _buildFAQItem(faq["question"]!, faq["answer"]!),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // UI COMPONENTS
  // -------------------------------------------------------------------------

  Widget _buildOutlinedButton(String textKey) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppStyles.primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: () {},
      child: textMedium(
        text: textKey,
        fontSize: 16,
        fontColor: AppStyles.primaryColor,
      ),
    );
  }

  Widget _buildGradientButton(String textKey) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        onPressed: () {},
        child: textSemiBold(
          text: textKey,
          fontSize: 16,
          fontColor: AppStyles.whiteColor,
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppStyles.primaryColor,
              AppStyles.primaryColor.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppStyles.greyDE, width: 0.5),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 10),
          minTileHeight: 45,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: textMedium(
            text: question,
            fontSize: 14,
            fontColor: AppStyles.whiteColor,
          ),
          iconColor: AppStyles.whiteColor,
          collapsedIconColor: AppStyles.whiteColor,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: AppStyles.whiteColor,
              child: textRegular(
                text: answer,
                fontSize: 12,
                fontColor: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
