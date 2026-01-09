import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/utils/alert_utils.dart';
import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/text_form_field_widget/text_container_const2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

// Dummy Data Models
class DummyPersonalDetails {
  final String? name;
  final String? email;
  final String? phone;
  final String? whatsappNumber;
  final String? address;
  final String? state;
  final String? district;
  final String? city;
  final String? pincode;
  final String? adharNumber;
  final String? panNumber;

  DummyPersonalDetails({
    this.name,
    this.email,
    this.phone,
    this.whatsappNumber,
    this.address,
    this.state,
    this.district,
    this.city,
    this.pincode,
    this.adharNumber,
    this.panNumber,
  });
}

class DummyOrganization {
  final String? orgName;
  final String? registeredAddress;
  final String? dateOfEstablishment;
  final String? typeOfOrganization;
  final String? nameOfOwner;
  final String? ownershipStatus;

  DummyOrganization({
    this.orgName,
    this.registeredAddress,
    this.dateOfEstablishment,
    this.typeOfOrganization,
    this.nameOfOwner,
    this.ownershipStatus,
  });
}

class DummyServiceDetails {
  final List<String> selectedServices;

  DummyServiceDetails({required this.selectedServices});
}

class DummyLeadDetails {
  final String leadId;
  final String processStatus;
  final String createdAt;
  final DummyPersonalDetails? personalDetails;
  final DummyOrganization? organization;
  final DummyServiceDetails? serviceDetails;

  DummyLeadDetails({
    required this.leadId,
    required this.processStatus,
    required this.createdAt,
    this.personalDetails,
    this.organization,
    this.serviceDetails,
  });
}

class LeadReportDetailsScreen extends StatefulWidget {
  final bool isPending;
  final String? leadId;

  const LeadReportDetailsScreen({
    super.key,
    this.isPending = false,
    this.leadId,
  });

  @override
  State<LeadReportDetailsScreen> createState() =>
      _LeadReportDetailsScreenState();
}

class _LeadReportDetailsScreenState extends State<LeadReportDetailsScreen> {
  late Size size;
  final ScrollController scrollController = ScrollController();

  int selectedIndex = 0;

  final List<String> options = ["Individual", "Organisation", "Service"];

  // Dummy lead details data
  late DummyLeadDetails leadData;

  @override
  void initState() {
    super.initState();
    _initializeDummyData();
  }

  void _initializeDummyData() {
    // Determine status based on leadId or isPending flag
    String status = 'Approved';
    if (widget.isPending) {
      status = 'Pending';
    } else if (widget.leadId?.startsWith('REJ') == true) {
      status = 'Rejected';
    } else if (widget.leadId?.startsWith('PEN') == true) {
      status = 'Pending';
    }

    // Create comprehensive dummy data
    leadData = DummyLeadDetails(
      leadId: widget.leadId ?? 'LEAD-2024-001',
      processStatus: status,
      createdAt: '2024-01-15T10:30:00Z',
      personalDetails: DummyPersonalDetails(
        name: 'John Smith',
        email: 'john.smith@email.com',
        phone: '+1 234 567 8901',
        whatsappNumber: '+1 234 567 8901',
        address: '123 Main Street, Apartment 4B',
        state: 'California',
        district: 'Los Angeles County',
        city: 'Los Angeles',
        pincode: '90001',
        adharNumber: '1234 5678 9012',
        panNumber: 'ABCDE1234F',
      ),
      organization: DummyOrganization(
        orgName: 'Tech Solutions Inc.',
        registeredAddress:
            '456 Business Park, Suite 200, Los Angeles, CA 90001',
        dateOfEstablishment: '2020-03-15T00:00:00Z',
        typeOfOrganization: 'Private Limited Company',
        nameOfOwner: 'John Smith',
        ownershipStatus: 'Sole Proprietor',
      ),
      serviceDetails: DummyServiceDetails(
        selectedServices: [
          'Digital Documentation',
          'Data Storage Solutions',
          'Cloud Backup Services',
          'Document Management System',
        ],
      ),
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd-MM-yyyy').format(date);
    } catch (e) {
      return 'N/A';
    }
  }

  String _getValueOrNA(String? value) {
    return (value == null || value.isEmpty) ? 'N/A' : value;
  }

  // Get status banner configuration
  Map<String, dynamic> _getStatusConfig() {
    final status = leadData.processStatus.toLowerCase();

    if (status.contains('approved')) {
      return {
        'text': 'Approved',
        'backgroundColor': Color(0xFFB8E6B8), // Light green
        'textColor': Color(0xFF2D5F2D), // Dark green
      };
    } else if (status.contains('rejected')) {
      return {
        'text': 'Rejected Remark',
        'backgroundColor': Color(0xFFFFDADA), // Light red/pink
        'textColor': Color(0xFFD32F2F), // Red
      };
    } else {
      return {
        'text': 'Pending',
        'backgroundColor': Color(0xFFFFF4CC), // Light yellow
        'textColor': Color(0xFFE65100), // Orange
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: "Lead", showBack: true),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(child: _overviewSection()),

          // Show radio buttons
          SliverToBoxAdapter(child: _radioButtonSection()),

          SliverToBoxAdapter(
            child: [
              _personalDetailsSection(),
              _organisationSection(),
              _serviceSection(),
            ][selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _overviewSection() {
    final personalDetails = leadData.personalDetails;
    final organization = leadData.organization;
    final statusConfig = _getStatusConfig();

    // Get name (prioritize personal details, then organization)
    final name = _getValueOrNA(
      personalDetails?.name ??
          organization?.nameOfOwner ??
          organization?.orgName,
    );
    final phone = _getValueOrNA(personalDetails?.phone);
    final email = _getValueOrNA(personalDetails?.email);
    final createdDate = _formatDate(leadData.createdAt);
    final leadId = _getValueOrNA(leadData.leadId);
    final status = _getValueOrNA(leadData.processStatus);

    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 16, right: 16, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textSemiBold(
            text: "Overview",
            fontSize: 16,
            fontColor: AppStyles.textBlack,
          ),
          const SizedBox(height: 12),

          // Status Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: statusConfig['backgroundColor'],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: textSemiBold(
                text: statusConfig['text'],
                fontSize: 16.sp,
                fontColor: statusConfig['textColor'],
              ),
            ),
          ),

          const SizedBox(height: 12),
          _leadCardWidget(
            name: name,
            phone: phone,
            email: email,
            createdDate: createdDate,
            leadId: leadId,
            status: status,
          ),
        ],
      ),
    );
  }

  Widget _leadCardWidget({
    required String name,
    required String phone,
    required String email,
    required String createdDate,
    required String leadId,
    required String status,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyles.darkBlue03,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(1, 1),
            blurRadius: 1,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(-1, -1),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 22, top: 22, bottom: 23, right: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 114,
            height: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(102),
              image: const DecorationImage(
                image: AssetImage(ImageConst.manProfileJPG),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 26),
          // Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textExtraBold(
                  text: name,
                  fontSize: 14,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 7),
                textSemiBold(
                  text: "Phone No: $phone",
                  fontSize: 14.sp,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    textRegular(
                      text: "Email: ",
                      fontSize: 14.sp,
                      fontColor: AppStyles.whiteColor,
                    ),
                    Flexible(
                      child: textRegular(
                        text: email,
                        fontSize: 14.sp,
                        fontColor: Color(0xffA6E07A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                textMedium(
                  text: "Created Date: $createdDate",
                  fontSize: 14.sp,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 6),
                textMedium(
                  text: "Lead ID: $leadId",
                  fontSize: 14.sp,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    textMedium(
                      text: "Lead Status: ",
                      fontSize: 14.sp,
                      fontColor: AppStyles.whiteColor,
                    ),
                    textMedium(
                      text: status,
                      fontSize: 14.sp,
                      fontColor: AppStyles.green00,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _radioButtonSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(options.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Color(0xff7749F8) : AppStyles.grey66,
                      width: 1,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff7749F8),
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                textRegular(
                  text: options[index],
                  fontSize: 16.sp,
                  fontColor: AppStyles.textBlack,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _personalDetailsSection() {
    final details = leadData.personalDetails;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textMedium(
            text: "Personal Details",
            fontSize: 18.sp,
            fontColor: AppStyles.grey66,
          ),
          Divider(color: AppStyles.greyDE),
          TextContainerConst2(
            labelTitle: "Full Name",
            value: _getValueOrNA(details?.name),
          ),
          TextContainerConst2(
            labelTitle: "Email",
            value: _getValueOrNA(details?.email),
          ),
          TextContainerConst2(
            labelTitle: "Phone No",
            value: _getValueOrNA(details?.phone),
          ),
          TextContainerConst2(
            labelTitle: "WhatsApp No",
            value: _getValueOrNA(details?.whatsappNumber),
          ),
          TextContainerConst2(
            labelTitle: "Address",
            value: _getValueOrNA(details?.address),
          ),
          TextContainerConst2(
            labelTitle: "State",
            value: _getValueOrNA(details?.state),
          ),
          TextContainerConst2(
            labelTitle: "District",
            value: _getValueOrNA(details?.district),
          ),
          TextContainerConst2(
            labelTitle: "City",
            value: _getValueOrNA(details?.city),
          ),
          TextContainerConst2(
            labelTitle: "Pincode",
            value: _getValueOrNA(details?.pincode),
          ),
          TextContainerConst2(
            labelTitle: "Aadhaar No",
            value: _getValueOrNA(details?.adharNumber),
          ),
          TextContainerConst2(
            labelTitle: "PAN No",
            value: _getValueOrNA(details?.panNumber),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _organisationSection() {
    final org = leadData.organization;
    final establishmentDate = _formatDate(org?.dateOfEstablishment);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textMedium(
            text: "Organization Details",
            fontSize: 18.sp,
            fontColor: AppStyles.grey66,
          ),
          Divider(color: AppStyles.greyDE),
          TextContainerConst2(
            labelTitle: "Organization Name",
            value: _getValueOrNA(org?.orgName),
          ),
          TextContainerConst2(
            labelTitle: "Registered Office Address",
            value: _getValueOrNA(org?.registeredAddress),
          ),
          TextContainerConst2(
            labelTitle: "Date Of Establishment",
            value: establishmentDate,
          ),
          TextContainerConst2(
            labelTitle: "Type Of Organisation",
            value: _getValueOrNA(org?.typeOfOrganization),
          ),
          TextContainerConst2(
            labelTitle: "Name Of The Owner",
            value: _getValueOrNA(org?.nameOfOwner),
          ),
          TextContainerConst2(
            labelTitle: "Ownership Status",
            value: _getValueOrNA(org?.ownershipStatus),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _serviceSection() {
    final services = leadData.serviceDetails?.selectedServices ?? [];
    final createdDate = _formatDate(leadData.createdAt);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFAAAAAA).withOpacity(0.51),
              offset: const Offset(-1, 3),
              blurRadius: 11.9,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: textRegular(
                      text: "Service Request Date",
                      fontSize: 14.sp,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: textBold(text: createdDate, fontSize: 14.sp),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: textRegular(text: "Service", fontSize: 14.sp),
                  ),
                  Expanded(
                    flex: 3,
                    child: services.isEmpty
                        ? textBold(text: "N/A", fontSize: 14.sp)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: services
                                .map(
                                  (service) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: textBold(
                                      text: service,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
