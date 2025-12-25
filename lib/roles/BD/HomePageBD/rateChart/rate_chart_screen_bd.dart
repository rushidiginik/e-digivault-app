import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';

class RateChartScreen extends StatefulWidget {
  const RateChartScreen({super.key});

  @override
  State<RateChartScreen> createState() => _RateChartScreenState();
}

class _RateChartScreenState extends State<RateChartScreen> {
  late Size size;

  String? selectedMainService;
  String? selectedSubService;
  String? selectedService;

  final List<String> mainServices = [
    "E-Katha",
    "Revenue Service",
    "Health Service",
  ];

  final List<String> subServices = ["NIL", "Sub Service 1", "Sub Service 2"];

  final List<String> services = [
    "New E-katha Registration",
    "Katha Bifurcation",
    "Khata Amalgamation",
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: "Rate Chart", showBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Service Dropdown
            _buildDropdownField(
              label: "Main Service",
              hint: "E-Katha",
              value: selectedMainService,
              items: mainServices,
              onChanged: (value) {
                setState(() {
                  selectedMainService = value;
                });
              },
            ),

            const SizedBox(height: 16),

            // Sub Service Dropdown
            _buildDropdownField(
              label: "Sub Service",
              hint: "NIL",
              value: selectedSubService,
              items: subServices,
              onChanged: (value) {
                setState(() {
                  selectedSubService = value;
                });
              },
            ),

            const SizedBox(height: 16),

            // Service Dropdown
            _buildDropdownField(
              label: "Service",
              hint: "New E-katha Registration",
              value: selectedService,
              items: services,
              onChanged: (value) {
                setState(() {
                  selectedService = value;
                });
              },
            ),

            const SizedBox(height: 16),

            // Show Rate Chart Button
            Center(
              child: ButtonWidget(
                onTap: () {
                  router.push('/bd_ratechart_timeline_screen');
                },
                title: "Show Rate Chart",
                width: size.width * 0.89,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        textRegular(
          text: label,
          fontSize: 16,
          fontColor: AppStyles.textBlack,
          fontWeight: FontWeight.w400,
        ),

        const SizedBox(height: 6),

        // Dropdown Container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppStyles.greyDE, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: textRegular(
                text: hint,
                fontSize: 16,
                fontColor: AppStyles.textBlack.withOpacity(0.3),
              ),
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppStyles.textBlack,
                size: 32,
              ),
              dropdownColor: AppStyles.whiteColor,
              borderRadius: BorderRadius.circular(12),
              elevation: 4,
              menuMaxHeight: 300,
              style: TextStyle(
                fontSize: 16,
                color: AppStyles.textBlack,
                fontWeight: FontWeight.w400,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: textRegular(
                      text: item,
                      fontSize: 16,
                      fontColor: AppStyles.textBlack,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
