import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:go_router/go_router.dart';

class ServiceDocumentsScreen extends StatefulWidget {
  const ServiceDocumentsScreen({super.key});

  @override
  State<ServiceDocumentsScreen> createState() => _ServiceDocumentsScreenState();
}

class _ServiceDocumentsScreenState extends State<ServiceDocumentsScreen> {
  // Dummy data for main services
  final List<Map<String, String>> mainServices = [
    {"name": "Record Room Documents", "id": "1"},
    {"name": "Survey Documents", "id": "2"},
    {"name": "Registration Documents", "id": "3"},
    {"name": "Property Identification Documents", "id": "4"},
    {"name": "Conversion of Land", "id": "5"},
    {"name": "Change of Land", "id": "6"},
    {"name": "Land Grants", "id": "7"},
    {"name": "Podi and Durasthu", "id": "8"},
    {"name": "E-Khatha", "id": "9"},
    {"name": "Plan Approvals", "id": "10"},
    {"name": "Ammend-ments", "id": "11"},
    {"name": "No Objection Certificates", "id": "12"},
    {"name": "Land Acquisitions", "id": "13"},
    {"name": "Land Allotments", "id": "14"},
    {"name": "Property Bifurcation", "id": "15"},
    {"name": "Electricity Board Approvals", "id": "16"},
    {"name": "Water Supply Board Approvals", "id": "17"},
    {"name": "Pollution Control Board Approvals", "id": "18"},
    {"name": "Land Assessment, Survey & Property Valuations", "id": "19"},
    {"name": "Local Authority Services", "id": "20"},
    {"name": "Legal Documents", "id": "21"},
    {"name": "Third Party Opinion", "id": "22"},
    {"name": "Business Record", "id": "23"},
    {"name": "Personal Record", "id": "24"},
  ];

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
                    text: "Select Main Service",
                    fontSize: 18,
                    fontColor: AppStyles.textBlack,
                  ),
                ),
              ),

              SizedBox(height: 14),

              // Grid of Services
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: mainServices.length,
                  itemBuilder: (context, index) {
                    return _mainServiceCard(
                      serviceName: mainServices[index]["name"]!,
                      serviceId: mainServices[index]["id"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainServiceCard({
    required String serviceName,
    required String serviceId,
  }) {
    return GestureDetector(
      onTap: () {
        debugPrint("🔹 Selected Main Service: $serviceName (ID: $serviceId)");

        // Navigate to SubServiceScreen
        context.push(
          '/bd_subservice_screen',
          extra: {'mainServiceName': serviceName, 'mainServiceId': serviceId},
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: textMedium(
            text: serviceName,
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
