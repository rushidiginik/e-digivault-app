import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class BrochureScreen extends StatefulWidget {
  const BrochureScreen({super.key});

  @override
  State<BrochureScreen> createState() => _BrochureScreenState();
}

class _BrochureScreenState extends State<BrochureScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: "Brochure", showBack: true),
        body: PDF().cachedFromUrl(
          "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
          placeholder: (progress) {
            // ensure rebuild when progress changes
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_progress != progress) {
                setState(() => _progress = progress);
              }
            });

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 12),
                  textSemiBold(text: '$_progress %', fontSize: 14),
                ],
              ),
            );
          },
          errorWidget: (error) =>
              Center(child: textMedium(text: error.toString(), fontSize: 12)),
        ),
      ),
    );
  }
}
