import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../core/constants/app_common_text.dart';
import '../../../core/constants/theme.dart';
import '../../../widgets/common_header.dart';
import '../../../widgets/coustom_circular_percent_painter.dart';
import '../../../widgets/custom_card_widget.dart';
import '../../../widgets/custom_circle_state.dart';
import '../../../widgets/custom_invoice_overview.dart';
import '../../../widgets/custom_pill_button.dart';
import '../../../widgets/custom_progres_bar.dart';
import '../../../widgets/custom_tabBar_widget.dart';
import '../../../widgets/card_header.dart';
import '../../../widgets/segment_switch.dart';

class HomePageStateHead extends StatefulWidget {
  const HomePageStateHead({super.key});

  @override
  State<HomePageStateHead> createState() => _HomePageStateHeadState();
}

class _HomePageStateHeadState extends State<HomePageStateHead> {
  int selectedTab = 0;
  int segmentIndex = 1;

  List<String> tabNames = [
    "Overview",
    "Client",
    "BD",
    "Channel Partner",
    "Account",
    "Legal",
    "State Head",
    "Region Head",
    "Incharge",
    "DP",
    "MRA",
  ];

  Color getSegmentBgColor() {
    switch (selectedTab) {
      case 0: // Overview
        return Color(0xFF0052CC); // Blue

      case 1: // Client
        return Colors.grey.shade600;

      case 2: // BD
        return Color(0xFF0052CC);

      case 3: // Channel Partner
        return Color(0xFF0052CC);

      case 4: // Account
        return Colors.teal;

      case 5: // Legal
        return Colors.teal;

      case 6: // stateHead
        return Colors.teal;

      case 7: // Region Head
        return Colors.teal;

      case 8: // In charge
        return Colors.teal;

      case 9: // DB
        return Colors.teal;

      case 10: // MRA
        return Colors.teal;

      default:
        return Colors.grey;
    }
  }

  List<String> getSegmentLabels() {
    switch (selectedTab) {
      case 0: // Overview
        return ["7D", "D"];

      case 1: // Client
        return ["7D", "D"];

      case 2: // BD
        return ["7D", "D"];

      case 3: // Channel Partner
        return ["7D", "D"];

      case 4: // Account
        return ["Tasks", "Gap", "Expenditure"];

      case 5: // Legal
        return ["Open", "Gap"];

      default:
        return ["Estimate", "Gap"];
    }
  }

  Widget getAccountContent() {
    switch (segmentIndex) {
      case 0: // Tasks
        return _dayContent();

      case 1: // Gap
        return _dayContentSevenD();

      case 2: // Expenditure
        return _dayContent(); // ya custom expenditure widget

      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'Dashboard', showBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Sector Overview"),
                  const SizedBox(height: 12),

                  CustomTabBarWidget(
                    tabs: tabNames,
                    selectedIndex: selectedTab,
                    onTap: (index) {
                      setState(() => selectedTab = index);
                    },
                  ),
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: selectedTab == 4
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      SegmentSwitch(
                        selectedIndex: segmentIndex,
                        backgroundColor: getSegmentBgColor(),
                        labels: getSegmentLabels(),
                        onChanged: (index) {
                          setState(() => segmentIndex = index);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  if (selectedTab == 4)
                    getAccountContent()
                  else
                    (segmentIndex == 1 ? _dayContent() : _dayContentSevenD()),
                ],
              ),
            ),

            SizedBox(height: 10),
            // Overview Gap
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Overview Gap"),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _insightItem(
                          percent: 0.26,
                          value: "32",
                          label: "Pending",
                          progressColor: AppStyles.orangeF5,
                          backgroundColor: AppStyles.lightOrangeF5,
                        ),
                      ),
                      Expanded(
                        child: _insightItem(
                          percent: 0.26,
                          value: "12",
                          label: "Ongoing",
                          progressColor: AppStyles.blue2F,
                          backgroundColor: AppStyles.lightBlueDD,
                        ),
                      ),
                      Expanded(
                        child: _insightItem(
                          percent: 0.26,
                          value: "22",
                          label: "completed",
                          progressColor: AppStyles.green2E,
                          backgroundColor: AppStyles.lightGreenBC,
                        ),
                      ),
                      Expanded(
                        child: _insightItem(
                          percent: 0.26,
                          value: "62",
                          label: "Rejected",
                          progressColor: AppStyles.redFD,
                          backgroundColor: AppStyles.redA4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Task card
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Task"),
                  const SizedBox(height: 12),
                  CustomProgresBar(),
                ],
              ),
            ),
            SizedBox(height: 10),
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Project"),
                  const SizedBox(height: 12),
                  projectStatusCard(),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _dayContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pills
        Row(
          children: [
            CustomPillButton(
              title: "6 Client",
              bgColor: Color(0xFF0052CC),
              textColor: Colors.white,
              onTap: () {},
            ),
            CustomPillButton(
              title: "12 Projects",
              bgColor: Color(0xFF0052CC),
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Rings + Payment
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomCircleState(
                    value: 4,
                    progress: 0.25,
                    label: "Pending",
                    progressColor: Color(0xFFE85C55),
                    backgroundColor: Color(0xFFFDE6E4),
                  ),
                  CustomCircleState(
                    value: 13,
                    progress: 0.65,
                    label: "Ongoing",
                    progressColor: Color(0xFFFF8A34),
                    backgroundColor: Color(0xFFFFEADB),
                  ),
                  CustomCircleState(
                    value: 6,
                    progress: 0.45,
                    label: "Completed",
                    progressColor: Color(0xFF4CCB7F),
                    backgroundColor: Color(0xFFE6F6EC),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Transform.translate(
              offset: const Offset(0, -36),
              child: _paymentCard(),
            ),
          ],
        ),
        const SizedBox(height: 1),
        // chips row (Expense, Time, Profit)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _chip("20L Expense", const Color(0xFFFFF2D9)),
            const SizedBox(width: 8),
            _chip("26h Time", const Color(0xFFF7E6EE)),
            const SizedBox(width: 8),
            _chip("48L Profit", const Color(0xFFDFF7E6)),
          ],
        ),
        const SizedBox(height: 16),
        Divider(color: const Color(0x1A000000), thickness: 2),
        SizedBox(height: 10),
        // progress label and progress bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Progress",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "72%",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: 0.72,
            minHeight: 8,
            color: const Color(0xFF16A085),
            backgroundColor: const Color(0xFFE8F6F2),
          ),
        ),
      ],
    );
  }

  Widget _dayContentSevenD() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pills
        Row(
          children: [
            CustomPillButton(
              title: "6 Client",
              bgColor: AppStyles.primaryColor,
              textColor: Colors.white,
              onTap: () {},
            ),
            CustomPillButton(
              title: "12 Projects",
              bgColor: AppStyles.primaryColor,
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Rings + Payment
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomCircleState(
                    value: 3,
                    progress: 0.25,
                    label: "Pending",
                    progressColor: Color(0xFFE85C55),
                    backgroundColor: Color(0xFFFDE6E4),
                  ),
                  CustomCircleState(
                    value: 20,
                    progress: 0.72,
                    label: "Ongoing",
                    progressColor: Color(0xFFFF8A34),
                    backgroundColor: Color(0xFFFFEADB),
                  ),
                  CustomCircleState(
                    value: 6,
                    progress: 0.60,
                    label: "Completed",
                    progressColor: Color(0xFF4CCB7F),
                    backgroundColor: Color(0xFFE6F6EC),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Transform.translate(
              offset: const Offset(0, -36),
              child: _paymentCard(),
            ),
          ],
        ),
        const SizedBox(height: 1),
        // chips row (Expense, Time, Profit)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _chip("20L Expense", const Color(0xFFFFF2D9)),
            const SizedBox(width: 8),
            _chip("26h Time", const Color(0xFFF7E6EE)),
            const SizedBox(width: 8),
            _chip("48L Profit", const Color(0xFFDFF7E6)),
          ],
        ),
        const SizedBox(height: 16),
        Divider(color: const Color(0x1A000000), thickness: 2),
        SizedBox(height: 10),
        // progress label and progress bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Progress",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "43%",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: 0.43,
            minHeight: 8,
            color: const Color(0xFF0052CC),
            backgroundColor: const Color(0xFFE8F6F2),
          ),
        ),
      ],
    );
  }

  Widget _paymentCard() {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              //  OVERLAPPING AVATARS
              SizedBox(
                height: 30,
                width: 90,
                child: Stack(
                  children: [
                    _avatar(left: 0, image: "assets/images/png/pay_img1.png"),
                    _avatar(left: 20, image: "assets/images/png/pay_img2.png"),
                    _avatar(left: 39, image: "assets/images/png/pay_img3.png"),
                    _avatar(left: 58, image: "assets/images/png/pay_img4.png"),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
            ],
          ),

          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Payment",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(width: 14),
              Transform.rotate(
                angle: 0.6,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE85C55),
                  ),
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "32k/40k",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: 0.72,
                    minHeight: 6,
                    color: Colors.red,
                    backgroundColor: Color(0x33E14D4D),
                  ),
                ),
              ),
              const SizedBox(width: 6),

              // PERCENT TEXT
              const Text(
                "72%",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0x33E14D4D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String title, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _avatar({required double left, required String image}) {
    return Positioned(
      left: left,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 13,
          backgroundImage: AssetImage(image), //  IMAGE
        ),
      ),
    );
  }

  Widget _insightItem({
    required double percent,
    required String value,
    required String label,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 9.0,
          percent: percent,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: const SizedBox.shrink(),
        ),
        SizedBox(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: progressColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 1),
            textSemiBold(text: value, fontSize: 14),
          ],
        ),
        SizedBox(height: 1),
        SizedBox(
          height: 34,
          child: textRegular(
            text: label,
            fontSize: 12,
            textAlign: TextAlign.center,
            fontColor: progressColor,
          ),
        ),
      ],
    );
  }

  Widget projectStatusCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProgressRow('Pending', 280, 400, AppStyles.red4C),
        SizedBox(height: 6),
        _buildProgressRow('Completed', 120, 400, AppStyles.green00),
        SizedBox(height: 6),
        _buildProgressRow('Ongoing', 100, 400, AppStyles.blueCE),
      ],
    );
  }

  Widget _buildProgressRow(String title, int value, int maxValue, Color color) {
    final progress = (value / maxValue).clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(width: 90, child: Text(title)),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              const barHeight = 7.0;
              const knobWidth = 7.0;
              const knobHeight = 13.0;

              return TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
                tween: Tween(begin: 0, end: progress),
                builder: (context, t, _) {
                  final filledWidth = constraints.maxWidth * t;
                  final knobLeft = (filledWidth - knobWidth / 2).clamp(
                    0.0,
                    constraints.maxWidth - knobWidth,
                  );

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Track
                      Container(
                        height: barHeight,
                        decoration: BoxDecoration(
                          color: AppStyles.greyD9,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      // Fill
                      Positioned(
                        left: 0,
                        child: Container(
                          width: filledWidth,
                          height: barHeight,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      // End knob
                      Positioned(
                        left: knobLeft,
                        top: -(knobHeight - barHeight) / 2,
                        child: _progressKnob(color, knobWidth, knobHeight),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        textMedium(text: value.toString(), fontSize: 12),
      ],
    );
  }

  Widget _progressKnob(Color color, double w, double h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 3),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
    );
  }
}
