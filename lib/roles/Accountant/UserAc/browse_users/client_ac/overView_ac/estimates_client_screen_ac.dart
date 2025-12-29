import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/app_common_text.dart';
import '../../../../../../core/constants/image_const.dart';
import '../../../../../../core/constants/theme.dart';
import '../../../../../../widgets/common_header.dart';
import '../../../../../../widgets/common_search_bar_widget.dart';

class EstimatesClientScreenAc extends StatefulWidget {
  const EstimatesClientScreenAc({super.key});

  @override
  State<EstimatesClientScreenAc> createState() =>
      _EstimatesClientScreenAcState();
}

class _EstimatesClientScreenAcState extends State<EstimatesClientScreenAc> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> serviceData = [
    {
      "estimatesId": "Estimate#01",
      "item": "E-katha Certificate",
      "date": "11-09-2025",
      "amount": "₹2,500",
      "transactionId": "TXN12345",
      "status": "Active",
      "action": "View",
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Estimate', showBack: true),
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
              textSemiBold(text: "Estimate".tr(), fontSize: 16),
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
                child: textMedium(text: "Estimates ID", fontSize: 14),
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
                    child: textSemiBold(text: row["estimatesId"], fontSize: 14),
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
                    child: textRegular(text: row["action"], fontSize: 14),
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
