import 'package:flutter/material.dart';
import '../core/constants/image_const.dart';

class RequestStatusCard extends StatelessWidget {
  final String name;
  final String? phone;
  final String? email;
  final String? jobId;
  final String? progress;
  final String? step;
  final String? reqAmount;
  final String? task;
  final String statusText;
  final Color statusColor;
  final VoidCallback? onTap;

  const RequestStatusCard({
    super.key,
    required this.name,
    this.phone,
    this.email,
    this.jobId,
    this.reqAmount,
    this.task,
    this.progress,
    this.step,
    required this.statusText,
    required this.statusColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.26,
              height: 99,
              child: ClipOval(
                child: Image.asset(ImageConst.manProfileJPG, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 18),

            /// DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (phone != null && phone!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text("Phone No: $phone"),
                  ],

                  const SizedBox(height: 2),
                  const SizedBox(height: 2),

                  if (email != null && email!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Email: ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          TextSpan(
                            text: email!,
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

                  // 🔹 PROGRESS (ONLY PENDING)
                  if (progress != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text("Progress: "),
                        Text(
                          progress!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F8922),
                          ),
                        ),
                      ],
                    ),
                  ],

                  if (jobId != null && jobId!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text("Job ID : $jobId"),
                  ],

                  if (reqAmount != null && reqAmount!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text("Req Amount : $reqAmount"),
                  ],

                  if (step != null) ...[
                    const SizedBox(height: 4),
                    Text("Step $step", style: const TextStyle()),
                  ],

                  if (task != null && task!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text("Task : $task"),
                  ],

                  const SizedBox(height: 6),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Status : ",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            statusText,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14,
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
