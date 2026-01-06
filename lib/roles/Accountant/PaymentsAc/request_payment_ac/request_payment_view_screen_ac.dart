import 'package:flutter/material.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/client_page_container_helper_ac.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../core/constants/image_const.dart';

class RequestPaymentViewScreenAc extends StatefulWidget {
  final String status;

  const RequestPaymentViewScreenAc({super.key, required this.status});

  @override
  State<RequestPaymentViewScreenAc> createState() =>
      _RequestPaymentViewScreenAcState();
}

class _RequestPaymentViewScreenAcState
    extends State<RequestPaymentViewScreenAc> {
  String paymentMode = "UPI"; // UPI | Cash | Cheque
  bool paymentConfirmed = false;

  int selectedTab = 0;

  bool isManuallyRejected = false;
  bool isManuallyApproved = false;

  bool get isPending =>
      widget.status.trim().toLowerCase() == "pending" && !isManuallyRejected;

  bool get isRejected =>
      widget.status.trim().toLowerCase() == "rejected" || isManuallyRejected;

  String getDisplayStatus(String status) {
    if (isManuallyApproved) return "Approved";
    if (isManuallyRejected) return "Rejected";

    if (status.trim().toLowerCase() == "pending") {
      return "Active";
    }
    return status;
  }

  Color getStatusBg(String status) {
    switch (status) {
      case "Approved":
        return const Color(0xFFE6F4EA);
      case "Rejected":
        return const Color(0xFFFDECEA);
      case "Active":
        return const Color(0xFFFFFFFF);
      default:
        return const Color(0xFFF2EAFE);
    }
  }

  Color getStatusText(String status) {
    switch (status) {
      case "Approved":
        return const Color(0xFF2E7D32);
      case "Rejected":
        return const Color(0xFFD32F2F);
      case "Active":
        return Color(0xFF7A3EF0);
      default:
        return const Color(0xFF7A3EF0);
    }
  }

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

  ///////////////////////////// pay ////////////////////////////////

  void _openPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
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
                              "Pay",
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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Image.asset(
                    ImageConst.verifyDonePNG,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "Payment Sent",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    /// AUTO APPROVED (same as before)
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
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
        appBar: CommonHeader(title: 'Requested', showBack: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: const Color(0x1A000000), thickness: 2),
              ),

              const SizedBox(height: 6),

              ClientPageContainerHelperAc(
                onTap: () {},
                idPrefix: "SH",
                idNumber: "567894",

                status: getDisplayStatus(widget.status),

                phone: "89XXXXXX78",
                email: "Rajesh@gmail.com",
                showDetailedCard: true,
                replaceIdWithName: true,
                displayName: "Rajesh Kumar",

                statusBgColor: getStatusBg(getDisplayStatus(widget.status)),
                statusTextColor: getStatusText(getDisplayStatus(widget.status)),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFBBD6FF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Requested Approval Status",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF001678),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Created By",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Kiran @MRA",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 70.0),
                                child: const Text(
                                  "Approved By",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: const Text(
                                  "Ramesh @ Incharge\n Suresh @ RM\nKiran @ SH\nVarun @ Accountant",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
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
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFBBD6FF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Cost Overview",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF001678),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Estimation Cost",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "350A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Paid Amount",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: const Text(
                                  "150A",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "On Request",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: const Text(
                                  "100A",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    if (widget.status.trim().toLowerCase() == "rejected") ...[
                      _rejectedRemarkButton(),
                      const SizedBox(height: 26),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _requestDetailsForm(),
              ),
              const SizedBox(height: 10),

              if (widget.status.trim().toLowerCase() == "pending") ...[
                _pendingActionButtons(),
                const SizedBox(height: 60),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _pendingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  Reject
        ElevatedButton(
          onPressed: () {
            _showRejectConfirmDialog(context); // same dialog reuse
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF56860),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          ),
          child: const Text(
            "Reject",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        const SizedBox(width: 20),

        //  Pay
        ElevatedButton(
          onPressed: () {
            _openPaymentBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF68B031),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          ),
          child: const Text(
            "Pay",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _requestDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _readonlyField(
          "Client Name",
          "Rajesh Kumar",
          isBold: true, //
        ),
        _readonlyField(
          "Property",
          "Apartment",
          isBold: true, //
        ),
        _readonlyField(
          "Job ID",
          "BA-MA-560265",
          isBold: true, //
        ),
        _readonlyField(
          "Category",
          "Revenue Records",
          isBold: true, //
        ),

        _readonlyField(
          "Main Service",
          "Gram PanState Headayat",
          isBold: true, //
        ),

        _blueField(
          label: "Sub Service 1",
          value: "E-katha",
          icon: Icons.keyboard_arrow_down,
        ),
        _blueField(label: "Step No", value: "4"),
        _blueField(label: "Amount", value: "250A"),
      ],
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

  Widget _rejectedRemarkButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        _showRejectedDialog(context);
      },
      child: Container(
        width: double.infinity,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF6DDDB), //  light red bg (image jaisa)
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Container(
                width: 33,
                height: 33,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 28,
                    color: Color(0xFFFF3B30),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            //  Rejected text
            Padding(
              padding: const EdgeInsets.only(right: 130.0),
              child: const Text(
                "Rejected",
                style: TextStyle(
                  color: Color(0xFFD32F2F),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selectedTab == index
                ? const Color(0xFF0052CC)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: selectedTab == index
                  ? Colors.white
                  : const Color(0xFF0052CC),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _flowView() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 20),
      child: Stack(
        children: [
          // LEFT CONTINUOUS LINE
          Positioned(
            left: 36,
            top: 66,
            child: Container(
              width: 2,
              height: 400,
              color: const Color(0xFF0052CC),
            ),
          ),

          Column(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 22, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔵 CIRCLE
                    Container(
                      margin: const EdgeInsets.only(top: 66),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF0052CC),
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF0052CC),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    //  EXISTING CARD (UNCHANGED)
                    Expanded(child: _flowStep(index + 1)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _flowStep(int step) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFFD0D5DD), // light grey
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Step $step",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit_outlined,
                              size: 16,
                              color: const Color(0xFF0052CC),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Container(
                                width: 12,
                                height: 1.5,
                                color: Color(0xFF0052CC),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Edit",
                          style: TextStyle(
                            color: const Color(0xFF0052CC),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _timeBadge("1D"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _priceChip("100", "Real"),
              SizedBox(width: 9),
              _priceChip("200", "Bribe"),
              SizedBox(width: 9),
              _priceChip("300", "Mind"),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "This is the best step i have taken ever\nThis is the best step i have taken ever",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _timeBadge(String time) {
    return Row(
      children: [
        Icon(Icons.access_time, size: 20, color: const Color(0xFF0052CC)),
        const SizedBox(width: 4),
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF0052CC),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// ---------- TABLE VIEW ----------
  Widget _tableView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 720,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _tableHeaderRow(),
              _tableDivider(),
              _tableRow(
                "1",
                "Step 1",
                "2 Days",
                "100",
                "This process was carried out with an actual cost of 100",
              ),
              _tableDivider(),
              _tableRow(
                "2",
                "Case work 1",
                "2 Days",
                "500",
                "This process was carried out with an actual cost of 500",
              ),
              _tableDivider(),
              _tableRow(
                "3",
                "Case work 2",
                "2 Days",
                "600",
                "This process was carried out with an actual cost of 600",
              ),
              _tableDivider(),
              _tableRow(
                "4",
                "Online App 2",
                "2 Days",
                "750",
                "This process was carried out with an actual cost of 750",
              ),
              _tableDivider(),
              _totalRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        color: Color(0xFFE3EAFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: const [
            _HeaderCell("Step No", 60),
            _HeaderCell("Step / Task", 140),
            _HeaderCell("Time", 80),
            _HeaderCell("Price", 120),
            _HeaderCell("Description", 260),
          ],
        ),
      ),
    );
  }

  Widget _tableRow(String s, String t, String d, String p, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          _cell(s, 60),
          _cell(t, 140),
          _cell(d, 80),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _chip("Bribe"),
                const SizedBox(width: 6),
                _chip(p, bold: true),
              ],
            ),
          ),
          SizedBox(
            width: 260,
            child: Text(desc, style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _totalRow() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    "Total",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 140), // Step / Task empty
              SizedBox(
                width: 80,
                child: const Center(
                  child: Text(
                    "8 Days",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Time
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    "1850",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 260), // Description empty
            ],
          ),
        ),
        Container(height: 1, color: const Color(0xFFE5E5E5)),
      ],
    );
  }

  Widget _tableDivider() =>
      Container(height: 1, color: const Color(0xFFE5E5E5));

  Widget _cell(String t, double w) => SizedBox(
    width: w,
    child: Center(child: Text(t)),
  );

  Widget _chip(String t, {bool bold = false}) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
    decoration: BoxDecoration(
      color: const Color(0xFFE3F2FD),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      t,
      style: TextStyle(
        fontSize: 11,
        fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
        color: const Color(0xFF0052CC),
      ),
    ),
  );

  Widget _statusPill() {
    if (widget.status == "Rejected") {
      return Container(
        width: double.infinity,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF6DDDB),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Container(
                width: 33,
                height: 33,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 28,
                    color: Color(0xFFFF3B30),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            //  Rejected text
            Padding(
              padding: const EdgeInsets.only(right: 130.0),
              child: const Text(
                "Rejected",
                style: TextStyle(
                  color: Color(0xFFD32F2F),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // बाकी status (Pending / Approved)
    Color bgColor;
    Color textColor;

    switch (widget.status) {
      case "Approved":
        bgColor = const Color(0xFFE6F4EA);
        textColor = const Color(0xFF2E7D32);
        break;
      default:
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFFF9800);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        widget.status,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _greyField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
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

  Widget _blueField({
    required String label,
    required String value,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TITLE (Bold + Black)
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),

          /// 🔹 FIELD
          TextFormField(
            initialValue: value,
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: icon != null
                  ? Icon(icon, color: const Color(0xFF0A0E0A))
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF0052CC), // 🔵 blue border
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF0052CC),
                  width: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _priceChip extends StatelessWidget {
  final String amount;
  final String label;

  const _priceChip(this.amount, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBBD3FF)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Transform.rotate(
                angle: 1.6,
                child: Icon(Icons.sell_outlined, size: 16, color: Colors.grey),
              ),
              const SizedBox(width: 4),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4A4A4A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0052CC),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final double width;

  const _HeaderCell(this.text, this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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
