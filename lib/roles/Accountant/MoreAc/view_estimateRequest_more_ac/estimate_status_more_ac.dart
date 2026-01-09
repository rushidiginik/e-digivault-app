import 'package:flutter/material.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';

class EstimateStatusMoreAc extends StatefulWidget {
  final String? status;

  const EstimateStatusMoreAc({super.key, this.status});

  @override
  State<EstimateStatusMoreAc> createState() => _EstimateStatusMoreAcState();
}

class _EstimateStatusMoreAcState extends State<EstimateStatusMoreAc> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Estimate Status', showBack: true),

        body: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.status != null) ...[
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: widget.status == "Approved"
                          ? const Color(0xFFDFF7D8) // light green
                          : const Color(0xFFFADCDC), // light red
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.status!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.status == "Approved"
                            ? const Color(0xFF2E7D32)
                            : const Color(0xFFC62828),
                      ),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 18),
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
                              "Estimation Approval Status",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF001678),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "Created By",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160, //  SAME WIDTH FOR ALL
                                child: Text(
                                  "Kiran @CD",
                                  textAlign: TextAlign.left,
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
                            children: const [
                              Expanded(
                                child: Text(
                                  "Approved By",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Text(
                                  "Ramesh @MRA",
                                  textAlign: TextAlign.left,
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
                            children: const [
                              Expanded(
                                child: Text(
                                  "Rejected By",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Text(
                                  "Ramesh @Incharge",
                                  textAlign: TextAlign.left,
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

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      _tabButton("Flow", 0),
                      _tabButton("Table View", 1),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (selectedTab == 0) _flowView(),
              if (selectedTab == 1) _tableView(),

              if (widget.status == "Rejected") ...[
                const SizedBox(height: 9),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    // right gap as needed
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // View Remark action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0052CC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xFF0052CC),
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "View Remark",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ],
          ),
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
                    //  CIRCLE
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
}

/// ---------- PRICE CHIP ----------
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
