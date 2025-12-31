import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../core/constants/app_common_text.dart';
import '../../../../../../../core/constants/image_const.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../../../widgets/common_search_bar_widget.dart';

class InvoiceClientScreenAc extends StatefulWidget {
  const InvoiceClientScreenAc({super.key});

  @override
  State<InvoiceClientScreenAc> createState() => _InvoiceClientScreenAcState();
}

class _InvoiceClientScreenAcState extends State<InvoiceClientScreenAc> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> serviceData = [
    {
      "invoiceId": "Invoice#01",
      "item": "GAP-0405",
      "date": "08 Apr 2025",
      "amount": "20,000/-",
      "transactionId": "HJY4563867",
      "status": "Paid",
      "action": "View",
    },

    {
      "invoiceId": "Invoice#02",
      "item": "GAP-0405",
      "date": "08 Apr 2025",
      "amount": "20,000/-",
      "transactionId": "HJY4563867",
      "status": "Pending",
      "action": "-",
    },
    {
      "invoiceId": "Invoice#03",
      "item": "GAP-0405",
      "date": "08 Apr 2025",
      "amount": "20,000/-",
      "transactionId": "HJY4563867",
      "status": "Pending",
      "action": "-",
    },
    {
      "invoiceId": "Invoice#04",
      "item": "GAP-0405",
      "date": "08 Apr 2025",
      "amount": "20,000/-",
      "transactionId": "HJY4563867",
      "status": "Pending",
      "action": "-",
    },

    {
      "invoiceId": "Invoice#05",
      "item": "GAP-0405",
      "date": "08 Apr 2025",
      "amount": "20,000/-",
      "transactionId": "HJY4563867",
      "status": "Pending",
      "action": "-",
    },

    {
      "invoiceId": "Invoice#06",
      "item": "GAP-0405",
      "date": "08 Apr 2025",
      "amount": "20,000/-",
      "transactionId": "HJY4563867",
      "status": "Pending",
      "action": "-",
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Invocie', showBack: true),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: _topContainerSection()),
            SliverToBoxAdapter(child: _datatableViewSection()),
          ],
        ),
      ),
    );
  }

  Widget _topContainerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CommonSearchBar(),
        ),
        SizedBox(height: 6.h),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              SvgPicture.asset(
                ImageConst.esttimicone,
                height: 20,
                width: 20,
                color: AppStyles.primaryColor,
              ),
              const SizedBox(width: 8),
              textSemiBold(text: "Invocie".tr(), fontSize: 16),
            ],
          ),
        ),
        Divider(height: 12, color: AppStyles.greyDE, indent: 14, endIndent: 14),
      ],
    );
  }

  Widget _datatableViewSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(AppStyles.lightBlueEB),
          border: TableBorder.all(color: AppStyles.greyDE),
          headingRowHeight: 45,
          columns: [
            DataColumn(
              label: SizedBox(
                width: 50,
                child: textMedium(text: "Invoice ID", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 150,
                child: textMedium(text: "Item ", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: textMedium(text: "Date", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: textMedium(text: "Amount", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 120,
                child: textMedium(text: "Transaction ID", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 80,
                child: textMedium(text: "Status", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 80,
                child: textMedium(text: "Amount", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 80,
                child: textMedium(text: "Action", fontSize: 14),
              ),
            ),
          ],
          rows: serviceData.map((row) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 50,
                    child: textSemiBold(text: row["invoiceId"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 150,
                    child: textRegular(text: row["item"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 100,
                    child: textRegular(text: row["date"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 100,
                    child: textRegular(text: row["amount"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 120,
                    child: textRegular(
                      text: row["transactionId"],
                      fontSize: 14,
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 80,
                    child: textRegular(text: row["status"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 80,
                    child: textRegular(text: row["amount"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 80,
                    child: row["action"] == "View"
                        ? GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                'acInvoiceView',
                                extra: row["status"], // "Paid" / "Pending"
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: AppStyles.lightBlueEB,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 16,
                                    color: AppStyles.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : textRegular(text: "-", fontSize: 14),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
