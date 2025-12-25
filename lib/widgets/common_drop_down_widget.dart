import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/app_text_styles.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sizer/sizer.dart';

class CommonDropdown<T> extends StatelessWidget {
  final String label;
  final T? selectedItem;
  final List<T> items;
  final String hintText;
  final ValueChanged<T?> onChanged;
  final bool isSuffix;
  final String Function(T)? itemAsString;

  // ADD
  final bool hasError;
  final String? errorText;

  const CommonDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.selectedItem,
    this.itemAsString,
    this.isSuffix = false,

    // ADD
    this.hasError = false,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: textRegular(text: label.tr(), fontSize: 16),
          ),

          /// Dropdown container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              // RED BORDER ON ERROR
              border: Border.all(
                color: hasError ? AppStyles.redColor3F : AppStyles.greyDE,
              ),
            ),
            child: DropdownSearch<T>(
              selectedItem: selectedItem,
              items: (filter, _) => items,
              itemAsString: itemAsString,

              suffixProps: DropdownSuffixProps(
                clearButtonProps: ClearButtonProps(isVisible: false),
                dropdownButtonProps: DropdownButtonProps(isVisible: isSuffix),
              ),

              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                  hintText: hintText,
                ),
              ),

              popupProps: PopupProps.menu(
                showSearchBox: true,
                fit: FlexFit.loose,
                constraints: const BoxConstraints(maxHeight: 300),

                //  Popup container style (WHITE)
                menuProps: const MenuProps(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  backgroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: Colors.black26,
                ),

                //  Search field style
                searchFieldProps: TextFieldProps(
                  style: AppFontStyle.semiBoldTextStyle(
                    16,
                    fontColor: AppStyles.textBlack,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search...",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    hintStyle: AppFontStyle.mediumTextStyle(
                      14,
                      fontColor: AppStyles.textBlack.withValues(alpha: 0.3),
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

          // ERROR TEXT
          if (hasError && errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 4),
              child: Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
