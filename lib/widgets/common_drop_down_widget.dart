
import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/app_text_styles.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class CommonDropdown<T> extends StatelessWidget {
  final String label;
  final T? selectedItem;
  final List<T> items;
  final String hintText;
  final ValueChanged<T?> onChanged;
  final String Function(T)? itemAsString;
  final bool isSuffix;

  const CommonDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.selectedItem,
    this.itemAsString,
    this.isSuffix = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4),
            child: textRegular(text: label, fontSize: 16),
          ),

          /// Dropdown Container - matching TextFormField styling
          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppStyles.greyDE),
            ),
            child: DropdownSearch<T>(
              selectedItem: selectedItem,
              items: (filter, _) => items,
              itemAsString: itemAsString,

              /// Show dropdown icon on the right
              suffixProps: DropdownSuffixProps(
                clearButtonProps: ClearButtonProps(isVisible: false),
                dropdownButtonProps: DropdownButtonProps(
                  isVisible: isSuffix,
                  iconClosed: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppStyles.textBlack,
                    size: 24,
                  ),
                ),
              ),

              /// Remove default decoration underline
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    left: 8,
                    top: 10,
                    bottom: 6,
                  ),
                  hintText: hintText,
                  hintStyle: AppFontStyle.mediumTextStyle(
                    14,
                    fontColor: AppStyles.textBlack.withOpacity(0.3),
                  ),
                ),
                textAlignVertical: TextAlignVertical.center,
              ),

              /// Popup customization
              popupProps: PopupProps.menu(
                showSearchBox: true,
                fit: FlexFit.loose,
                constraints: const BoxConstraints(maxHeight: 300),
                menuProps: const MenuProps(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  backgroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: Colors.black26,
                ),

                /// Search field style
                searchFieldProps: TextFieldProps(
                  style: AppFontStyle.semiBoldTextStyle(
                    16,
                    fontColor: AppStyles.textBlack,
                  ),
                  decoration: InputDecoration(
                    hintText: "search",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    hintStyle: AppFontStyle.mediumTextStyle(
                      14,
                      fontColor: AppStyles.textBlack.withOpacity(0.3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}