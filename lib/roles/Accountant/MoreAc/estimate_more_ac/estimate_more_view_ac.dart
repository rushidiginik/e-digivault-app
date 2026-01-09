import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_common_text.dart';
import '../../../../core/constants/theme.dart';
import '../../../../widgets/common_header.dart';

class EstimateMoreViewAc extends StatefulWidget {
  final String? status;

  const EstimateMoreViewAc({super.key, this.status});

  @override
  State<EstimateMoreViewAc> createState() => _EstimateMoreViewAcState();
}

class _EstimateMoreViewAcState extends State<EstimateMoreViewAc> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,

        appBar: CommonHeader(title: 'Client ID', showBack: true),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topHeaderByStatus(),

                    _bodyTopSection(),
                    _bodyCompanyDetailSection(),
                    _bodyBillToSection(),
                    _bodyServiceSection(),
                    _bodyDateSection(title: "date_space", value: " 16-08-2025"),
                    _bodyDateSection(title: "total_space", value: " 250A/-"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topHeaderByStatus() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Row(
            children: [
              Icon(Icons.receipt_long, size: 20, color: AppStyles.primaryColor),
              SizedBox(width: 8),
              textSemiBold(text: "Estimate".tr(), fontSize: 16),

              Spacer(),

              if (widget.status == "rejected") _modifyButton(),
            ],
          ),
        ),
        SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(color: AppStyles.greyDE),
        ),
        SizedBox(height: 10),

        /// Status Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _statusButton(widget.status ?? ""),
        ),
      ],
    );
  }

  Widget _modifyButton() {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'acEstimateEditMore',
          extra: {'status': widget.status},
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: AppStyles.lightBlueEB,
          borderRadius: BorderRadius.circular(8),
        ),
        child: textSemiBold(
          text: "modify".tr(),
          fontSize: 14,
          fontColor: AppStyles.blue2F,
        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: textRegular(
                    text: "Est number".tr(),
                    fontSize: 12,
                    fontColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            textRegular(
              text: "${"bill_date_label".tr()} 12-07-2025",
              fontSize: 14,
              fontColor: AppStyles.grey66,
            ),
            SizedBox(height: 6),
            textRegular(
              text: "${"due_date_label".tr()} 30-10-2025",
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
              text: "${"company_phone".tr()}+12345678888",
              fontSize: 14,
            ),
            SizedBox(height: 2),
            textRegular(
              text: "${"company_email".tr()}info@demo.company",
              fontSize: 14,
            ),
            SizedBox(height: 2),
            textRegular(
              text: "${"company_website".tr()}http://www.democompany.com",
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
                textBold(text: "bill_to_label".tr(), fontSize: 18),
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
            textBold(text: "service".tr(), fontSize: 18),
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

  Widget _statusButton(String status) {
    Color bgColor;
    Color textColor;
    String label;
    IconData? icon;

    switch (status) {
      case "approved":
        bgColor = AppStyles.greenCC;
        textColor = AppStyles.green59;
        label = "Approved";
        icon = null;
        break;

      case "pending":
        bgColor = const Color(0x21FF6919);
        textColor = const Color(0xFFFF6919);
        label = "Pending";
        icon = null;
        break;

      case "rejected":
        bgColor = AppStyles.redD9;
        textColor = AppStyles.redColor3F;
        label = "Rejected Remark";
        break;

      default:
        bgColor = AppStyles.greyDE;
        textColor = Colors.black;
        label = status;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: textColor),
            SizedBox(width: 6),
          ],
          textRegular(
            text: label,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontColor: textColor,
          ),
        ],
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
            textBold(text: title.tr(), fontSize: 18),
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
          'DigiVawlt',
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
