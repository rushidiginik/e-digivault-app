import 'package:flutter/material.dart';

import '../core/constants/image_const.dart';

class ClientPageContainerHelperAc extends StatelessWidget {
  final VoidCallback onTap;

  final String idPrefix;
  final String idNumber;
  final String roleTitle;
  final String progress;
  final String status;

  const ClientPageContainerHelperAc({
    super.key,
    required this.onTap,
    required this.idPrefix,
    required this.idNumber,
    required this.roleTitle,
    required this.progress,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              // IMAGE
              SizedBox(
                width: size.width * 0.26,
                height: 99,
                child: ClipOval(
                  child: Image.asset(
                    ImageConst.manProfileJPG,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 ID (EXACT IMAGE STYLE)
                    Text(
                      "$idPrefix-$idNumber",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // 🔹 ROLE NAME
                    Text(
                      roleTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // 🔹 PROGRESS
                    Row(
                      children: [
                        const Text(
                          "Progress: ",
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          progress,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4F8922),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // 🔹 STATUS
                    Row(
                      children: [
                        const Text(
                          "Status:",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF2EAFE),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7A3EF0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}