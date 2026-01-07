import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../core/constants/app_common_text.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';

class InvoiceStateheadViewScreenAc extends StatefulWidget {
  final String? status;

  const InvoiceStateheadViewScreenAc({super.key, this.status});

  @override
  State<InvoiceStateheadViewScreenAc> createState() =>
      _InvoiceStateheadViewScreenAcState();
}

class _InvoiceStateheadViewScreenAcState
    extends State<InvoiceStateheadViewScreenAc> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Invoice', showBack: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                widget.status == "pending"
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 12),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Divider(
                              height: 5,
                              color: AppStyles.greyDE,
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.receipt_long,
                                  size: 20,
                                  color: AppStyles.primaryColor,
                                ),
                                SizedBox(width: 8),
                                textSemiBold(
                                  text: "Invoice".tr(),
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(
                              height: 5,
                              color: AppStyles.greyDE,
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),

                SizedBox(height: 1.h),
                widget.status == "pending" ? _headerSection() : SizedBox(),
                _bodyTopSection(),
                _bodyCompanyDetailSection(),
                _bodyBillToSection(),
                _bodyServiceSection(),
                _bodyDateSection(title: "date_space", value: " 16-08-2025"),
                _bodyDateSection(title: "total_space", value: " 250A/-"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerSection() {
    return Column(
      children: [
        Divider(height: 5, color: AppStyles.greyDE),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 20,
                      color: AppStyles.primaryColor,
                    ),
                    SizedBox(width: 8),
                    textSemiBold(text: "invoice".tr(), fontSize: 16),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: AppStyles.lightGreenDA,
              //     ),
              //     child: Center(
              //       child: textSemiBold(
              //         text: "send".tr(),
              //         fontSize: 14,
              //         fontColor: AppStyles.green2E,
              //       ),
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: AppStyles.lightBlueEB,
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //       child: Center(
              //         child: textSemiBold(
              //           text: "modify".tr(),
              //           fontSize: 14,
              //           fontColor: AppStyles.blue2F,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: AppStyles.lightRedFD,
              //     ),
              //     child: Center(
              //       child: textSemiBold(
              //         text: "acc modify".tr(),
              //         fontSize: 14,
              //         fontColor: AppStyles.redColor3F,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Divider(height: 5, color: AppStyles.greyDE),
      ],
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
                    text: "Inv #1".tr(),
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
                textBold(text: "bill_to".tr(), fontSize: 18),
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
