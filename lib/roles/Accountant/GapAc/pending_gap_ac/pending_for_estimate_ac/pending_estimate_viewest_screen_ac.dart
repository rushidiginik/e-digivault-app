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

class PendingEstimateViewestScreenAc extends StatefulWidget {
  const PendingEstimateViewestScreenAc({super.key});

  @override
  State<PendingEstimateViewestScreenAc> createState() =>
      _PendingEstimateViewestScreenAcState();
}

class _PendingEstimateViewestScreenAcState
    extends State<PendingEstimateViewestScreenAc> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> serviceData = [
    {
      "documentTitle": "E-khatha 1",
      "dateAdded": "13-05-2025",
      "viewOpinion": "View",
    },

    {
      "documentTitle": "Khatha Extract",
      "dateAdded": "13-05-2025",
      "viewOpinion": "View",
    },

    {
      "documentTitle": "E-khatha 4",
      "dateAdded": "13-05-2025",
      "viewOpinion": "View",
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Property', showBack: true),
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
                ImageConst.servicelisticon,
                height: 20,
                width: 20,
                color: AppStyles.grey,
              ),
              const SizedBox(width: 8),
              textSemiBold(text: "Service List Table".tr(), fontSize: 16),
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
                width: 109,
                child: textMedium(text: "Document Title", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: textMedium(text: "Date Added", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: textMedium(text: "View Opinion", fontSize: 14),
              ),
            ),
          ],
          rows: serviceData.map((row) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 109,
                    child: textSemiBold(
                      text: row["documentTitle"],
                      fontSize: 14,
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 100,
                    child: textRegular(text: row["dateAdded"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 100,
                    child: row["viewOpinion"] == "View"
                        ? GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                'acInvoiceView',
                                extra: row["status"], // "Paid" / "Pending"
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 34.0,
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
