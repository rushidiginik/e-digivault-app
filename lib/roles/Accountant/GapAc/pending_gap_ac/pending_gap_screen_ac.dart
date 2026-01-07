import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../../../core/constants/image_const.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../widgets/client_page_container_helper_ac.dart';

class PendingGapScreenAc extends StatefulWidget {
  final String status;

  const PendingGapScreenAc({super.key, required this.status});

  @override
  State<PendingGapScreenAc> createState() => _PendingGapScreenAcState();
}

class _PendingGapScreenAcState extends State<PendingGapScreenAc> {
  String paymentMode = "UPI"; // UPI | Cash | Cheque
  bool paymentConfirmed = false;

  bool isManuallyRejected = false;
  bool isManuallyApproved = false;

  void _showRejectedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.88,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0x266CA5F8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Color(0xFF0052CC),
                      ),
                    ),
                  ),
                ),

                /// CONTENT
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),

                    /// Rejected chip (CENTER PERFECT)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDEAEA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Rejected",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC62828),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Message (IMAGE LINE BREAK SAME)
                    Center(
                      child: const Text(
                        "Your GAP has been Rejected\n"
                        "Due insufficient Legal Detail",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> _showRejectConfirmDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // dialog corner
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ICON WITH BACKGROUND (IMAGE JAISE)
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFDEDE),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Color(0xFFC62828),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                /// TITLE
                const Text(
                  "Reject ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 8),

                /// SUB TEXT
                const Text(
                  "Estimate for CL-215487 created by\nCD kiran",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 22),

                /// BUTTON ROW
                Row(
                  children: [
                    /// CANCEL
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF0052CC)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              6,
                            ), //  LESS RADIUS
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xFF0052CC),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// REJECT
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showRemarkDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0052CC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              6,
                            ), //  LESS RADIUS
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "Reject",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRemarkDialog(BuildContext context) {
    TextEditingController remarkCtrl = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Remark",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD6E6FE),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 18,
                          color: Color(0xFF0052CC),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                SizedBox(
                  height: 140,
                  child: Stack(
                    children: [
                      /// TEXT FIELD
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: TextField(
                          controller: remarkCtrl,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: "Price could be negotiated",
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      /// DASHED BORDER OVERLAY
                      Positioned.fill(
                        child: IgnorePointer(
                          child: CustomPaint(painter: _DashedBorderPainter()),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                /// SEND BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showRejectedSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0052CC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRejectedSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.78, //  dialog width
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ICON WITH BG
                Container(
                  width: 64, //  thoda bada
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEFDEDE),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      size: 34,
                      color: Color(0xFFC62828),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// TEXT
                const Text(
                  "Rejected",
                  style: TextStyle(
                    fontSize: 22, //  thoda bada text
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context, "rejected");
      setState(() {
        isManuallyRejected = true;
      });
    });
  }

  ///////////////////////////// pay ////////////////////////////////

  Future<String?> _openPaymentBottomSheet(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  16 + MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  children: [
                    ///  SCROLLABLE CONTENT
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Transaction Mode",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),

                            Row(
                              children: ["UPI", "Cash", "Cheque"].map((mode) {
                                return Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setSheetState(() => paymentMode = mode);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio<String>(
                                          value: mode,
                                          groupValue: paymentMode,
                                          onChanged: (val) {
                                            setSheetState(
                                              () => paymentMode = val!,
                                            );
                                          },

                                          //  RADIO COLOR CONTROL
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                (states) {
                                                  if (states.contains(
                                                    MaterialState.selected,
                                                  )) {
                                                    return const Color(
                                                      0xFF7749F8,
                                                    ); // selected purple
                                                  }
                                                  return Colors
                                                      .grey; // unselected grey
                                                },
                                              ),

                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: -4,
                                            vertical: -4,
                                          ),
                                        ),

                                        //  VERY SMALL GAP (round ke bilkul paas)
                                        const SizedBox(width: 4),

                                        Text(
                                          mode,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 12),
                            _bottomGreyField("Amount", "Enter the Amount"),

                            if (paymentMode == "UPI")
                              _bottomGreyField("UPI ID", "Enter the UPI ID"),

                            if (paymentMode == "Cheque")
                              _bottomGreyField(
                                "Cheque Number",
                                "Enter the Cheque Number",
                              ),

                            _bottomGreyField(
                              "Receiver Name",
                              "Enter Receiver Name",
                            ),

                            if (paymentMode == "Cash")
                              _bottomGreyField(
                                "Upload Documents",
                                "xyzDOC.pdf",
                              ),

                            const SizedBox(height: 12),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: paymentConfirmed,
                                  onChanged: (v) {
                                    setSheetState(() => paymentConfirmed = v!);
                                  },
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12),
                                    child: Text(
                                      "I here by Certify that i have checked the Payment and verified it.",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF0052CC)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Color(0xFF0052CC),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: paymentConfirmed
                                ? () {
                                    Navigator.pop(context);
                                    _showPaymentSuccessDialog(context);
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0052CC),
                              disabledBackgroundColor: Color(0xFF0052CC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "Verify",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    late BuildContext dialogContext;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx; //  dialog ka actual context
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(ImageConst.verifyDonePNG, width: 60, height: 60),
                const SizedBox(height: 18),
                const Text(
                  "Payment Sent",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.of(dialogContext).pop("approved");
      setState(() {
        isManuallyApproved = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Assign GAP', showBack: true),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageConst.flowestimateicon,
                      height: 20,
                      width: 20,
                      color: AppStyles.primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Service".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: const Color(0x1A000000), thickness: 1),
              ),

              const SizedBox(height: 8),

              /// CLIENT CARD
              ClientPageContainerHelperAc(
                onTap: () {},
                idPrefix: "SH",
                idNumber: "567894",
                status: "Active",
                phone: "89XXXXXX78",
                email: "Rajesh@gmail.com",
                showDetailedCard: true,
                replaceIdWithName: true,
                displayName: "Rajesh Kumar",
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    /// SERVICE DETAILS CARD
                    _whiteCard(
                      Column(
                        children: [
                          _infoRow("Service Request Date", "24-05-25"),
                          const SizedBox(height: 12),
                          _infoRow("Service", "E-Katha"),
                          const SizedBox(height: 12),
                          _infoRow("", "Katha Extract"),
                          const SizedBox(height: 12),
                          _infoRow("", "Katha Mutation"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    _whiteCard(
                      Column(
                        children: [
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCE9FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Payment Details",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF130703),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _infoRow("Ref Number", "00008575257"),
                          const SizedBox(height: 12),
                          _infoRow("Payment Time", "25-02-2023, 13:22:16"),
                          const SizedBox(height: 12),
                          _infoRow("Payment Method", "UPI"),
                          const SizedBox(height: 12),
                          _infoRow("Sender Name", "Ganesh"),
                          const SizedBox(height: 30),
                          _infoRow("Amount", "250A"),
                          const SizedBox(height: 12),

                          /// Amount + Status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Payment Status",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE6F4EA),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "Success",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2E7D32),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    /// REJECT BUTTON
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          final result = await _showRejectConfirmDialog(
                            context,
                          );

                          if (result == "rejected") {
                            Navigator.pop(context); //  Pending screen band
                          }
                        },

                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF0052CC),
                            width: 1.3,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: const Text(
                          "Reject",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0052CC),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// VERIFY BUTTON
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final result = await _openPaymentBottomSheet(context);

                          if (result == "approved") {
                            Navigator.pop(context); //  Pending screen band
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0052CC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  /// COMMON WHITE CARD
  Widget _whiteCard(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _readonlyField(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Colors.black : Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            initialValue: value,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomGreyField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: const Color(0xFFEFEFEF),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// INFO ROW
  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 5; // image jaisa
    const dashSpace = 6; // image jaisa
    final paint = Paint()
      ..color = const Color(0xFFBDBDBD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1; // thin border

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(12),
    );

    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final len = (distance + dashWidth < metric.length)
            ? dashWidth
            : metric.length - distance;

        canvas.drawPath(metric.extractPath(distance, distance + len), paint);

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
