import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/utils/alert_utils.dart';
import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/success_popup.dart';
import 'package:e_digivault_org_app/widgets/text_form_field_widget/text_container_const2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewLeadDetailsScreen extends StatefulWidget {
  final bool isPending;

  const ViewLeadDetailsScreen({super.key, this.isPending = false});

  @override
  State<ViewLeadDetailsScreen> createState() => _ViewLeadDetailsScreenState();
}

class _ViewLeadDetailsScreenState extends State<ViewLeadDetailsScreen> {
  late Size size;
  final ScrollController scrollController = ScrollController();

  int selectedIndex = 0;

  final List<String> options = ["Individual", "Organisation", "Service"];

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
          _leadCardWidget(),
        ],
      ),
    );
  }

  static Widget _leadCardWidget() {
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
                  text: "Rajesh Kumar",
                  fontSize: 14,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 7),
                textSemiBold(
                  text: "Phone No: 89XXXXXXX78",
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
                        text: "Rajeshn@gmail.com",
                        fontSize: 14.sp,
                        fontColor: Color(0xffA6E07A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                textMedium(
                  text: "Created Date : 28-05-2025",
                  fontSize: 14.sp,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 6),
                textMedium(
                  text: "Lead ID : LD-784512",
                  fontSize: 14.sp,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 6),
                textMedium(
                  text: "Lead By : Kiran @ CP-435689",
                  fontSize: 14.sp,
                  fontColor: AppStyles.whiteColor,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    textMedium(
                      text: "Lead Status : ",
                      fontSize: 14.sp,
                      fontColor: AppStyles.whiteColor,
                    ),
                    textMedium(
                      text: "Processing",
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
                /// SHOW SUCCESS DIALOG USING
                AlertUtils.showSuccessDialog(
                  context: context,
                  title: "Approved",
                  message: "Your file E-katha has been successfully Approved.",
                  autoCloseSeconds: 2,
                  onDismiss: () {
                    // Optional: Add any action after dialog dismisses
                    // e.g., navigate back or refresh data
                  },
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
                ///  SHOW REJECT REMARK DIALOG
                AlertUtils.showRejectDialog(
                  context: context,
                  onReject: () {
                    // When reject button is clicked, show rejected confirmation
                    AlertUtils.showRejectedDialog(
                      context: context,
                      title: "Rejected",
                      message: "Your file E-katha has been Rejected.",
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

  void _showRejectDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Reject Lead"),
        content: Text("Are you sure you want to reject this lead?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle rejection logic here
              Navigator.pop(context);
              // Show success message or navigate back
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text("Reject"),
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
                /// Radio circle
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

                /// Label
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
                return const SizedBox(width: 14); // spacing
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

  Widget _personalDetailsSection() {
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
          TextContainerConst2(labelTitle: "Full Name", value: "Rajesh Kumar"),
          TextContainerConst2(
            labelTitle: "Email",
            value: "rajeshkumar@gmail.com",
          ),
          TextContainerConst2(labelTitle: "Phone No", value: "+91 94xxxxxx23"),
          TextContainerConst2(
            labelTitle: "WhatsApp No",
            value: "+91 94xxxxxx23",
          ),
          TextContainerConst2(
            labelTitle: "Address",
            value:
                "34, TechPark Lane, Koramangala, Bangalore, Karnataka - 560034",
          ),
          TextContainerConst2(labelTitle: "State", value: "Karnataka"),
          TextContainerConst2(labelTitle: "District", value: "Bengaluru Urban"),
          TextContainerConst2(labelTitle: "Taluk", value: "Bengaluru North"),
          TextContainerConst2(labelTitle: "City", value: "Bengaluru"),
          TextContainerConst2(labelTitle: "Pincode", value: "560034"),
          TextContainerConst2(labelTitle: "Aadhaar No", value: "94xxxxxx23"),
          TextContainerConst2(labelTitle: "PAN No", value: "OHAPS5722P"),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _organisationSection() {
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
            value: "Citrine Solutions Pvt. Ltd",
          ),
          TextContainerConst2(
            labelTitle: "Registered Office Address",
            value:
                "34, TechPark Lane, Koramangala, Bangalore, Karnataka - 560034",
          ),
          TextContainerConst2(
            labelTitle: "Date Of Establishment",
            value: "12 March 2017",
          ),
          TextContainerConst2(
            labelTitle: "Type Of Organisation",
            value: "Private Limited Company",
          ),
          TextContainerConst2(
            labelTitle: "Name Of The Owner",
            value: "Rajesh Kumar",
          ),
          TextContainerConst2(
            labelTitle: "Ownership Status",
            value: "Individual Business",
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _serviceSection() {
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
              /// Service Request Date Row
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
                    child: textBold(text: "24-05-25", fontSize: 14.sp),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Service Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: textRegular(text: "Service", fontSize: 14.sp),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textBold(text: "E-Katha", fontSize: 14.sp),
                        const SizedBox(height: 12),
                        textBold(text: "Katha Extract", fontSize: 14.sp),
                        const SizedBox(height: 12),
                        textBold(text: "Katha Mutation", fontSize: 14.sp),
                      ],
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
