import 'package:flutter/material.dart';
import '../core/constants/image_const.dart';

class RequestStatusCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String jobId;
  final String reqAmount;
  final String task;
  final String statusText;
  final Color statusColor;

  const RequestStatusCard({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.jobId,
    required this.reqAmount,
    required this.task,
    required this.statusText,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
                Text("Phone No: $phone"),
                const SizedBox(height: 2),
                const SizedBox(height: 2),

                // YAHAN ADD KARNA HAI
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
                        text: email,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 2),
                Text("Job ID : $jobId"),

                const SizedBox(height: 2),
                Text("Job ID : $jobId"),
                const SizedBox(height: 2),
                Text("Req Amount : $reqAmount"),
                const SizedBox(height: 2),
                Text("Task : $task"),
                const SizedBox(height: 6),

                /// STATUS
                RichText(
                  text: TextSpan(
                    text: "Status : ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: statusText,
                        style: TextStyle(
                          fontSize: 14,
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
