import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewLeadsScreen extends StatefulWidget {
  const ViewLeadsScreen({super.key});

  @override
  State<ViewLeadsScreen> createState() => _ViewLeadsScreenState();
}

class _ViewLeadsScreenState extends State<ViewLeadsScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  //  final LeadController leadNavCtrl = Get.put(LeadController());

  int selectedIndex = 0;

  final List<String> options = ["pending", "approve", "rejected"];

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonAppBarWidget(title: "leads"),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: _tabControllerSection()),
            SliverToBoxAdapter(
              child: [
                _listSection(10),
                _listSection(2),
                _listSection(4),
              ][selectedIndex],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabControllerSection() {
    return Column(
      children: [
        Divider(height: 10, color: AppStyles.greyDE, indent: 12, endIndent: 12),
        SizedBox(height: 10),
        Center(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(options.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppStyles.whiteColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: textSemiBold(
                      text: easy.tr(options[index]),
                      fontSize: 16,
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
      ],
    );
  }

  Widget _listSection(length) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      controller: scrollController,
      padding: EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        return null;
        // ClientPageContainerHelper(
        //   onTap: leadNavCtrl.goToViewLeadDetailScreen,
        //   title: "The Professor",
        //   subTitle: "Phone No : +9178XXXXXXX45",
        //   thirdTitle: "Email : ",
        //   thirdValue: "theprofessor@gmail.com",
        //   forthTitle: "Created Date : ",
        //   forthSubTitle: "22-08-2025",
        //   isForthContainerShow: false,
        // );
      },
    );
  }
}
