import 'package:flutter/material.dart';

class EstimateRequestCard extends StatelessWidget {
  final String project;
  final String clientId;
  final String serviceId;
  final String service;
  final String date;
  final String statusText;
  final Color statusColor;
  final String imagePath;
  final VoidCallback? onTap;

  const EstimateRequestCard({
    super.key,
    required this.project,
    required this.clientId,
    required this.serviceId,
    required this.service,
    required this.date,
    required this.statusText,
    required this.statusColor,
    required this.imagePath,
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
              height: 95,
              child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
            ),
            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _labelValue("Project", project),
                  _labelValue("Client ID", clientId),
                  _labelValue("Service ID", serviceId),

                  ///  Service blue color
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14),
                        children: [
                          const TextSpan(
                            text: "Service : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: service,
                            style: const TextStyle(
                              color: Color(0xFF0A66C2), // blue like image
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  _labelValue("Date", date),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Status : ", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Text(
                          statusText,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
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
    );
  }

  Widget _labelValue(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(
              text: "$label : ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
