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

  final List<Map<String, String>> timelineData = [
    {
      "title": "Online Application",
      "description": "Description",
      "amount": "₹10,000",
      "duration": "2 Days",
    },
    {
      "title": "BBMP ARO Office",
      "description": "Description",
      "amount": "₹5,000",
      "duration": "3 Days",
    },
    {
      "title": "RI",
      "description": "Description",
      "amount": "₹5,000",
      "duration": "3 Days",
    },
    {
      "title": "Case Workia",
      "description": "Description",
      "amount": "₹5,000",
      "duration": "",
    },
    {
      "title": "Manager Accessor",
      "description": "Description",
      "amount": "₹10,000",
      "duration": "2 Days",
    },
    {
      "title": "ARO",
      "description": "Description",
      "amount": "₹5,000",
      "duration": "3 Days",
    },
    {
      "title": "RO Manager",
      "description": "Description",
      "amount": "₹5,000",
      "duration": "",
    },
    {
      "title": "BBMP E-Katha",
      "description": "Description",
      "amount": "₹5,000",
      "duration": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: "Rate Chart", showBack: true),
        body: Padding(
          padding: const EdgeInsets.only(left: 41, right: 41, top: 25),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: timelineData.length,
            itemBuilder: (context, index) {
              return _timelineStep(
                title: timelineData[index]["title"]!,
                description: timelineData[index]["description"]!,
                amount: timelineData[index]["amount"]!,
                duration: timelineData[index]["duration"]!,
                isLast: index == timelineData.length - 1,
              );
            },
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
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Indicator Column
          SizedBox(
            width: 50,
            child: Column(
              children: [
                // Circle indicator
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppStyles.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppStyles.primaryColor, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: AppStyles.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                // Connector line - expands to fill remaining space
                if (!isLast)
                  Expanded(
                    child: Container(width: 3, color: AppStyles.primaryColor),
                  ),
              ],
            ),
          ),

          // Timeline Content - positioned to overlap with circle
          Expanded(
            child: Transform.translate(
              offset: const Offset(
                -5,
                -3,
              ), // Move left to attach to circle center
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title container
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppStyles.whiteColor,
                      border: Border.all(
                        color: AppStyles.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: textSemiBold(
                      text: title,
                      fontSize: 16,
                      fontColor: AppStyles.textBlack,
                    ),
                  ),
                  const SizedBox(height: 23),

                  // Description box
                  _infoBox(text: description, width: size.width * 0.45),
                  const SizedBox(height: 6),

                  // Amount box - aligned to right
                  Align(
                    alignment: Alignment.centerRight,
                    child: _infoBox(text: amount, width: size.width * 0.30),
                  ),

                  // Duration box - only if not empty
                  if (duration.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    _infoBox(text: duration, width: size.width * 0.35),
                  ],

                  // Bottom spacing
                  SizedBox(height: isLast ? 20 : 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox({required String text, double? width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppStyles.whiteColor,
        border: Border.all(color: AppStyles.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: textSemiBold(
          text: text,
          fontSize: 12,
          fontColor: AppStyles.primaryColor,
        ),
      ),
    );
  }
}
