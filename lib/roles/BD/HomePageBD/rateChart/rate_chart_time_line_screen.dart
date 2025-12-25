import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';

class RateChartTimeLineScreen extends StatefulWidget {
  const RateChartTimeLineScreen({super.key});

  @override
  State<RateChartTimeLineScreen> createState() =>
      _RateChartTimeLineScreenState();
}

class _RateChartTimeLineScreenState extends State<RateChartTimeLineScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: "Rate Chart", showBack: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppStyles.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppStyles.greyDE,
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _timelineStep(
                    title: "Online Application",
                    description: "Description",
                    amount: "₹10,000",
                    duration: "2 Days",
                  ),
                  _timelineStep(
                    title: "BBMP ARO Office",
                    description: "Description",
                    amount: "₹5,000",
                    duration: "3 Days",
                  ),
                  _timelineStep(
                    title: "RI",
                    description: "Description",
                    amount: "₹5,000",
                    duration: "",
                  ),
                  _timelineStep(
                    title: "Case Workia",
                    description: "Description",
                    amount: "₹5,000",
                    duration: "",
                  ),
                  _timelineStep(
                    title: "Manager Accessor",
                    description: "Description",
                    amount: "₹10,000",
                    duration: "2 Days",
                  ),
                  _timelineStep(
                    title: "ARO",
                    description: "Description",
                    amount: "₹5,000",
                    duration: "3 Days",
                  ),
                  _timelineStep(
                    title: "RO Manager",
                    description: "Description",
                    amount: "₹5,000",
                    duration: "",
                  ),
                  _timelineStep(
                    title: "BBMP E-Katha",
                    description: "Description",
                    amount: "₹5,000",
                    duration: "",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _timelineStep({
    required String title,
    required String description,
    required String amount,
    required String duration,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Indicator
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppStyles.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppStyles.primaryColor, width: 2),
              ),
              padding: EdgeInsets.all(10),
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              width: 2,
              height: size.height * 0.20,
              color: AppStyles.primaryColor,
            ),
          ],
        ),

        // Timeline Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppStyles.primaryColor, width: 2),
                    bottom: BorderSide(color: AppStyles.primaryColor, width: 2),
                    right: BorderSide(color: AppStyles.primaryColor, width: 2),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: textSemiBold(text: title, fontSize: 16),
              ),
              _containerSection(text: description),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.45),
                child: _containerSection(
                  text: amount,
                  width: size.width * 0.25,
                ),
              ),
              if (duration.isNotEmpty) _containerSection(text: duration),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _containerSection({required String text, double? width}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: width ?? size.width * 0.45,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: textSemiBold(
            text: text,
            fontSize: 14,
            fontColor: AppStyles.primaryColor,
          ),
        ),
      ),
    );
  }
}
