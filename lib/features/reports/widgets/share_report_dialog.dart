import 'package:flutter/material.dart';

class ShareReportDialog extends StatefulWidget {
  const ShareReportDialog({super.key});

  @override
  State<ShareReportDialog> createState() => _ShareReportDialogState();
}

class _ShareReportDialogState extends State<ShareReportDialog> {
  // Data state for checkboxes
  final List<Map<String, dynamic>> _recipients = [
    {"name": "Dr. Smith", "email": "dr.smith@healthcare.com", "role": "Doctor", "isSelected": true},
    {"name": "Family Group", "email": "family@example.com", "role": "Family", "isSelected": true},
    {"name": "Sarah (Caregiver)", "email": "sarah@example.com", "role": "Caregiver", "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 8,
      // Prevents full-screen on mobile, keeps it as a centered card
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        // Limits width on web/tablet to match the "Share Report.png" UI
        constraints: const BoxConstraints(maxWidth: 440),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Shrinks dialog to fit content height
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                const Text(
                  "Recipients",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 12),

                // Generates the clickable tiles
                ..._recipients.map((person) => _buildRecipientTile(person)),

                const SizedBox(height: 20),
                const Text(
                  "Message (Optional)",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 8),
                _buildMessageInput(),

                const SizedBox(height: 24),
                _buildFooterActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPER METHODS ---

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Share Report",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, size: 22, color: Color(0xFF64748B)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          "Select recipients to share your health report with",
          style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
        ),
      ],
    );
  }

  Widget _buildRecipientTile(Map<String, dynamic> person) {
    bool selected = person['isSelected'];
    return GestureDetector(
      onTap: () {
        setState(() {
          person['isSelected'] = !person['isSelected'];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF155DFC) : const Color(0xFFE2E8F0),
            width: selected ? 1.5 : 1,
          ),
          color: selected ? const Color(0xFFF8FAFC) : Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: selected,
                onChanged: (val) => setState(() => person['isSelected'] = val),
                activeColor: const Color(0xFF0F172A), // Dark Navy
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(person['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E293B))),
                  Text(person['email'],
                      style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                ],
              ),
            ),
            _buildBadge(person['role']),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Text(
        role,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF64748B)),
      ),
    );
  }

  Widget _buildMessageInput() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "Add a personal message...",
        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF155DFC), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildFooterActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Cancel", style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.w600)),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.send_rounded, size: 18),
          label: const Text("Share Report"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF155DFC),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}