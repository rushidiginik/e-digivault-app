import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../core/constants/app_common_text.dart';
import '../../../core/constants/theme.dart';
import '../../../widgets/common_header.dart';
import '../../../widgets/coustom_circular_percent_painter.dart';
import '../../../widgets/custom_card_widget.dart';
import '../../../widgets/custom_invoice_overview.dart';
import '../../../widgets/custom_progres_bar.dart';
import '../../../widgets/card_header.dart';

class HomePageRegionalHead extends StatefulWidget {
  const HomePageRegionalHead({super.key});

  @override
  State<HomePageRegionalHead> createState() => _HomePageRegionalHeadState();
}

class _HomePageRegionalHeadState extends State<HomePageRegionalHead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'Dashboard', showBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User Overview Section
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "User overview"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _userOverviewItem(
                        value: 32,
                        label: "Incharge",
                        subLabel: "12-Active",
                        progress: 0.45,
                        progressColor: const Color(0xFF5B6FDB),
                        backgroundColor: const Color(0xFFE5E8F5),
                      ),
                      _userOverviewItem(
                        value: 56,
                        label: "MRA",
                        subLabel: "14-Active",
                        progress: 0.68,
                        progressColor: const Color(0xFF4CCB7F),
                        backgroundColor: const Color(0xFFE6F6EC),
                      ),
                      _userOverviewItem(
                        value: 24,
                        label: "Delivery Partner",
                        subLabel: "11-Active",
                        progress: 0.52,
                        progressColor: const Color(0xFFFF8A34),
                        backgroundColor: const Color(0xFFFFEADB),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Estimation Overview Section
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Estimation Overview"),
                  const SizedBox(height: 16),
                  _estimationRow(
                    label: "Approved",
                    current: 50,
                    total: 100,
                    color: const Color(0xFF4CCB7F),
                    lightColor: const Color(0xFFBCEDCA),
                  ),
                  const SizedBox(height: 12),
                  _estimationRow(
                    label: "Pending",
                    current: 34,
                    total: 100,
                    color: const Color(0xFFFF8A34),
                    lightColor: const Color(0xFFFFF2D9),
                  ),
                  const SizedBox(height: 12),
                  _estimationRow(
                    label: "Rejected",
                    current: 16,
                    total: 100,
                    color: const Color(0xFFE85C55),
                    lightColor: const Color(0xFFFDE6E4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Request Section
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Request"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _requestItem(
                        value: 22,
                        label: "completed",
                        progress: 0.55,
                        progressColor: const Color(0xFF4CCB7F),
                        backgroundColor: const Color(0xFFE6F6EC),
                      ),
                      _requestItem(
                        value: 12,
                        label: "Ongoing",
                        progress: 0.30,
                        progressColor: const Color(0xFF5B6FDB),
                        backgroundColor: const Color(0xFFE5E8F5),
                      ),
                      _requestItem(
                        value: 32,
                        label: "Pending",
                        progress: 0.48,
                        progressColor: const Color(0xFFFF8A34),
                        backgroundColor: const Color(0xFFFFEADB),
                      ),
                      _requestItem(
                        value: 62,
                        label: "Rejected",
                        progress: 0.72,
                        progressColor: const Color(0xFFE85C55),
                        backgroundColor: const Color(0xFFFDE6E4),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Task Card
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

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // User Overview Item Widget
  Widget _userOverviewItem({
    required int value,
    required String label,
    required String subLabel,
    required double progress,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF130703),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF130703),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          subLabel,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF78716C),
          ),
        ),
      ],
    );
  }

  // Estimation Row Widget
  Widget _estimationRow({
    required String label,
    required int current,
    required int total,
    required Color color,
    required Color lightColor,
  }) {
    final progress = (current / total).clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF130703),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 50,
          child: Text(
            "$current/$total",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF130703),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  // Request Item Widget
  Widget _requestItem({
    required int value,
    required String label,
    required double progress,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 7,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            strokeCap: StrokeCap.round,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: progressColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF130703),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: progressColor,
          ),
        ),
      ],
    );
  }

  // Sales Insight Item Widget
  Widget _salesInsightItem({
    required String value,
    required String label,
    required double progress,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: CustomPaint(
            painter: CoustomCircularPercentPainter(
              progress: progress,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF130703),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF130703),
          ),
        ),
      ],
    );
  }
}
