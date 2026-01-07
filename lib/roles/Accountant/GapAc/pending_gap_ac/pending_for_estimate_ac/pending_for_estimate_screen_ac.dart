import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constants/image_const.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../widgets/client_page_container_helper_ac.dart';

class PendingForEstimateScreenAc extends StatefulWidget {
  final String status;

  const PendingForEstimateScreenAc({super.key, required this.status});

  @override
  State<PendingForEstimateScreenAc> createState() =>
      _PendingForEstimateScreenAcState();
}

class _PendingForEstimateScreenAcState
    extends State<PendingForEstimateScreenAc> {
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

  void _showRejectConfirmDialog(BuildContext context) {
    showDialog(
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
      Navigator.pop(context);
      setState(() {
        isManuallyRejected = true;
      });
    });
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    late BuildContext dialogContext;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx;
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

      //  Dialog guaranteed close
      Navigator.of(dialogContext).pop();

      setState(() {
        isManuallyApproved = true;
      });
    });
  }

  void _showApproveSuccessDialog(BuildContext context) {
    late BuildContext dialogContext;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.78,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC0E1C7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ImageConst.successgreenicon,
                      width: 16,
                      height: 16,
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  "Successfully Approved",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        );
      },
    );

    /// AUTO CLOSE + STATE UPDATE
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.of(dialogContext).pop();
      setState(() {
        isManuallyApproved = true;
      });
    });
  }

  void _showApproveNoteDialog(BuildContext context) {
    final TextEditingController noteCtrl = TextEditingController();

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
                      "Note",
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

                /// NOTE FIELD (DASHED)
                SizedBox(
                  height: 140,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: TextField(
                          controller: noteCtrl,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: "Note",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
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
                      _showApproveSuccessDialog(context);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Estimate GAP', showBack: true),
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

              _crusadeProjectCard(context),

              const SizedBox(height: 39),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    height: 44, // width control
                    child: ElevatedButton(
                      onPressed: () {
                        _showRejectConfirmDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF56860),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  SizedBox(
                    width: 90,
                    height: 44, // same width
                    child: ElevatedButton(
                      onPressed: () {
                        _showApproveNoteDialog(context); // ✅ START APPROVE FLOW
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF68B031),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Approve",
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
      ),
    );
  }

  Widget _crusadeProjectCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8FF), // grey background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4EBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== HEADER (GREY AREA) =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                ImageConst.buildingIconSvg,
                width: 22,
                height: 22,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Crusade project",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "SR ID - 57643A3",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "140A",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "EST",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF14246C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// ===== WHITE CARD (ONLY BELOW PART) =====
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ACTION ROW
                Row(
                  children: [
                    const Text(
                      "Properties",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    _linkText(
                      "View EST",
                      onTap: () {
                        context.pushNamed('acPendingEstimateViewest');
                      },
                    ),
                    const SizedBox(width: 18),
                    _linkText(
                      "View opinion",
                      onTap: () {
                        context.pushNamed('acPendingEstimateViewopinion');
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                _propertyRow("Property 1", "50A Est"),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0x0D000000), // very light grey
                ),
                _propertyRow("Property 2", "20A Est"),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0x0D000000), // very light grey
                ),
                _propertyRow("Property 3", "50A Est"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkText(String text, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2), // underline niche aayegi
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF0052CC), // blue underline
                width: 1.2, // thickness
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF0052CC),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _propertyRow(String title, String amount) {
    return InkWell(
      onTap: () {
        context.pushNamed('acPendingEstimateViewest');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 20,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
            Text(
              amount,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 24, color: Colors.black),
          ],
        ),
      ),
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
