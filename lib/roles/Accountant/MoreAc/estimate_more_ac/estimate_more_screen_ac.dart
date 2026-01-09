import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_common_text.dart';
import '../../../../core/constants/image_const.dart';
import '../../../../core/constants/theme.dart';
import '../../../../widgets/common_header.dart';
import '../../../../widgets/common_search_bar_widget.dart';

class EstimateMoreScreenAc extends StatefulWidget {
  final Widget icon;
  final String title;

  const EstimateMoreScreenAc({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  State<EstimateMoreScreenAc> createState() => _EstimateMoreScreenAcState();
}

class _EstimateMoreScreenAcState extends State<EstimateMoreScreenAc> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int selectedIndex = 0;

  final List<String> options = ["pending", "Approved", "Rejected"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Estimate', showBack: true),
        body: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CommonSearchBar(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(child: _tabControllerSection()),
                  SliverToBoxAdapter(
                    child: [
                      _girdDataSection(10),
                      _girdDataSection(2),
                      _girdDataSection(4),
                    ][selectedIndex],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabControllerSection() {
    return Column(
      children: [
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 133),
            backgroundColor: AppStyles.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          onPressed: () {
            context.pushNamed('acCreateInvoice');
          },
          child: Text(
            "Create Estimate",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
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
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppStyles.whiteColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: textSemiBold(
                      text: options[index].tr(),
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

  Widget _girdDataSection(length) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: length,
        shrinkWrap: true,
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.80,
        ),
        itemBuilder: (context, index) {
          return gridItem(
            imageUrl: ImageConst.invoicePNG,
            label: "Estimate #${index + 1}",
            onTap: () {
              context.pushNamed(
                'acEstimateMoreView',
                extra: {'status': options[selectedIndex].toLowerCase()},
              );
            },
          );
        },
      ),
    );
  }

  Widget gridItem({
    required String imageUrl,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: size.height * 0.20,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              color: AppStyles.lightBlueF4,
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          Container(
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),

            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(child: widget.icon),
                  ),
                  SizedBox(width: 6),
                  textSemiBold(
                    text: label,
                    fontSize: 16,
                    fontColor: AppStyles.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
