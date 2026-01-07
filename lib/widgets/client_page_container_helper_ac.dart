import 'package:flutter/material.dart';

import '../core/constants/image_const.dart';

class ClientPageContainerHelperAc extends StatefulWidget {
  final VoidCallback onTap;

  final String idPrefix;
  final String idNumber;
  final String roleTitle;
  final String progress;
  final String status;
  final String? createdBy;
  final Color? statusBgColor;
  final Color? statusTextColor;

  final String? phone;
  final String? email;
  final bool showDetailedCard;

  final String? displayName; // 🔹 NEW (optional)
  final bool replaceIdWithName; // 🔹 NEW
  //  switch

  const ClientPageContainerHelperAc({
    super.key,
    required this.onTap,
    required this.idPrefix,
    required this.idNumber,
    this.roleTitle = "", // default
    this.progress = "",
    required this.status,
    this.createdBy,

    // 🔹 new optional
    this.phone,
    this.email,
    this.showDetailedCard = false,
    // 🔹 NEW (safe defaults)
    this.displayName,
    this.replaceIdWithName = false,
    this.statusBgColor,
    this.statusTextColor,
  });

  @override
  State<ClientPageContainerHelperAc> createState() =>
      _ClientPageContainerHelperAcState();
}

class _ClientPageContainerHelperAcState
    extends State<ClientPageContainerHelperAc> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.showDetailedCard
                ? const Color(0xFF062C5A) // 🔹 DB style bg
                : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: widget.showDetailedCard
                ? null
                : Border.all(color: Colors.grey.shade300),
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
              const SizedBox(width: 18),
              // TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  ID
                    Text(
                      widget.replaceIdWithName && widget.displayName != null
                          ? widget.displayName!
                          : "${widget.idPrefix}-${widget.idNumber}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.showDetailedCard
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),

                    // 🔹 ROLE
                    if (widget.roleTitle.isNotEmpty) ...[
                      Text(
                        widget.roleTitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: widget.showDetailedCard
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                    if (widget.progress.isNotEmpty) ...[
                      Row(
                        children: [
                          Text(
                            "Progress: ",
                            style: TextStyle(
                              fontSize: 13,
                              color: widget.showDetailedCard
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            widget.progress,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4F8922),
                            ),
                          ),
                        ],
                      ),
                    ],

                    // 🔹 NEW FIELDS (ONLY WHEN ENABLED)
                    if (widget.showDetailedCard && widget.phone != null) ...[
                      Text(
                        "Phone No: ${widget.phone}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    if (widget.showDetailedCard && widget.email != null) ...[
                      const SizedBox(height: 4),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Email: ",
                              style: TextStyle(
                                color: Colors.white, // 🔹 Email label white
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: widget.email!, // 🔹 only value
                              style: const TextStyle(
                                color: Color(0xFFA6E07A),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (widget.showDetailedCard &&
                        widget.createdBy != null) ...[
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Created By : ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: widget.createdBy!,
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF), // image jaisa green
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "Status:",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: widget.showDetailedCard
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color:
                                widget.statusBgColor ??
                                (widget.showDetailedCard
                                    ? const Color(0xFFEDE7F6)
                                    : const Color(0xFFF2EAFE)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color:
                                  widget.statusTextColor ??
                                  (widget.showDetailedCard
                                      ? const Color(0xFF6F42C1)
                                      : const Color(0xFF7A3EF0)),
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
