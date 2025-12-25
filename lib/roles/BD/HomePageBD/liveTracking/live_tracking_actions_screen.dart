import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';

class LiveTrackingActionsScreen extends StatefulWidget {
  final String title;
  final String status;

  const LiveTrackingActionsScreen({
    super.key,
    required this.title,
    required this.status,
  });

  @override
  State<LiveTrackingActionsScreen> createState() =>
      _LiveTrackingActionsScreenState();
}

class _LiveTrackingActionsScreenState extends State<LiveTrackingActionsScreen> {
  late Size size;

  // Dummy data for details
  final Map<String, String> detailsData = {
    "Client Name": "Rajesh Kumar",
    "Property ID": "BA-MA-6754",
    "Category": "Revenue REcords",
    "Moderator": "Kiran",
    "CD": "Kavya",
  };

  // Timeline data
  final List<Map<String, String>> timelineData = [
    {
      "title": "Online Application",
      "description": "Description",
      "duration": "2 Days",
    },
    {
      "title": "BBMP ARO Office",
      "description": "Description",
      "duration": "3 Days",
    },
    {"title": "RI", "description": "Description", "duration": ""},
  ];

  // Get status color and background based on status
  Map<String, Color> _getStatusColors() {
    switch (widget.status.toLowerCase()) {
      case 'approved':
        return {'bg': AppStyles.lightGreenE6, 'text': AppStyles.green2E};
      case 'pending':
        return {'bg': AppStyles.lightOrangeFF, 'text': AppStyles.orange20};
      case 'rejected':
        return {'bg': AppStyles.lightRedFD, 'text': AppStyles.redColor3F};
      default:
        return {'bg': AppStyles.lightBlueEB, 'text': AppStyles.blue2F};
    }
  }

  bool _showDetailsAndButtons() {
    return widget.status.toLowerCase() == 'pending' ||
        widget.status.toLowerCase() == 'rejected';
  }

  bool _showButtons() {
    return widget.status.toLowerCase() == 'pending';
  }

  void _onApprove() {
    // Handle approve action
    debugPrint("✅ Approved: ${widget.title}");
    // Add your approval logic here
  }

  void _onReject() {
    // Handle reject action
    debugPrint("❌ Rejected: ${widget.title}");
    // Add your rejection logic here
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final statusColors = _getStatusColors();

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: "Live Tracking", showBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 36.0, right: 16, left: 16),
          child: Column(
            children: [
              // Status Container
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: statusColors['bg'],
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Center(
                  child: textSemiBold(
                    text: widget.status,
                    fontSize: 18,
                    fontColor: statusColors['text'],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Timeline Container with new design
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: timelineData.length,
                  itemBuilder: (context, index) {
                    return _timelineStep(
                      title: timelineData[index]["title"]!,
                      description: timelineData[index]["description"]!,
                      duration: timelineData[index]["duration"]!,
                      isLast: index == timelineData.length - 1,
                    );
                  },
                ),
              ),

              // Show Details and Buttons for Pending/Rejected status
              if (_showDetailsAndButtons()) ...[
                const SizedBox(height: 20),

                // Details Section
                _detailsSection(),

                // Buttons Section (only for Pending)
                if (_showButtons()) ...[
                  const SizedBox(height: 20),
                  _actionButtons(),
                  const SizedBox(height: 15),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailsSection() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: detailsData.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textMedium(
                text: entry.key,
                fontSize: 14,
                fontColor: Color(0xff072F5B),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff072F5B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: textMedium(
                  text: entry.value,
                  fontSize: 18,
                  fontColor: AppStyles.whiteColor,
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: _onApprove,
          child: Container(
            width: 100,
            height: 44,
            decoration: BoxDecoration(
              color: AppStyles.lightGreenE6,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: textSemiBold(
              text: "Approve",
              fontSize: 14,
              fontColor: AppStyles.green2E,
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: _onReject,
          child: Container(
            width: 100,
            height: 44,
            decoration: BoxDecoration(
              color: AppStyles.lightRedFD,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: textSemiBold(
              text: "Reject",
              fontSize: 14,
              fontColor: AppStyles.redColor3F,
            ),
          ),
        ),
      ],
    );
  }

  Widget _timelineStep({
    required String title,
    required String description,
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

                  // Duration box - only if not empty
                  if (duration.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _infoBox(text: duration, width: size.width * 0.30),
                    ),
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
