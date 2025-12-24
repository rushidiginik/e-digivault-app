import 'dart:async';
import 'dart:math';

import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class ResendOtpTimerWidget extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;
  final Color activeColor;
  final Color inactiveColor;

  const ResendOtpTimerWidget({
    super.key,
    this.seconds = 180,
    required this.onResend,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.green,
  });

  @override
  State<ResendOtpTimerWidget> createState() => _ResendOtpTimerWidgetState();
}

class _ResendOtpTimerWidgetState extends State<ResendOtpTimerWidget> {
  late int _remaining;
  Timer? _timer;
  bool isCounting = false;

  @override
  void initState() {
    super.initState();
    _remaining = widget.seconds;
  }

  void startTimer() {
    setState(() {
      isCounting = true;
      _remaining = widget.seconds;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining == 0) {
        setState(() => isCounting = false);
        timer.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// show timer circle
        if (isCounting)
          Row(
            children: [
              Text(
                "0:$_remaining",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              FilledCircularCountDown(
                seconds: widget.seconds,
                size: 18,
                fillColor: AppStyles.primaryColor,
                backgroundColor: AppStyles.black1A.withValues(alpha: 0.02),
                onCompleted: () {
                  setState(() => isCounting = false);
                },
              ),
            ],
          )
        else
          const SizedBox(),

        /// resend button
        GestureDetector(
          onTap:
              isCounting
                  ? null
                  : () {
                    startTimer();
                    widget.onResend();
                  },
          child: Text(
            isCounting ? "Successfully OTP Shared" : "Resend Code",
            style: TextStyle(
              fontSize: 12,
              color: isCounting ? widget.inactiveColor : widget.activeColor,
            ),
          ),
        ),
      ],
    );
  }
}









class FilledCircularCountDown extends StatelessWidget {
  final int seconds;
  final double size;
  final Color fillColor;
  final Color backgroundColor;
  final VoidCallback onCompleted;

  const FilledCircularCountDown({
    super.key,
    required this.seconds,
    required this.onCompleted,
    this.size = 180,
    this.fillColor = Colors.blue,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0), // percentage
      duration: Duration(seconds: seconds),
      onEnd: onCompleted,
      builder: (context, value, child) {
        return CustomPaint(
          size: Size(size, size),
          painter: _FilledCirclePainter(
            progress: value,
            fillColor: fillColor,
            backgroundColor: backgroundColor,
          ),
        );
      },
    );
  }
}

class _FilledCirclePainter extends CustomPainter {
  final double progress; // from 1.0 → 0.0
  final Color fillColor;
  final Color backgroundColor;

  _FilledCirclePainter({
    required this.progress,
    required this.fillColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw background circle
    canvas.drawCircle(center, radius, paint);

    // Draw filled arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    final fillPaint = Paint()..color = fillColor;

    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(rect, -pi / 2, sweepAngle, true, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}