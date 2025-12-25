import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';

class SubServiceScreen extends StatefulWidget {
  final String mainServiceName;
  final String mainServiceId;

  const SubServiceScreen({
    super.key,
    required this.mainServiceName,
    required this.mainServiceId,
  });

  @override
  State<SubServiceScreen> createState() => _SubServiceScreenState();
}

class _SubServiceScreenState extends State<SubServiceScreen> {
  // Dummy data for sub-services
  late List<Map<String, String>> subServices;

  @override
  void initState() {
    super.initState();
    // Generate dummy sub-services based on main service
    subServices = _getSubServicesForMainService(widget.mainServiceId);
  }

  List<Map<String, String>> _getSubServicesForMainService(
    String mainServiceId,
  ) {
    // For E-Khatha service (ID: 9), return specific sub-services
    if (mainServiceId == "9") {
      return [
        {"name": "New E-Katha Registration", "id": "9-1"},
        {"name": "Katha Bifurcation", "id": "9-2"},
        {"name": "Khata Amalgamation", "id": "9-3"},
        {"name": "Khata Conversion / Update", "id": "9-4"},
        {"name": "Duplicate / Re-print Khata Certificate", "id": "9-5"},
        {
          "name": "Correction / Update Khata Details_Name Correction in Khata",
          "id": "9-6",
        },
        {
          "name":
              "Correction /Update Khata Details_Property Area / Measurement",
          "id": "9-7",
        },
        {
          "name":
              "Correction / Update Khata Details_Property Usage / Type Correction",
          "id": "9-8",
        },
        {
          "name":
              "Use downloadable e-Khata / Khata Certificate for legal/ financial/trade use_Loan / Mortgage / Financial Transaction",
          "id": "9-9",
        },
        {
          "name":
              "Use downloadable e-Khata / Khata Certificate for legal/ financial/trade use_Property Sale / Purchase / Transfer",
          "id": "9-10",
        },
        {
          "name":
              "Correction/Update Khata Details_Property Area / Measurement Correction / Details_Property Usage / Type Correction",
          "id": "9-11",
        },
        {
          "name":
              "Use downloadable e-Khata / Khata Certificate for legal/ financial/trade use_Legal / Court Verification",
          "id": "9-12",
        },
        {
          "name":
              "Use downloadable e-Khata / Khata Certificate for legal/ financial/trade use_Trade / Business Use (Mortgage, Lease, Rent)",
          "id": "9-13",
        },
        {
          "name":
              "Use downloadable e-Khata / Khata Certificate for legal/ financial/trade use_Gov Schemes / Subsidy Applications",
          "id": "9-14",
        },
      ];
    }

    // For other services, return generic sub-services
    return [
      {"name": "Sub Service 1", "id": "$mainServiceId-1"},
      {"name": "Sub Service 2", "id": "$mainServiceId-2"},
      {"name": "Sub Service 3", "id": "$mainServiceId-3"},
      {"name": "Sub Service 4", "id": "$mainServiceId-4"},
      {"name": "Sub Service 5", "id": "$mainServiceId-5"},
      {"name": "Sub Service 6", "id": "$mainServiceId-6"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'ServiceDocs', showBack: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppStyles.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppStyles.greyDE),
                ),
                child: Center(
                  child: textSemiBold(
                    text: "Select Sub Service for ${widget.mainServiceName}",
                    fontSize: 18,
                    fontColor: AppStyles.textBlack,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),

              SizedBox(height: 14),

              // Sub Services Layout
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: _buildAllRows(subServices)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAllRows(List<Map<String, String>> items) {
    if (items.isEmpty) return [];

    List<Widget> widgets = [];

    // First 3 items in one row
    if (items.length >= 3) {
      widgets.add(_buildRow(items.take(3).toList(), 3));
      widgets.add(SizedBox(height: 14));
    } else if (items.isNotEmpty) {
      widgets.add(_buildRow(items, items.length));
      return widgets;
    }

    // Next 3 items in one row
    if (items.length >= 6) {
      widgets.add(_buildRow(items.skip(3).take(3).toList(), 3));
      widgets.add(SizedBox(height: 14));
    } else if (items.length > 3) {
      widgets.add(_buildRow(items.skip(3).toList(), items.length - 3));
      return widgets;
    }

    // Remaining items in pairs
    if (items.length > 6) {
      final remaining = items.skip(6).toList();
      for (int i = 0; i < remaining.length; i += 2) {
        final chunk = remaining.skip(i).take(2).toList();
        widgets.add(_buildRow(chunk, chunk.length));
        widgets.add(SizedBox(height: 14));
      }
    }

    return widgets;
  }

  Widget _buildRow(List<Map<String, String>> items, int columns) {
    return Row(
      children: List.generate(items.length, (index) {
        return Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(right: index != items.length - 1 ? 14 : 0),
            child: _subServiceCard(
              subServiceName: items[index]["name"]!,
              subServiceId: items[index]["id"]!,
            ),
          ),
        );
      }),
    );
  }

  Widget _subServiceCard({
    required String subServiceName,
    required String subServiceId,
  }) {
    final bool isLongText = subServiceName.length > 40;

    return GestureDetector(
      onTap: () {
        debugPrint(
          "🔹 Selected Sub-Service: $subServiceName (ID: $subServiceId)",
        );
        debugPrint("🔹 Main Service: ${widget.mainServiceName}");

        // Add navigation to next screen here
        // For example: navigate to document requirements screen
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(
          horizontal: isLongText ? 8 : 10,
          vertical: isLongText ? 8 : 12,
        ),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: textMedium(
            text: subServiceName,
            fontSize: 12,
            fontColor: Colors.white,
            textAlign: TextAlign.center,
            maxLines: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
