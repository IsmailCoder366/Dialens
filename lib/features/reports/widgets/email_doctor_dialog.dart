import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/reports_provider.dart';

class EmailDoctorDialog extends StatelessWidget {
  const EmailDoctorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ReportsProvider>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildSectionTitle("Recipient"),
            const SizedBox(height: 8),
            _buildRecipientBox(),
            const SizedBox(height: 20),
            _buildSectionTitle("Message"),
            const SizedBox(height: 8),
            _buildMessageInput(provider.defaultMessage),
            const SizedBox(height: 24),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns X icon to the top of the text
      children: [
        Expanded(
          child: Column(
            // FIX: This pushes the text to the left side
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Email to Doctor",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Send your report directly to your healthcare provider",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8), // Brief gap between text and icon
        IconButton(
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.close, size: 20, color: Color(0xFF64748B)),
        )
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)));
  }

  Widget _buildRecipientBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF), // Light blue background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF155DFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.medical_services_outlined, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dr. Smith", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text("dr.smith@healthcare.com", style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMessageInput(String initialText) {
    return TextFormField(
      initialValue: initialText,
      maxLines: 5,
      style: const TextStyle(fontSize: 14, color: Color(0xFF64748B), height: 1.5),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          child: const Text("Cancel", style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.w600)),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.email_outlined, size: 18),
          label: const Text("Send Email"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF155DFC),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
        ),
      ],
    );
  }
}