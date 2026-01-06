import 'package:flutter/material.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/client_page_container_helper_ac.dart';
import '../../../../../../../widgets/common_header.dart';

class RequestPaymentViewScreenAc extends StatefulWidget {
  final String status;

  const RequestPaymentViewScreenAc({super.key, required this.status});

  @override
  State<RequestPaymentViewScreenAc> createState() =>
      _RequestPaymentViewScreenAcState();
}

class _RequestPaymentViewScreenAcState
    extends State<RequestPaymentViewScreenAc> {
  int selectedTab = 0;

  String getDisplayStatus(String status) {
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
                        color: Color(0xFFEAF2FF),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
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
