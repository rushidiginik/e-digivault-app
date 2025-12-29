import 'package:e_digivault_org_app/roles/Accountant/UserAc/browse_users/client_ac/client_screen_ac.dart';
import 'package:e_digivault_org_app/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/constants/app_common_text.dart';
import '../../../core/constants/theme.dart';
import '../../../widgets/card_header.dart';
import '../../../widgets/common_header.dart';
import '../../../widgets/coustom_circular_percent_painter.dart';
import '../../../widgets/custom_progres_bar.dart';
import 'browse_users/business_screen_ac.dart';
import 'browse_users/delivery_partner_screen_ac.dart';
import 'browse_users/incharge_ac/incharge_screen_ac.dart';
import 'browse_users/mra_ac/mra_screen_ac.dart';
import 'browse_users/regional_head_ac/regional_head_screen_ac.dart';
import 'browse_users/state_head_ac/state_head_screen_ac.dart';

class UserScreenAc extends StatefulWidget {
  const UserScreenAc({super.key});

  @override
  State<UserScreenAc> createState() => _UserScreenAcState();
}

class _UserScreenAcState extends State<UserScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'User', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(title: "Clients Sales Insights"),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // CIRCULAR INDICATOR
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CustomPaint(
                                painter: CoustomCircularPercentPainter(
                                  progress: 0.32, // 32%
                                  progressColor: const Color(0xFF2E7D32),
                                  backgroundColor: const Color(0xFFBCEDCA),
                                ),
                              ),
                            ),

                            const SizedBox(height: 3),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(width: 6),
                                Text(
                                  "56",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Estimates",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF130703),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // CIRCULAR INDICATOR
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CustomPaint(
                                painter: CoustomCircularPercentPainter(
                                  progress: 0.32, // 32%
                                  progressColor: const Color(0xFFF57F17),
                                  backgroundColor: const Color(0xFFF5E4AD),
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(width: 6),
                                Text(
                                  "24",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Proposals",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF130703),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // CIRCULAR INDICATOR
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CustomPaint(
                                painter: CoustomCircularPercentPainter(
                                  progress: 0.32, // 32%
                                  progressColor: const Color(0xFF2F75C5),
                                  backgroundColor: const Color(0xFFDDE1EA),
                                ),
                              ),
                            ),

                            const SizedBox(height: 3),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(width: 6),
                                Text(
                                  "16",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Invoices",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF130703),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: const Color(0x1A000000), thickness: 2),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 29.0),
                child: Text(
                  "Browse Users",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: const Color(0x1A000000), thickness: 2),
            ),
            SizedBox(height: 6),
            CustomCardWidget(
              title: "Client",
              count: "12",
              newCount: "12 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acClient');
              },
            ),
            CustomCardWidget(
              title: "State Head",
              count: "4",
              newCount: "0 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acStateHead');
              },
            ),
            CustomCardWidget(
              title: "Regional Head",
              count: "6",
              newCount: "2 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acRegionalHead');
              },
            ),
            CustomCardWidget(
              title: "Incharge",
              count: "7",
              newCount: "3 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acIncharge');
              },
            ),
            CustomCardWidget(
              title: "MRA",
              count: "6",
              newCount: "2 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acMra');
              },
            ),
            CustomCardWidget(
              title: "Delivery Partner",
              count: "3",
              newCount: "0 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acDeliveryPartner');
              },
            ),
            CustomCardWidget(
              title: "Business Development",
              count: "6",
              newCount: "2 New",
              newColor: Colors.green,
              onTap: () {
                context.pushNamed('acBusiness');
              },
            ),
          ],
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
