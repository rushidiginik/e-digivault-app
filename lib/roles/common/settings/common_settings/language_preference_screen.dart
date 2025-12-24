
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/common_drop_down_widget.dart';
import 'package:flutter/material.dart';


class LanguagePreferenceScreen extends StatefulWidget {
  const LanguagePreferenceScreen({super.key});

  @override
  State<LanguagePreferenceScreen> createState() =>
      _LanguagePreferenceScreenState();
}

class _LanguagePreferenceScreenState extends State<LanguagePreferenceScreen> {
  late Size size;
  String selectedLanguages = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: "language_preference"),
      body: SafeArea(child: _languageSelectionSection()),
    );
  }

  Widget _languageSelectionSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CommonDropdown(
        label: "choose_your_language",
        selectedItem: selectedLanguages == "" ? "English" : selectedLanguages,
        items: ["English", "Hindi", "Kannada"],
        hintText: "choose_your_language",
        onChanged: (val) async {
          setState(() {
            selectedLanguages = val.toString();
          });

          // if (val == "English") {
          //   await context.setLocale(const Locale('en'));
          // } else if (val == "Hindi") {
          //   await context.setLocale(const Locale('hi'));
          // } else if (val == "Kannada") {
          //   await context.setLocale(const Locale('kn'));
          // }
        },
      ),
    );
  }
}
