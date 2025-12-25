import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_common_text.dart';
import '../../../../core/constants/theme.dart';
import '../../../../widgets/common_search_bar_widget.dart';

class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key});

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> myData = [
    {
      "title": "Invoice #1245",
      "date": "08 Apr 2025",
      "status": "Approved",
      "bgColor": AppStyles.lightGreenE6,
      "textColor": AppStyles.green2E,
    },
    {
      "title": "Estimate #5421",
      "date": "06 Apr 2025",
      "status": "Pending",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orange20,
    },
    {
      "title": "Proposal #7896",
      "date": "05 Apr 2025",
      "status": "Rejected",
      "bgColor": AppStyles.lightRedFD,
      "textColor": AppStyles.redColor3F,
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: "Live Tracking"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CommonSearchBar(),
              SizedBox(height: 20),
              CommonDivider(),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.topLeft,
                child: textSemiBold(
                  text: "Task Management",
                  fontSize: 20,
                  fontColor: AppStyles.textBlack,
                ),
              ),
              SizedBox(height: 12),
              _tableView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableView() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppStyles.greyDE), // outer border
        borderRadius: BorderRadius.circular(3),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(AppStyles.lightBlueEB),
          headingRowHeight: 35,
          border: TableBorder.all(
            color: AppStyles.greyDE, // vertical + horizontal lines
            width: 1,
          ),
          columns: [
            DataColumn(label: textMedium(text: "Document Title", fontSize: 12)),
            DataColumn(label: textMedium(text: "Date", fontSize: 12)),
            DataColumn(label: textMedium(text: "Status", fontSize: 12)),
            DataColumn(label: textMedium(text: "Action", fontSize: 12)),
          ],
          rows: myData.map((row) {
            return _buildRow(
              row["title"],
              row["date"],
              row["status"],
              row["bgColor"],
              row["textColor"],
              context, // Pass context
            );
          }).toList(),
        ),
      ),
    );
  }

  static DataRow _buildRow(
    String title,
    String date,
    String status,
    Color bg,
    Color textColor,
    BuildContext context, //  context
  ) {
    return DataRow(
      cells: [
        DataCell(textRegular(text: title, fontSize: 12)),
        DataCell(textRegular(text: date, fontSize: 12)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: textSemiBold(
              text: status,
              fontSize: 12,
              fontColor: textColor,
            ),
          ),
        ),
        DataCell(
          GestureDetector(
            onTap: () {
              context.push(
                '/bd_livetracking_actions_screen',
                extra: {'title': title, 'status': status},
              );
            },
            child: Container(
              height: 24,
              width: 24,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppStyles.lightBlueEB,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                CupertinoIcons.eye,
                color: AppStyles.primaryColor,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
