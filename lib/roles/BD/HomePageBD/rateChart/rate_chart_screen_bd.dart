import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_drop_down_widget.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';

class RateChartScreen extends StatefulWidget {
  const RateChartScreen({super.key});

  @override
  State<RateChartScreen> createState() => _RateChartScreenState();
}

class _RateChartScreenState extends State<RateChartScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  final List<String> categories = [
    "Revenue Service",
    "Health Service",
    "Education Service",
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: "Rate Chart", showBack: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _categorySection(),
              _mainServiceSection(),
              _eKathaSection(),
              SizedBox(height: size.height * 0.05),
              ButtonWidget(
                onTap: () {
                  router.push('/bd_ratechart_timeline_screen');
                },
                title: "Show Rate Chart",
                width: size.width * 0.89,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categorySection() {
    return CommonDropdown(
      label: "Category",
      selectedItem: "Select category",
      items: ["Menu", "Data", "Category"],
      hintText: "revenue service",
      onChanged: (val) {},
    );
  }

  Widget _mainServiceSection() {
    return CommonDropdown(
      label: "Main Service",
      selectedItem: "Main Service",
      items: ["Menu", "Data", "Category"],
      hintText: "gram panchayat",
      onChanged: (val) {},
    );
  }

  Widget _eKathaSection() {
    return CommonDropdown(
      label: "Sub Service 1",
      selectedItem: "Select sub category",
      items: ["Menu", "Data", "Category"],
      hintText: "E-katha",
      onChanged: (val) {},
    );
  }
}
