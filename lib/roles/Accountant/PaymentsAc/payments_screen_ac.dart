import 'package:e_digivault_org_app/widgets/donut_summary_card_ac.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_common_text.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/constants/theme.dart';
import '../../../widgets/common_header.dart';

class PaymentsScreenAc extends StatefulWidget {
  const PaymentsScreenAc({super.key});

  @override
  State<PaymentsScreenAc> createState() => _PaymentsScreenAcState();
}

class _PaymentsScreenAcState extends State<PaymentsScreenAc> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  DateTime? selectedDate;
  late Size size;

  final List<Map<String, dynamic>> serviceData = [
    {
      "jobId": "JB-235673",
      "service": "E-katha",
      "task": "Online",
      "amountSpent": "25A",
    },

    {
      "jobId": "JB-235674",
      "service": "Mutation",
      "task": "BBMP",
      "amountSpent": "14A",
    },

    {
      "jobId": "JB-235675",
      "service": "Building",
      "task": "Building",
      "amountSpent": "30A",
    },
  ];

  final LayerLink _serviceLink = LayerLink();
  OverlayEntry? _serviceOverlay;
  String? selectedService;
  bool isServiceOpen = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Payments', showBack: true),
      body: Column(
        children: [
          const SizedBox(height: 9),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Colors.grey.shade300),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Row(
              children: [
                _dateFilter(),
                const SizedBox(width: 8),
                _serviceDropdown(),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DonutSummaryCardAc(
              received: 100,
              expenditure: 150,
              requests: 50,
              balance: 100,
            ),
          ),

          const SizedBox(height: 18),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            //  important
            crossAxisSpacing: 12,
            childAspectRatio: 1.6,
            padding: const EdgeInsets.symmetric(horizontal: 90),
            children: [
              _browseItem(
                svgPath: ImageConst.requesticone,
                label: "Request",
                onTap: () {
                  context.pushNamed('acRequestPayment');
                },
              ),
              _browseItem(
                svgPath: ImageConst.expenditureicon,
                label: "Expenditure",
                onTap: () {
                  context.pushNamed('acExpenditurePayment');
                },
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: const Color(0x1A000000), thickness: 2),
          ),
          SizedBox(height: 6),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _topContainerSection()),
                SliverToBoxAdapter(child: _datatableViewSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _browseItem({
    required String svgPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            svgPath,
            height: 40,
            width: 40,
            color: AppStyles.primaryColor,
          ),
          const SizedBox(height: 3),
          textRegular(
            text: label.tr(),
            textAlign: TextAlign.center,
            fontSize: 12,
          ),
        ],
      ),
    );
  }

  Widget _topContainerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              textSemiBold(text: " Recent Transactions".tr(), fontSize: 16),
            ],
          ),
        ),
        SizedBox(height: 9),
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
                width: 80,
                child: textMedium(text: "Job ID", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 60,
                child: textMedium(text: "Service", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 60,
                child: textMedium(text: "Task", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 90,
                child: textMedium(text: "Amount Spent", fontSize: 14),
              ),
            ),
          ],
          rows: serviceData.map((row) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 80,
                    child: textSemiBold(text: row["jobId"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 60,
                    child: textRegular(text: row["service"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 60,
                    child: textRegular(text: row["task"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 90,
                    child: textRegular(text: row["amountSpent"], fontSize: 14),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _dateFilter() {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );

        if (picked != null) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppStyles.greyDE),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            textRegular(
              text: selectedDate == null
                  ? "Date"
                  : DateFormat("dd-MM-yyyy").format(selectedDate!),
              fontSize: 14,
              fontColor: AppStyles.grey66,
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceDropdown() {
    return _customDropdown(
      hint: "Service",
      value: selectedService,
      items: const ["E-katha"],
      onChanged: (val) {
        setState(() => selectedService = val);
      },
    );
  }

  Widget _customDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTapDown: (TapDownDetails details) async {
            final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;

            final selected = await showMenu<String>(
              context: context,
              position: RelativeRect.fromRect(
                details.globalPosition & const Size(40, 40),
                Offset.zero & overlay.size,
              ),
              items: items
                  .map(
                    (e) => PopupMenuItem<String>(
                      value: e,
                      height: 36, // item height control
                      child: Text(e, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
            );

            if (selected != null) {
              onChanged(selected);
            }
          },
          child: SizedBox(
            width: 160,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppStyles.greyDE),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value ?? hint,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: value == null ? AppStyles.grey66 : Colors.black,
                      ),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
