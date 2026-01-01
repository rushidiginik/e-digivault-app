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

class FlowestimateStateHeadScreenAc extends StatefulWidget {
  const FlowestimateStateHeadScreenAc({super.key});

  @override
  State<FlowestimateStateHeadScreenAc> createState() =>
      _FlowestimateStateHeadScreenAcState();
}

class _FlowestimateStateHeadScreenAcState
    extends State<FlowestimateStateHeadScreenAc> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  DateTime? selectedDate;

  final LayerLink _serviceLink = LayerLink();
  OverlayEntry? _serviceOverlay;
  String? selectedService;
  bool isServiceOpen = false;

  // ---- TRANSACTION TYPE ----
  final LayerLink _typeLink = LayerLink();
  OverlayEntry? _typeOverlay;
  String? selectedTransactionType;
  bool isTypeOpen = false;

  // ---- TRANSACTION MODE ----
  final LayerLink _modeLink = LayerLink();
  OverlayEntry? _modeOverlay;
  String? selectedTransactionMode;
  bool isModeOpen = false;

  @override
  void dispose() {
    _serviceOverlay?.remove();
    _typeOverlay?.remove();
    _modeOverlay?.remove();
    super.dispose();
  }

  final List<Map<String, dynamic>> serviceData = [
    {
      "estimateId": "Estimate #1",
      "mainService": "DP- Office",
      "subService": "E-katha",
      "office": "DP- Office",
      "documentName": "khatha Correction",
      "date": "08 Apr 2025",
      "requestBy": "in-charge Pending",
      "requestStatus": "DC-Kumar",
      "amount": "₹20,000/-",
      "status": "Pending",
      "action": "View",
    },

    {
      "estimateId": "Estimate #2",
      "mainService": "DP- Office",
      "subService": "E-katha",
      "office": "DP- Office",
      "documentName": "khatha Correction",
      "date": "08 Apr 2025",
      "requestBy": "in-charge Pending",
      "requestStatus": "DC-Kumar",
      "amount": "₹20,000/-",
      "status": "Approved",
      "action": "View",
    },

    {
      "estimateId": "Estimate #3",
      "mainService": "DP- Office",
      "subService": "E-katha",
      "office": "DP- Office",
      "documentName": "khatha Correction",
      "date": "08 Apr 2025",
      "requestBy": "in-charge Pending",
      "requestStatus": "DC-Kumar",
      "amount": "₹20,000/-",
      "status": "Rejected",
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
        appBar: CommonHeader(title: 'State Head', showBack: true),
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
                ImageConst.expenditureicon,
                height: 20,
                width: 20,
                color: AppStyles.primaryColor,
              ),
              const SizedBox(width: 8),
              textSemiBold(text: "Estimates".tr(), fontSize: 16),
            ],
          ),
        ),
        Divider(height: 12, color: AppStyles.greyDE, indent: 14, endIndent: 14),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _dateFilter(),
                const SizedBox(width: 8),
                _serviceDropdown(),
                const SizedBox(width: 8),
                _transactionTypeDropdown(),
                const SizedBox(width: 8),
                _transactionModeDropdown(),
              ],
            ),
          ),
        ),
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
                width: 90,
                child: textMedium(text: "Estimate ID", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 150,
                child: textMedium(text: "Main Service", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: textMedium(text: "Sub service", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: textMedium(text: "Office", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 130,
                child: textMedium(text: "Document Name", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 130,
                child: textMedium(text: "Date", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 160,
                child: textMedium(text: "Request By", fontSize: 14),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 80,
                child: textMedium(text: "Request Status", fontSize: 14),
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
                child: textMedium(text: "Status", fontSize: 14),
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
                    width: 130,
                    child: textSemiBold(text: row["estimateId"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 150,
                    child: textRegular(text: row["mainService"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 100,
                    child: textRegular(text: row["subService"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 100,
                    child: textRegular(text: row["office"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 120,
                    child: textRegular(text: row["documentName"], fontSize: 14),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 120,
                    child: textRegular(text: row["date"], fontSize: 14),
                  ),
                ),

                DataCell(
                  SizedBox(
                    width: 130,
                    child: textRegular(text: row["requestBy"], fontSize: 14),
                  ),
                ),

                DataCell(
                  SizedBox(
                    width: 80,
                    child: textRegular(
                      text: row["requestStatus"],
                      fontSize: 14,
                    ),
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
                    child: textRegular(text: row["status"], fontSize: 14),
                  ),
                ),

                DataCell(
                  SizedBox(
                    width: 80,
                    child: row["action"] == "View"
                        ? GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                'acServicesView',
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

  Widget _transactionTypeDropdown() {
    return _customDropdown(
      hint: "Transaction Type",
      value: selectedTransactionType,
      items: const ["Credit", "Debit"],
      onChanged: (val) {
        setState(() => selectedTransactionType = val);
      },
    );
  }

  Widget _transactionModeDropdown() {
    return _customDropdown(
      hint: "Transaction Mode",
      value: selectedTransactionMode,
      items: const ["UPI", "Cash"],
      onChanged: (val) {
        setState(() => selectedTransactionMode = val);
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
