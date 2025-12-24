import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/common_drop_down_widget.dart';
import 'package:e_digivault_org_app/widgets/text_form_field_widget/text_form_field_const.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';

class AddLeadScreen extends StatefulWidget {
  const AddLeadScreen({super.key});

  @override
  State<AddLeadScreen> createState() => _AddLeadScreenState();
}

class _AddLeadScreenState extends State<AddLeadScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController panController = TextEditingController();

  // Organization
  final TextEditingController organizationNameController =
      TextEditingController();
  final TextEditingController registerOfcAddController =
      TextEditingController();
  final TextEditingController dateOfEstaController = TextEditingController();
  final TextEditingController typeOfOrgController = TextEditingController();
  final TextEditingController nameOfOwnController = TextEditingController();
  final TextEditingController ownShipController = TextEditingController();

  int selectedIndex = 0;

  final List<String> options = ["personal", "organisation", "service"];

  final Map<String, bool> services = {
    // Revenue -> E-Katha group
    "BBMP E-Khatha": false,
    "BBMP New Khatha Registration": false,
    "Khatha Correction": false,
    // Revenue other
    "Building Plan": false,
    "Assessment Book": false,
    // Business
    "MOV Certificate": false,
    "Tax Receipt": false,
    "Trade License": false,
    // Personal
    "Ration Card": false,
    "Passport": false,
    "Birth Certificate": false,
  };

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
            SliverToBoxAdapter(child: _topContainerSection()),
            SliverToBoxAdapter(child: _tabControllerSection()),

            SliverToBoxAdapter(
              child: [
                _personalDetailsSection(),
                _organisationSection(),
                _serviceSection(),
              ][selectedIndex],
            ),
            SliverToBoxAdapter(child: _buttonSection()),
          ],
        ),
      ),
    );
  }

  Widget _topContainerSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: size.width * 0.30,
      ),
      child: ClipOval(
        child: Container(
          width: size.width * 0.40,
          height: size.height * 0.20,
          color: AppStyles.whiteColor,
          child: Image.asset(ImageConst.manProfileJPG),
        ),
      ),
    );
  }

  Widget _tabControllerSection() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(options.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                // setState(() {
                //   selectedIndex = index;
                // });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: index,
                    groupValue: selectedIndex,
                    activeColor: AppStyles.primaryColor,
                    onChanged: (val) {
                      // setState(() {
                      //   selectedIndex = index;
                      // });
                    },
                  ),
                  textSemiBold(
                    text: options[index],
                    fontSize: 16,
                    fontColor: isSelected
                        ? AppStyles.primaryColor
                        : AppStyles.black33,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _personalDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          textSemiBold(
            text: "personal_details",
            fontSize: 16,
            fontColor: AppStyles.grey66,
          ),
          Divider(color: AppStyles.greyDE),
          TextFormFieldOnlyConst(
            labelTitle: "full_name",
            controller: nameController,
            type: 'name',
            hint: 'enter_full_name',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "email",
            controller: emailController,
            type: 'email',
            hint: 'enter_email',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "phone_no",
            controller: phoneController,
            type: 'phone',
            hint: 'enter_phone_no',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "whatsapp_no",
            controller: whatsappController,
            type: 'phone',
            hint: 'enter_whatsapp_no',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "address",
            controller: addressController,
            type: 'name',
            hint: 'enter_address',
          ),
          CommonDropdown(
            label: "state",
            selectedItem: "Select state",
            items: ["Gujarat", "Maharastra", "Rajsthan"],
            hintText: "Gujarat",
            onChanged: (val) {},
          ),
          CommonDropdown(
            label: "district",
            selectedItem: "Select disctrict",
            items: ["Gujarat", "Maharastra", "Rajsthan"],
            hintText: "Gujarat",
            onChanged: (val) {},
          ),
          CommonDropdown(
            label: "taluk",
            selectedItem: "Select taluka",
            items: ["Gujarat", "Maharastra", "Rajsthan"],
            hintText: "Gujarat",
            onChanged: (val) {},
          ),
          CommonDropdown(
            label: "city",
            selectedItem: "Select city",
            items: ["Gujarat", "Maharastra", "Rajsthan"],
            hintText: "Gujarat",
            onChanged: (val) {},
          ),
          TextFormFieldOnlyConst(
            labelTitle: "pincode",
            controller: nameController,
            type: 'name',
            hint: 'enter_full_name',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "aadhaar_no",
            controller: nameController,
            type: 'name',
            hint: 'enter_full_name',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "pan_no",
            controller: nameController,
            type: 'name',
            hint: 'enter_full_name',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _organisationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          textSemiBold(
            text: "organization_details",
            fontSize: 16,
            fontColor: AppStyles.grey66,
          ),
          Divider(color: AppStyles.greyDE),
          TextFormFieldOnlyConst(
            labelTitle: "organization_name",
            controller: organizationNameController,
            type: 'name',
            hint: 'enter_organization_name',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "registered_office_address",
            controller: registerOfcAddController,
            type: 'name',
            hint: 'enter_registered_office_address',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "date_of_establishment",
            controller: dateOfEstaController,
            type: 'name',
            hint: 'enter_date_of_establishment',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "type_of_organisation",
            controller: typeOfOrgController,
            type: 'name',
            hint: 'enter_type_of_organisation',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "name_of_the_owner",
            controller: nameOfOwnController,
            type: 'name',
            hint: 'enter_name_of_the_owner',
          ),
          TextFormFieldOnlyConst(
            labelTitle: "ownership_status",
            controller: ownShipController,
            type: 'name',
            hint: 'enter_ownership_status',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _serviceSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: AppStyles.greyDE, spreadRadius: 2, blurRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: textRegular(text: "Select Services", fontSize: 16),
              ),
              _inputWidget(),
            ],
          ),
        ),
      ),
    );
  }

  /// Service

  Widget _inputWidget() {
    return Column(
      children: [
        buildCheckableExpansion(
          title: "Revenue Records",
          childKeys: [
            "BBMP E-Khatha",
            "BBMP New Khatha Registration",
            "Khatha Correction",
            "Building Plan",
            "Assessment Book",
          ],
          children: [
            buildCheckableExpansion(
              title: "E-Katha",
              childKeys: [
                "BBMP E-Khatha",
                "BBMP New Khatha Registration",
                "Khatha Correction",
              ],
              children: [
                buildCompactCheckBox("BBMP E-Khatha"),
                buildCompactCheckBox("BBMP New Khatha Registration"),
                buildCompactCheckBox("Khatha Correction"),
              ],
            ),
            buildCompactCheckBox("Building Plan"),
            buildCompactCheckBox("Assessment Book"),
          ],
        ),

        // Business Records
        buildCheckableExpansion(
          title: "Business Records",
          childKeys: ["MOV Certificate", "Tax Receipt", "Trade License"],
          children: [
            buildCompactCheckBox("MOV Certificate"),
            buildCompactCheckBox("Tax Receipt"),
            buildCompactCheckBox("Trade License"),
          ],
        ),

        // Personal Records
        buildCheckableExpansion(
          title: "Personal Records",
          childKeys: ["Ration Card", "Passport", "Birth Certificate"],
          children: [
            buildCompactCheckBox("Ration Card"),
            buildCompactCheckBox("Passport"),
            buildCompactCheckBox("Birth Certificate"),
          ],
        ),
      ],
    );
  }

  Widget buildCheckableExpansion({
    required String title,
    required List<Widget> children,
    required List<String> childKeys, // keys in `services` to toggle
  }) {
    return StatefulBuilder(
      builder: (context, setInnerState) {
        return ExpansionTile(
          title: Row(
            children: [
              Checkbox(
                value: _isParentChecked(childKeys),
                // fillColor: WidgetStateProperty.all(AppStyles.primaryColor),
                activeColor: AppStyles.primaryColor,
                onChanged: (value) {
                  setState(() {
                    for (var key in childKeys) {
                      services[key] = value ?? false;
                    }
                  });
                  setInnerState(() {});
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: const EdgeInsets.only(left: 20),
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
          children: children,
        );
      },
    );
  }

  Widget buildCompactCheckBox(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          services[title] = !(services[title] ?? false);
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: services[title],
            activeColor: AppStyles.primaryColor,
            onChanged: (value) {
              setState(() {
                services[title] = value ?? false;
              });
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          Text(title, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  bool _isParentChecked(List<String> keys) {
    // parent is checked only if all children are checked
    return keys.every((key) => services[key] == true);
  }

  Widget _buttonSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 25),
      child: selectedIndex == 2
          ? Align(
              alignment: Alignment.bottomRight,
              child: ButtonWidget(
                onTap: () {},
                title: easy.tr("save"),
                width: size.width * 0.35,
                // icons: Icons.description,
              ),
            )
          : selectedIndex == 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  title: easy.tr("skip"),
                  width: size.width * 0.35,
                  // icons: Icons.description,
                ),
                ButtonWidget(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  title: easy.tr("next"),
                  width: size.width * 0.35,
                  // icons: Icons.description,
                ),
              ],
            )
          : ButtonWidget(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              title: easy.tr("next"),
              // icons: Icons.description,
            ),
    );
  }
}
