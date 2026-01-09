import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/controller/view_leads_controller.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/leads_details_response.dart';
import 'package:e_digivault_org_app/utils/alert_utils.dart';
import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:e_digivault_org_app/widgets/text_form_field_widget/text_container_const2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ViewLeadDetailsScreen extends StatefulWidget {
  final bool isPending;
  final String? leadId;

  const ViewLeadDetailsScreen({super.key, this.isPending = false, this.leadId});

  @override
  State<ViewLeadDetailsScreen> createState() => _ViewLeadDetailsScreenState();
}

class _ViewLeadDetailsScreenState extends State<ViewLeadDetailsScreen> {
  late Size size;
  final ScrollController scrollController = ScrollController();
  late final ViewLeadsController leadsController;

  int selectedIndex = 0;

  final List<String> options = ["Individual", "Organisation", "Service"];

  @override
  void initState() {
    super.initState();

    // Get existing controller
    if (Get.isRegistered<ViewLeadsController>()) {
      leadsController = Get.find<ViewLeadsController>();
    } else {
      leadsController = Get.put(ViewLeadsController());
    }

    // Fetch lead details
    if (widget.leadId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        leadsController.fetchLeadDetails(widget.leadId!);
      });
    }
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

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: "Lead", showBack: true),
      body: Obx(() {
        // Show loading
        if (leadsController.isLoadingDetails.value) {
          return Center(child: CircularLoader());
        }

        // Show error
        if (leadsController.errorMessage.value != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  leadsController.errorMessage.value!,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (widget.leadId != null) {
                      leadsController.fetchLeadDetails(widget.leadId!);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Show data
        final leadData = leadsController.leadDetails.value;
        if (leadData == null) {
          return Center(child: Text('No lead details available'));
        }

        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: _overviewSection(leadData)),

            // Show Approve/Reject buttons only if isPending is true
            if (widget.isPending)
              SliverToBoxAdapter(child: _approveRejectButtons()),

            // Show radio buttons if isPending, otherwise show tab controller
            SliverToBoxAdapter(
              child: widget.isPending
                  ? _radioButtonSection()
                  : _tabControllerSection(),
            ),

            SliverToBoxAdapter(
              child: [
                _personalDetailsSection(leadData),
                _organisationSection(leadData),
                _serviceSection(leadData),
              ][selectedIndex],
            ),
          ],
        );
      }),
    );
  }

  Widget _overviewSection(leadData) {
    final personalDetails = leadData.personalDetails;
    final organization = leadData.organization;

    // Get name (prioritize personal details, then organization)
    final name = leadsController.getValueOrNA(
      personalDetails?.name ??
          organization?.nameOfOwner ??
          organization?.orgName,
    );
    final phone = leadsController.getValueOrNA(personalDetails?.phone);
    final email = leadsController.getValueOrNA(personalDetails?.email);
    final createdDate = _formatDate(leadData.createdAt);
    final leadId = leadsController.getValueOrNA(leadData.leadId);
    final status = leadsController.getValueOrNA(leadData.processStatus);

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
          CommonDivider(),
          const SizedBox(height: 10),
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

  Widget _approveRejectButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 144,
            child: ElevatedButton(
              onPressed: () {
                AlertUtils.showSuccessDialog(
                  context: context,
                  title: "Approved",
                  message: "The lead has been successfully approved.",
                  autoCloseSeconds: 2,
                  onDismiss: () {},
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.green00,
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: textSemiBold(
                text: "Approve",
                fontSize: 14.sp,
                fontColor: AppStyles.whiteColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 144,
            child: ElevatedButton(
              onPressed: () {
                AlertUtils.showRejectDialog(
                  context: context,
                  onReject: () {
                    AlertUtils.showRejectedDialog(
                      context: context,
                      title: "Rejected",
                      message: "The lead has been rejected.",
                      onDismiss: () {},
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.redA5,
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: textSemiBold(
                text: "Reject",
                fontSize: 14.sp,
                fontColor: AppStyles.whiteColor,
              ),
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

  Widget _tabControllerSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(options.length * 2 - 1, (index) {
              if (index.isOdd) {
                return const SizedBox(width: 14);
              }

              final itemIndex = index ~/ 2;
              final isSelected = selectedIndex == itemIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppStyles.whiteColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: textSemiBold(
                    text: options[itemIndex],
                    fontSize: 16.sp,
                    fontColor: isSelected
                        ? AppStyles.primaryColor
                        : AppStyles.whiteColor,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _personalDetailsSection(leadData) {
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
            value: leadsController.getValueOrNA(details?.name),
          ),
          TextContainerConst2(
            labelTitle: "Email",
            value: leadsController.getValueOrNA(details?.email),
          ),
          TextContainerConst2(
            labelTitle: "Phone No",
            value: leadsController.getValueOrNA(details?.phone),
          ),
          TextContainerConst2(
            labelTitle: "WhatsApp No",
            value: leadsController.getValueOrNA(details?.whatsappNumber),
          ),
          TextContainerConst2(
            labelTitle: "Address",
            value: leadsController.getValueOrNA(details?.address),
          ),
          TextContainerConst2(
            labelTitle: "State",
            value: leadsController.getValueOrNA(details?.state),
          ),
          TextContainerConst2(
            labelTitle: "District",
            value: leadsController.getValueOrNA(details?.district),
          ),
          TextContainerConst2(
            labelTitle: "City",
            value: leadsController.getValueOrNA(details?.city),
          ),
          TextContainerConst2(
            labelTitle: "Pincode",
            value: leadsController.getValueOrNA(details?.pincode),
          ),
          TextContainerConst2(
            labelTitle: "Aadhaar No",
            value: leadsController.getValueOrNA(details?.adharNumber),
          ),
          TextContainerConst2(
            labelTitle: "PAN No",
            value: leadsController.getValueOrNA(details?.panNumber),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _organisationSection(leadData) {
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
            value: leadsController.getValueOrNA(org?.orgName),
          ),
          TextContainerConst2(
            labelTitle: "Registered Office Address",
            value: leadsController.getValueOrNA(org?.registeredAddress),
          ),
          TextContainerConst2(
            labelTitle: "Date Of Establishment",
            value: establishmentDate,
          ),
          TextContainerConst2(
            labelTitle: "Type Of Organisation",
            value: leadsController.getValueOrNA(org?.typeOfOrganization),
          ),
          TextContainerConst2(
            labelTitle: "Name Of The Owner",
            value: leadsController.getValueOrNA(org?.nameOfOwner),
          ),
          TextContainerConst2(
            labelTitle: "Ownership Status",
            value: leadsController.getValueOrNA(org?.ownershipStatus),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _serviceSection(leadData) {
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
