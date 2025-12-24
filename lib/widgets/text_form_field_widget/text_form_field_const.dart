import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/app_text_styles.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldConst extends StatefulWidget {
  final String labelTitle;
  final TextEditingController controller;
  final double? width;
  final String type;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChange;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final String hint;
  final bool isPrefixIcon;
  final Widget? prefix;
  final IconData? prefixIcon;
  final bool isLabelNotShow;
  final double? topPadding, height;
  final int? maxLines;
  final bool? hasError;
  final Color? bgColor;
  final bool? isObscureText;

  const TextFormFieldConst({
    super.key,
    this.isObscureText,
    required this.labelTitle,
    required this.controller,
    required this.type,
    this.keyboardType,
    this.autofillHints,
    required this.hint,
    this.inputFormatters,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.readOnly,
    this.width,
    this.prefixIcon,
    this.isLabelNotShow = false,
    this.isPrefixIcon = true,
    this.hasError = false,
    this.topPadding,
    this.maxLines,
    this.height,
    this.bgColor,
    this.prefix,
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
      padding: EdgeInsets.only(top: widget.topPadding ?? 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isLabelNotShow == true
              ? SizedBox(height: 0)
              : Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    bottom: widget.topPadding ?? 4,
                  ),
                  child: textRegular(
                    text: widget.labelTitle.tr(),
                    fontSize: 16,
                  ),
                ),
          Container(
            height: widget.maxLines == null ? widget.height ?? 48 : null,
            width: widget.width ?? size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.hasError == true
                    ? AppStyles.redColor3F
                    : AppStyles.greyDE,
              ),
            ),
            child: TextFormField(
              obscureText: widget.isObscureText ?? false,
              controller: widget.controller,
              autofillHints: widget.autofillHints,
              maxLines: widget.maxLines,
              textInputAction: widget.maxLines == null
                  ? TextInputAction.done
                  : TextInputAction.newline,
              keyboardType: widget.type == 'email'
                  ? TextInputType.emailAddress
                  : widget.keyboardType,
              onChanged: widget.onChange,
              onFieldSubmitted: widget.onFieldSubmitted,
              onSaved: widget.onSaved,
              inputFormatters:
                  widget.inputFormatters ??
                  (widget.type == 'normal'
                      ? [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          ),
                        ]
                      : widget.type == 'phone' || widget.type == 'number'
                      ? [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ]
                      : widget.type == 'alphanumeric'
                      ? [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z0-9,\-\.\s]"),
                          ),
                        ]
                      : []),
              obscuringCharacter: "*",
              style: AppFontStyle.semiBoldTextStyle(
                16,
                fontColor: AppStyles.textBlack,
              ),
              readOnly: widget.readOnly ?? false,
              decoration: InputDecoration(
                fillColor: AppStyles.transparent,
                contentPadding: const EdgeInsets.only(
                  top: 10,
                  left: 8,
                  bottom: 6,
                ),
                alignLabelWithHint: false,
                prefixIcon: widget.prefix != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: widget.prefix!,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Icon(
                          widget.isPrefixIcon
                              ? widget.prefixIcon
                              : Icons.numbers,
                          size: 15,
                          color: AppStyles.textBlack,
                        ),
                      ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),

                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hint.tr(),
                hintStyle: AppFontStyle.mediumTextStyle(
                  14,
                  fontColor: AppStyles.textBlack.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldOnlyConst extends StatefulWidget {
  final String labelTitle;
  final TextEditingController controller;
  final double? width;
  final String type;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChange;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final String hint;
  final bool isLabelNotShow;
  final double? topPadding, height;
  final int? maxLines;
  final bool? hasError;
  final Color? bgColor;

  const TextFormFieldOnlyConst({
    super.key,
    required this.labelTitle,
    required this.controller,
    required this.type,
    this.keyboardType,
    this.autofillHints,
    required this.hint,
    this.inputFormatters,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.readOnly,
    this.width,
    this.isLabelNotShow = false,
    this.hasError = false,
    this.topPadding,
    this.maxLines,
    this.height,
    this.bgColor,
  });

  @override
  State<TextFormFieldOnlyConst> createState() => _TextFormFieldOnlyConstState();
}

class _TextFormFieldOnlyConstState extends State<TextFormFieldOnlyConst> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding ?? 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isLabelNotShow == true
              ? SizedBox(height: 0)
              : Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    bottom: widget.topPadding ?? 4,
                  ),
                  child: textRegular(
                    text: widget.labelTitle.tr(),
                    fontSize: 16,
                  ),
                ),
          Container(
            height: widget.maxLines == null ? widget.height ?? 48 : null,
            width: widget.width ?? size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.hasError == true
                    ? AppStyles.redColor3F
                    : AppStyles.greyDE,
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              autofillHints: widget.autofillHints,
              maxLines: widget.maxLines,
              textInputAction: widget.maxLines == null
                  ? TextInputAction.done
                  : TextInputAction.newline,
              keyboardType: widget.type == 'email'
                  ? TextInputType.emailAddress
                  : widget.keyboardType,
              onChanged: widget.onChange,
              onFieldSubmitted: widget.onFieldSubmitted,
              onSaved: widget.onSaved,
              inputFormatters: widget.type == 'normal'
                  ? [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))]
                  : widget.inputFormatters,
              obscuringCharacter: "*",
              style: AppFontStyle.semiBoldTextStyle(
                16,
                fontColor: AppStyles.textBlack,
              ),
              readOnly: widget.readOnly ?? false,
              decoration: InputDecoration(
                fillColor: AppStyles.transparent,
                contentPadding: const EdgeInsets.only(
                  top: 3,
                  left: 16,
                  bottom: 6,
                ),
                alignLabelWithHint: false,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hint.tr(),
                hintStyle: AppFontStyle.mediumTextStyle(
                  14,
                  fontColor: AppStyles.textBlack.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
