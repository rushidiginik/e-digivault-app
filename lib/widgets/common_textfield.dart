
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/app_text_styles.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldConst extends StatefulWidget {
  final String labelTitle;
  final TextEditingController controller;
  final double? width;
  final String type;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChange;

  //  NEW (ADD – do not remove old)
  final ValueChanged<String>? onChanged;

  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final String hint;
  final IconData? isPrefixIcon;

  // final Widget? prefix;
  final bool isLabelNotShow;
  final double? topPadding, height;
  final int? maxLines;
  final bool? hasError;

  final String? errorText;
  final Color? bgColor;
  final Color? prefixIconColor;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  const TextFormFieldConst({
    super.key,
    required this.labelTitle,
    required this.controller,
    required this.type,
    this.keyboardType,
    this.autofillHints,
    required this.hint,
    this.inputFormatters,
    this.onChange,

    this.onChanged, //  ADD

    this.errorText,
    this.onFieldSubmitted,
    this.onSaved,
    this.readOnly,
    this.width,
    this.isPrefixIcon,
    this.isLabelNotShow = false,
    this.hasError = false,
    this.topPadding,
    this.maxLines,
    this.height,
    this.bgColor,
    this.prefixIconColor,
    this.focusNode,
    this.onTap,
    // this.prefix,
  });

  @override
  State<TextFormFieldConst> createState() => _TextFormFieldConstState();
}

class _TextFormFieldConstState extends State<TextFormFieldConst> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding ?? 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isLabelNotShow == true
              ? SizedBox(height: 0)
              : Padding(
                padding: EdgeInsets.only(
                  left: 3.0,
                  bottom: widget.topPadding ?? 4,
                ),
                child: textRegular(text: widget.labelTitle, fontSize: 16),
              ),
          Container(
            height: widget.maxLines == null ? widget.height ?? 48 : null,
            width: widget.width ?? size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    widget.hasError == true
                        ? AppStyles.redColor3F
                        : AppStyles.greyDE,
              ),
              // color: widget.bgColor ?? AppStyles.greyDE
            ),
            child: TextFormField(
              focusNode: widget.focusNode,
              onTap: widget.onTap,

              controller: widget.controller,
              autofillHints: widget.autofillHints,
              maxLines: widget.maxLines,
              textInputAction:
                  widget.maxLines == null
                      ? TextInputAction.done
                      : TextInputAction.newline,
              keyboardType:
                  widget.type == 'email'
                      ? TextInputType.emailAddress
                      : widget.keyboardType,
              // onChanged: widget.onChange,
              onChanged: widget.onChanged ?? widget.onChange,
              onFieldSubmitted: widget.onFieldSubmitted,
              onSaved: widget.onSaved,

              // textInputAction:
              // widget.isDone ? TextInputAction.done : TextInputAction.next,
              inputFormatters:
                  widget.type == 'normal'
                      ? [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z]+|\s"),
                        ),
                      ]
                      : widget.inputFormatters,
              obscuringCharacter: "*",
              style: AppFontStyle.semiBoldTextStyle(
                16,
                fontColor: AppStyles.textBlack,
              ),
              readOnly: widget.readOnly ?? false,
              decoration: InputDecoration(
                fillColor: AppStyles.transparent,
                contentPadding: EdgeInsets.only(
                  top: 10,
                  left: 8,
                  bottom: widget.isPrefixIcon == null ? 11 : 8,
                ),
                alignLabelWithHint: false,

                // label: Text(
                //   widget.textTitle,
                // ),2
                prefixIcon:
                    widget.isPrefixIcon != null
                        ? Icon(
                          widget.isPrefixIcon,
                          size: 24,
                          color: widget.prefixIconColor ?? AppStyles.textBlack,
                        )
                        : null,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                // labelStyle: AppStyles.textFormFieldTitleTextStyle,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedErrorBorder: InputBorder.none,
                // focusedBorder: InputBorder.none,
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: AppStyles.textFieldBorderColor.withOpacity(0.5),
                //   ),
                //   borderRadius: BorderRadius.zero,
                // ),
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hint,
                hintStyle: AppFontStyle.mediumTextStyle(
                  14,
                  fontColor: AppStyles.textBlack.withOpacity(0.3),
                ),
                // suffixIcon: widget.type == 'password'
                //     ? GestureDetector(
                //         child: Icon(
                //           // Based on passwordVisible state choose the icon
                //           passwordVisible
                //               ? Icons.visibility_off
                //               : Icons.visibility,
                //           color: AppStyles.white,
                //           size: 18,
                //         ),
                //         onTap: () {
                //           setState(() {
                //             passwordVisible = !passwordVisible;
                //           });
                //         },
                //       )
                //     : null,
              ),
            ),
          ),

          if (widget.hasError == true && widget.errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 6),
              child: Text(
                widget.errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}