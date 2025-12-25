import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';

class DocumentListScreen extends StatefulWidget {
  final String mainServiceName;
  final String subServiceName;
  final String subServiceId;

  const DocumentListScreen({
    super.key,
    required this.mainServiceName,
    required this.subServiceName,
    required this.subServiceId,
  });

  @override
  State<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  // Dummy data for documents
  final List<String> documents = [
    "Sale Deed/registered Deed",
    "Mother Deed/Parents Deed",
    "Gift Deed/Partition Deed/ will",
    "Aadhaar Card",
    "PAN Card",
    "Latest Property Tax Receipt",
    "Electricity/BESCOM connection ID",
    "Property Survey Sketch / Layout Plan",
    "Utility Bill/Address Proof",
    "Property Photographs",
    "No Objection Certificate (Noc)",
    "Encumbrance Certificate(EC)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'ServiceDocs', showBack: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: AppStyles.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppStyles.greyDE),
                ),
                child: Center(
                  child: textRegular(
                    text: "${widget.subServiceName} Documents",
                    fontSize: 16,
                    fontColor: AppStyles.textBlack,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),

              const SizedBox(height: 19),

              // Document Table Section
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppStyles.greyDE, width: 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    children: [
                      // Table Header
                      Container(
                        decoration: BoxDecoration(
                          color: AppStyles.lightBlueEB,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3),
                          ),
                        ),
                        child: Row(
                          children: [
                            // SL.NO Column Header
                            Container(
                              width: 60,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: AppStyles.greyDE,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: textMedium(
                                text: "SL.NO",
                                fontSize: 12,
                                fontColor: AppStyles.textBlack,
                              ),
                            ),
                            // Document Title Column Header
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                child: textMedium(
                                  text: "Document Title",
                                  fontSize: 12,
                                  fontColor: AppStyles.textBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Divider line
                      Container(height: 1, color: AppStyles.greyDE),

                      // Document List
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: documents.length,
                          separatorBuilder: (context, index) =>
                              Container(height: 1, color: AppStyles.greyDE),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                // Serial Number
                                Container(
                                  width: 60,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: AppStyles.greyDE,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: textRegular(
                                    text: "${index + 1}",
                                    fontSize: 12,
                                    fontColor: AppStyles.grey66,
                                  ),
                                ),
                                // Document Name
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 16,
                                    ),
                                    child: textMedium(
                                      text: documents[index],
                                      fontSize: 12,
                                      fontColor: AppStyles.textBlack,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
