import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../widgets/common_header.dart';

class CreateInvoiceScreenAc extends StatefulWidget {
  const CreateInvoiceScreenAc({super.key});

  @override
  State<CreateInvoiceScreenAc> createState() => _CreateInvoiceScreenAcState();
}

class _CreateInvoiceScreenAcState extends State<CreateInvoiceScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonHeader(title: 'Create Invoice', showBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _readOnlyField(label: 'Client Name', value: 'Rajesh Kumar'),
                _readOnlyField(label: 'Service', value: 'E-Katha'),
                _readOnlyField(label: 'Job ID', value: 'JB-452342'),
                _readOnlyField(
                  label: 'Type Address',
                  value: 'Malleshwaram, Banglore',
                ),
                _readOnlyField(label: 'Type Date', value: '14-02-2025'),
                _readOnlyField(label: 'Total Amount', value: '250A'),
                _readOnlyField(label: 'Type Description', value: 'Description'),
                _readOnlyField(label: 'Select BD', value: 'Mahesh'),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 14,
                    ),
                    backgroundColor: const Color(0xFF0052CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    context.pushNamed('acInvoiceEdit',
                      extra: "status",
                    );
                  },
                  child: const Text(
                    'Verify Invoice',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20), // bottom breathing space
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _readOnlyField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF0B4EDB), width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(value, style: const TextStyle(fontSize: 16)),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
