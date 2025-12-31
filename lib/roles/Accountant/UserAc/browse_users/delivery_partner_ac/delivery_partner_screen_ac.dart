import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/theme.dart';
import '../../../../../widgets/client_page_container_helper_ac.dart';
import '../../../../../widgets/common_header.dart';
import '../../../../../widgets/common_search_bar_widget.dart';

class DeliveryPartnerScreenAc extends StatefulWidget {
  const DeliveryPartnerScreenAc({super.key});

  @override
  State<DeliveryPartnerScreenAc> createState() =>
      _DeliveryPartnerScreenAcState();
}

class _DeliveryPartnerScreenAcState extends State<DeliveryPartnerScreenAc>
    with SingleTickerProviderStateMixin {
  late Size size;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'User', showBack: true),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommonSearchBar(),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  //  Client header ab scroll karega
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const Text(
                            "Delivery Partner",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A0E0A),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Center(
                          child: Container(
                            height: 3,
                            width: 133,
                            decoration: BoxDecoration(
                              color: Color(0xFF0052CC),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  //  actual list
                  _listSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ClientPageContainerHelperAc(
          onTap: () {
            context.pushNamed('acDpOverview');
          },
          idPrefix: "CD",
          idNumber: "567894",
          roleTitle: "Delivery Partner",
          progress: "70%",
          status: "Active",
        );
      },
    );
  }
}
