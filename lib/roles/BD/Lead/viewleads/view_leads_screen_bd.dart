import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/client_page_container_helper.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/common_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewLeadsScreen extends StatefulWidget {
  const ViewLeadsScreen({super.key});

  @override
  State<ViewLeadsScreen> createState() => _ViewLeadsScreenState();
}

class _ViewLeadsScreenState extends State<ViewLeadsScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int selectedIndex = 0;

  final List<String> options = ["Approved", "Pending", "Rejected"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Leads', showBack: true),
      body: Column(
        children: [
          /// Top section with padding
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [const CommonSearchBar(), _tabControllerSection()],
            ),
          ),

          /// List section WITHOUT padding
          Expanded(
            child: [
              _listSection(10),
              _listSection(2),
              _listSection(4),
            ][selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _tabControllerSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(options.length * 2 - 1, (index) {
              if (index.isOdd) {
                return const SizedBox(width: 14); //  spacing
              }

              final itemIndex = index ~/ 2;
              final isSelected = selectedIndex == itemIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppStyles.whiteColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: textSemiBold(
                    text: options[itemIndex],
                    fontSize: 16.sp,
                    fontColor: isSelected
                        ? AppStyles.primaryColor
                        : AppStyles.whiteColor,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _listSection(length) {
    // Check if current tab is "Pending" (index 1)
    final bool isPendingTab = selectedIndex == 1;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return ClientPageContainerHelper(
          onTap: () {
            // Pass the isPending parameter to the details screen
            router.push(
              '/view_leads_details_screen',
              extra: {'isPending': isPendingTab},
            );
          },
          title: "The Professor",
          subTitle: "Phone No : 9867365240",
          thirdTitle: "Email: ",
          thirdValue: "theprofessor@gmail.com",
          forthTitle: isPendingTab ? "Status: " : "Date : ",
          forthSubTitle: isPendingTab ? "Pending for Review" : "22-08-2025",
          isForthContainerShow: isPendingTab,
        );
      },
    );
  }
}
