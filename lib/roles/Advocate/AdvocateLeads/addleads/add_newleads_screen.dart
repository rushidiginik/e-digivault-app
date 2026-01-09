import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/utils/alert_utils.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/text_form_field_widget/text_container_const2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddNewLeadScreen extends StatefulWidget {
  const AddNewLeadScreen({super.key});

  @override
  State<AddNewLeadScreen> createState() => _AddNewLeadScreenState();
}

class _AddNewLeadScreenState extends State<AddNewLeadScreen> {
  late Size size;
  int selectedTabIndex = 0; // 0: Personal, 1: Organization, 2: Service

  final List<String> tabOptions = ["Personal", "Organization", "Service"];

  // Controllers for Personal Details
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController panController = TextEditingController();

  // Controllers for Organization Details
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController orgAddressController = TextEditingController();
  final TextEditingController establishmentDateController =
      TextEditingController();
  final TextEditingController orgTypeController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownershipStatusController =
      TextEditingController();

  // Service selection
  List<String> availableServices = [
    'Revenue Records',
    'Business Records',
    'Personal Records',
  ];

  final Map<String, bool> expandedServices = {
    'Revenue Records': false,
    'Business Records': false,
    'Personal Records': false,
  };

  Map<String, bool> selectedServices = {
    'Revenue Records': false,
    'Business Records': false,
    'Personal Records': false,
  };

  final Map<String, List<String>> serviceItems = {
    'Revenue Records': ['E-Katha', 'Building Plan', 'Assessment Book'],
    'Business Records': ['MOV Certificate', 'Tax Receipt', 'Trade License'],
    'Personal Records': ['Ration Card', 'Passport', 'Birth Certificate'],
  };

  final Map<String, Map<String, bool>> selectedServiceItems = {
    'Revenue Records': {},
    'Business Records': {},
    'Personal Records': {},
  };

  String? selectedState;
  String? selectedDistrict;
  String? selectedTaluk;
  String? selectedCity;

  final List<String> states = [
    'Karnataka',
    'Maharashtra',
    'Tamil Nadu',
    'Kerala',
  ];
  final List<String> districts = ['Bengaluru Urban', 'Mysuru', 'Mangaluru'];
  final List<String> taluks = ['Bengaluru North', 'Bengaluru South', 'Anekal'];
  final List<String> cities = ['Bengaluru', 'Mysuru', 'Mangaluru'];

  @override
  void dispose() {
    // Dispose all controllers
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    whatsappController.dispose();
    addressController.dispose();
    stateController.dispose();
    districtController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    aadhaarController.dispose();
    panController.dispose();
    orgNameController.dispose();
    orgAddressController.dispose();
    establishmentDateController.dispose();
    orgTypeController.dispose();
    ownerNameController.dispose();
    ownershipStatusController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppStyles.primaryColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        establishmentDateController.text = DateFormat(
          'dd MMM yyyy',
        ).format(picked);
      });
    }
  }

  void _handleNext() {
    if (selectedTabIndex < 2) {
      setState(() {
        selectedTabIndex++;
      });
    } else {
      // Save lead
      _saveLead();
    }
  }

  void _handleSkip() {
    if (selectedTabIndex < 2) {
      setState(() {
        selectedTabIndex++;
      });
    }
  }

  void _saveLead() {
    AlertUtils.showSuccessDialog(
      context: context,
      title: "Success",
      message: "Lead has been saved waiting for approval",
      autoCloseSeconds: 2,
      onDismiss: () {
        // Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Lead', showBack: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _headerSection(),
                  const SizedBox(height: 24),
                  _radioButtonSection(),
                  const SizedBox(height: 24),
                  _buildCurrentTab(),
                ],
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _headerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          textMedium(
            text: "Add New Lead",
            fontSize: 14,
            fontColor: AppStyles.textBlack,
          ),
          const SizedBox(height: 10),
          CommonDivider(),
          const SizedBox(height: 10),
          // Photo Upload Section
          Stack(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppStyles.greyF5,
                  image: DecorationImage(
                    image: AssetImage(ImageConst.manProfileJPG),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppStyles.whiteColor,
                    borderRadius: BorderRadius.circular(8),

                    border: Border.all(color: AppStyles.primaryColor, width: 1),
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppStyles.primaryColor,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          textMedium(
            text: "Upload Photo",
            fontSize: 16,
            fontColor: AppStyles.textBlack,
          ),
        ],
      ),
    );
  }

  Widget _radioButtonSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabOptions.length, (index) {
          final isSelected = selectedTabIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTabIndex = index;
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Color(0xff7749F8) : AppStyles.grey66,
                      width: 1,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff7749F8),
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                textRegular(
                  text: tabOptions[index],
                  fontSize: 16.sp,
                  fontColor: AppStyles.textBlack,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCurrentTab() {
    switch (selectedTabIndex) {
      case 0:
        return _personalDetailsTab();
      case 1:
        return _organizationDetailsTab();
      case 2:
        return _serviceTab();
      default:
        return _personalDetailsTab();
    }
  }

  Widget _personalDetailsTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textMedium(
            text: "Personal Details",
            fontSize: 16.sp,
            fontColor: AppStyles.grey66,
          ),
          Divider(color: AppStyles.greyDE),
          const SizedBox(height: 8),
          _buildTextField(
            label: "Full Name",
            controller: fullNameController,
            hint: "Rajesh Kumar",
          ),
          _buildTextField(
            label: "Email",
            controller: emailController,
            hint: "rajeshkumar@gmail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          _buildTextField(
            label: "Phone No",
            controller: phoneController,
            hint: "+91 9400 8132 21",
            keyboardType: TextInputType.phone,
          ),
          _buildTextField(
            label: "WhatsApp No",
            controller: whatsappController,
            hint: "+91 9400 8132 21",
            keyboardType: TextInputType.phone,
          ),
          _buildTextField(
            label: "Address",
            controller: addressController,
            hint:
                "34, TechPark Lane, Koramangala, Bangalore, Karnataka - 560034",
            maxLines: 3,
          ),
          _buildDropdownField(
            label: "State",
            value: selectedState,
            items: states,
            hint: "Karnataka",
            onChanged: (value) {
              setState(() {
                selectedState = value;
              });
            },
          ),
          _buildDropdownField(
            label: "District",
            value: selectedDistrict,
            items: districts,
            hint: "Bengaluru Urban",
            onChanged: (value) {
              setState(() {
                selectedDistrict = value;
              });
            },
          ),
          _buildDropdownField(
            label: "Taluk",
            value: selectedTaluk,
            items: taluks,
            hint: "Bengaluru North",
            onChanged: (value) {
              setState(() {
                selectedTaluk = value;
              });
            },
          ),
          _buildDropdownField(
            label: "City",
            value: selectedCity,
            items: cities,
            hint: "Bengaluru",
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
            },
          ),
          _buildTextField(
            label: "Pincode",
            controller: pincodeController,
            hint: "560034",
            keyboardType: TextInputType.number,
          ),
          _buildTextField(
            label: "Aadhar No",
            controller: aadhaarController,
            hint: "9400 9139 0123",
            keyboardType: TextInputType.number,
          ),
          _buildTextField(
            label: "Pan No",
            controller: panController,
            hint: "OHAPS5722P",
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _organizationDetailsTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textMedium(
            text: "Organization Details",
            fontSize: 16.sp,
            fontColor: AppStyles.grey66,
          ),
          Divider(color: AppStyles.greyDE),
          const SizedBox(height: 8),
          _buildTextField(
            label: "Organisation Name",
            controller: orgNameController,
            hint: "Online Solutions Pvt. Ltd",
          ),
          _buildTextField(
            label: "Registered Office Address",
            controller: orgAddressController,
            hint:
                "34, TechPark Lane, Koramangala, Bangalore, Karnataka - 560034",
            maxLines: 3,
          ),
          _buildDateField(
            label: "Date of Establishment",
            controller: establishmentDateController,
            hint: "12 March 2017",
          ),
          _buildTextField(
            label: "Type of Organisation",
            controller: orgTypeController,
            hint: "Private Limited Company",
          ),
          _buildTextField(
            label: "Name of the Owner",
            controller: ownerNameController,
            hint: "Rajesh Kumar",
          ),
          _buildTextField(
            label: "Ownership Status",
            controller: ownershipStatusController,
            hint: "Individual Business",
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _serviceTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textMedium(
            text: "Select Services",
            fontSize: 16.sp,
            fontColor: AppStyles.grey66,
          ),
          const SizedBox(height: 16),
          ...availableServices.map((service) {
            return _buildServiceCheckbox(service);
          }).toList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textRegular(
            text: label,
            fontSize: 14.sp,
            fontColor: AppStyles.textBlack,
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: TextStyle(fontSize: 13.sp, color: AppStyles.textBlack),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 13.sp, color: AppStyles.grey66),
              filled: true,
              fillColor: AppStyles.whiteColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: maxLines > 1 ? 12 : 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppStyles.greyDE, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppStyles.greyDE, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppStyles.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textRegular(
            text: label,
            fontSize: 14.sp,
            fontColor: AppStyles.textBlack,
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              color: AppStyles.whiteColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppStyles.greyDE, width: 1),
            ),
            child: DropdownButtonFormField<String>(
              value: value,
              hint: Text(
                hint,
                style: TextStyle(fontSize: 13.sp, color: AppStyles.grey66),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: TextStyle(fontSize: 13.sp, color: AppStyles.textBlack),
              dropdownColor: AppStyles.whiteColor,
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppStyles.grey66,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textRegular(
            text: label,
            fontSize: 14.sp,
            fontColor: AppStyles.textBlack,
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            readOnly: true,
            onTap: () => _selectDate(context),
            style: TextStyle(fontSize: 13.sp, color: AppStyles.textBlack),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 13.sp, color: AppStyles.grey66),
              filled: true,
              fillColor: AppStyles.whiteColor,
              suffixIcon: Icon(
                Icons.calendar_today,
                color: AppStyles.grey66,
                size: 18,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppStyles.greyDE, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppStyles.greyDE, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppStyles.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCheckbox(String service) {
    final bool isChecked = selectedServices[service] ?? false;
    final bool isExpanded = expandedServices[service] ?? false;

    return Container(
      // margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          // HEADER ROW
          InkWell(
            onTap: () {
              setState(() {
                selectedServices[service] = !isChecked;
                expandedServices[service] = !isChecked;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        selectedServices[service] = value ?? false;
                        expandedServices[service] = value ?? false;
                      });
                    },
                    activeColor: AppStyles.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: textMedium(
                      text: service,
                      fontSize: 14.sp,
                      fontColor: AppStyles.textBlack,
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),

          // EXPANDED CONTENT
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _buildServiceItems(service),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItems(String service) {
    final items = serviceItems[service] ?? [];

    return Column(
      children: items.map((item) {
        final isSelected = selectedServiceItems[service]?[item] ?? false;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    selectedServiceItems[service] ??= {};
                    selectedServiceItems[service]![item] = value ?? false;
                  });
                },
                activeColor: AppStyles.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                child: textRegular(
                  text: item,
                  fontSize: 13.sp,
                  fontColor: AppStyles.textBlack,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppStyles.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          // Skip button ONLY for Organization tab (index 1)
          if (selectedTabIndex == 1)
            Expanded(
              child: SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: _handleSkip,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppStyles.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: textSemiBold(
                    text: "Skip",
                    fontSize: 16,
                    fontColor: AppStyles.primaryColor,
                  ),
                ),
              ),
            ),

          // Spacing ONLY when Skip is visible
          if (selectedTabIndex == 1) const SizedBox(width: 16),

          // Primary button (Next / Save)
          Expanded(
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _handleNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: textSemiBold(
                  text: selectedTabIndex == 2 ? "Save" : "Next",
                  fontSize: 16,
                  fontColor: AppStyles.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
