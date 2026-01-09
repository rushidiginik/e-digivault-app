import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/app_common_text.dart';
import '../../../../../core/constants/image_const.dart';
import '../../../../../core/constants/theme.dart';
import '../../../../../widgets/all_opinion_widget.dart';
import '../../../../../widgets/common_app_bar_widget.dart';

class ProposalEditMoreScreenAc extends StatefulWidget {
  final String? status;

  const ProposalEditMoreScreenAc({super.key, this.status});

  @override
  State<ProposalEditMoreScreenAc> createState() =>
      _ProposalEditMoreScreenAcState();
}

class _ProposalEditMoreScreenAcState extends State<ProposalEditMoreScreenAc> {
  late Size size;

  bool isManuallyApproved = false;

  void _showApproveSuccessDialog(BuildContext context) {
    late BuildContext dialogContext;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.78,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC0E1C7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ImageConst.successgreenicon,
                      width: 16,
                      height: 16,
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  "Successfully Approved",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      Navigator.of(context, rootNavigator: true).pop();

      setState(() {
        isManuallyApproved = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBarWidget(title: ""),
      body: Column(
        children: [
          AllOpinionWidget(
            clientName: "Rajesh Kumar",
            documentName: "E-Katha",
            title2: "Opinion",
            title: "Opinion",
            overviewPoints: [],
            legalPoints: [],
            showOpinionContent: false,
            headerTitle: "Proposal",
            headerIcon: SvgPicture.asset(
              ImageConst.proposalsicon, // apna svg path
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                AppStyles.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.h),
                    _bodyTopSection(),
                    _bodyCompanyDetailSection(),
                    _bodyBillToSection(),
                    _bodyServiceSection(),
                    _bodyDateSection(title: "date_space", value: " 16-08-2025"),
                    _bodyDateSection(title: "total_space", value: " 250A/-"),

                    const SizedBox(height: 90),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.greyDE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DigiVawltLogo(),
                SizedBox(width: 10),
                Container(
                  color: AppStyles.darkBlue24,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: textRegular(
                    text: "Inv #1".tr,
                    fontSize: 12,
                    fontColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            textRegular(
              text: "${"bill_date_label".tr} 12-07-2025",
              fontSize: 14,
              fontColor: AppStyles.grey66,
            ),
            SizedBox(height: 6),
            textRegular(
              text: "${"due_date_label".tr} 30-10-2025",
              fontSize: 14,
              fontColor: AppStyles.grey66,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyCompanyDetailSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.greyDE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBold(text: "Awesome Demo Company", fontSize: 16),
            SizedBox(height: 12),
            textRegular(
              text: "86935 Greenholt Forges Florida, 5626",
              fontSize: 14,
            ),
            SizedBox(height: 2),
            textRegular(
              text: "${"company_phone".tr}+12345678888",
              fontSize: 14,
            ),
            SizedBox(height: 2),
            textRegular(
              text: "${"company_email".tr}info@demo.company",
              fontSize: 14,
            ),
            SizedBox(height: 2),
            textRegular(
              text: "${"company_website".tr}http://www.democompany.com",
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyBillToSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.greyDE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                textBold(text: "bill_to".tr, fontSize: 18),
                textBold(
                  text: " Jack Ryan",
                  fontSize: 18,
                  fontColor: AppStyles.primaryColor,
                ),
              ],
            ),
            SizedBox(height: 6),
            textRegular(
              text: "Malleshwaram 4th cross 9th main road Banglore - 560001",
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyServiceSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.greyDE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBold(text: "service".tr, fontSize: 18),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 6.0, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSemiBold(
                        text: "E-Katha Extract",
                        fontSize: 14,
                        fontColor: AppStyles.primaryColor,
                      ),
                      SizedBox(height: 2),
                      textRegular(
                        text: "Revenue record on E-Katha",
                        fontSize: 12,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyDateSection({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.greyDE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            textBold(text: title.tr, fontSize: 18),
            textBold(
              text: value,
              fontSize: 18,
              fontColor: AppStyles.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class DigiVawltLogo extends StatelessWidget {
  const DigiVawltLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppStyles.primaryColor, AppStyles.darkBlue24],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'e-DigiVault',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: "InterBold",
            foreground: Paint()..shader = linearGradient,
            // If you have a custom font, add fontFamily: 'YourFont'
          ),
        ),
      ],
    );
  }
}
