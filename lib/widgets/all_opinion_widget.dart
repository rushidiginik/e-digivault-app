import 'package:flutter/material.dart';

import '../core/constants/app_common_text.dart';
import '../core/constants/image_const.dart';
import '../core/constants/theme.dart';

class AllOpinionWidget extends StatelessWidget {
  final String clientName;
  final String documentName;
  final String title;
  final String title2;
  final List<String> overviewPoints;
  final List<String> legalPoints;

  const AllOpinionWidget({
    super.key,
    required this.clientName,
    required this.documentName,
    required this.title,
    required this.title2,
    required this.overviewPoints,
    required this.legalPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Image.asset(ImageConst.buildingIconPNG, width: 22),
              const SizedBox(width: 8),
              textSemiBold(
                text: title2,
                fontSize: 20,
                fontColor: AppStyles.grey29,
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),
        const Divider(thickness: 1),

        /// ---------- TOOLBAR (HORIZONTAL SCROLL) ----------
        SizedBox(
          height: 44,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                _toolIcon(ImageConst.undoIconPNG),
                _gap(),
                _toolIcon(ImageConst.redoIconPNG),
                _gap(),
                _toolIcon(ImageConst.textStyleIconPNG),
                _gap(),
                _toolIcon(ImageConst.textAlignIconPNG),
                _gap(),
                _toolIcon(ImageConst.colorIconPNG),
                _gap(),
                _toolIcon(ImageConst.boldIconPNG),
                _gap(),
                _toolIcon(ImageConst.italicIconPNG),
                _gap(),
                Icon(Icons.format_underline),
                _gap(),
                Icon(Icons.format_strikethrough),
                _gap(),
                Icon(Icons.format_list_bulleted),
                _gap(),
                Icon(Icons.format_list_numbered),
                _gap(),
                Icon(Icons.format_indent_decrease),
                _gap(),
                Icon(Icons.format_indent_increase),
                _gap(),
                Icon(Icons.format_quote),
                _gap(),
                Icon(Icons.link),
                _gap(),
                Icon(Icons.image),
                _gap(),
                Icon(Icons.attach_file),
                _gap(),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ),

        /// ---------- CONTENT (VERTICAL SCROLL) ----------
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// OPINION TITLE (BIG)
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    "Client: $clientName",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Document : $documentName",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// OVERVIEW
                  const Text(
                    "Overview",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),

                  _bulletList(overviewPoints),

                  const SizedBox(height: 20),

                  /// LEGAL
                  const Text(
                    "Legal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),

                  _bulletList(legalPoints),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolIcon(String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Image.asset(asset, height: 28),
    );
  }

  Widget _gap() => const SizedBox(width: 6);

  Widget _bulletList(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("•  "),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
