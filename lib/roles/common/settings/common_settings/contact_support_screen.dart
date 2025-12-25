import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: "Contact_Support"),
      body: SafeArea(child: _contactSupportSection()),
    );
  }

  Widget _contactSupportSection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildContactItem(
              CupertinoIcons.envelope,
              "Email: support@edigivault.com",
            ),
            const SizedBox(height: 40),
            _buildContactItem(CupertinoIcons.phone, "9999955555"),
            const SizedBox(height: 40),
            _buildContactItem(
              CupertinoIcons.chat_bubble_text,
              "Live Chat: Available 9AM–6PM\n(Mon–Fri)",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppStyles.primaryColor.withOpacity(
              0.10,
            ), // light blue circle background
          ),
          child: Icon(icon, color: AppStyles.primaryColor, size: 32),
        ),
        const SizedBox(height: 20),
        textSemiBold(
          text: text,
          fontSize: 18,
          textAlign: TextAlign.center,
          fontColor: AppStyles.grey66,
        ),
      ],
    );
  }
}
