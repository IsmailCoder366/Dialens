import 'package:flutter/material.dart';

class ScheduleReportsDialog extends StatefulWidget {
  const ScheduleReportsDialog({super.key});

  @override
  State<ScheduleReportsDialog> createState() => _ScheduleReportsDialogState();
}

class _ScheduleReportsDialogState extends State<ScheduleReportsDialog> {
  String selectedFrequency = 'Weekly'; // Default selection from UI
  final List<Map<String, dynamic>> _recipients = [
    {"name": "Dr. Smith", "email": "dr.smith@healthcare.com", "isSelected": false},
    {"name": "Family Group", "email": "family@example.com", "isSelected": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle("Frequency"),
              const SizedBox(height: 12),
              _buildFrequencyOption("Weekly", "Every Monday at 9:00 AM"),
              const SizedBox(height: 12),
              _buildFrequencyOption("Monthly", "First day of each month"),
              const SizedBox(height: 24),
              _buildSectionTitle("Send to"),
              const SizedBox(height: 12),
              ..._recipients.map((person) => _buildRecipientTile(person)),
              const SizedBox(height: 24),
              _buildFooterActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Schedule Recurring Reports",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, size: 22, color: Color(0xFF64748B)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text("Automatically generate and send reports on a regular schedule",
            style: TextStyle(fontSize: 14, color: Color(0xFF64748B))),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)));
  }

  Widget _buildFrequencyOption(String title, String subtitle) {
    bool isSelected = selectedFrequency == title;
    return GestureDetector(
      onTap: () => setState(() => selectedFrequency = title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF155DFC) : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
              ],
            ),
            if (isSelected) const Icon(Icons.check, color: Color(0xFF155DFC), size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipientTile(Map<String, dynamic> person) {
    return GestureDetector(
      onTap: () => setState(() => person['isSelected'] = !person['isSelected']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Checkbox(
              value: person['isSelected'],
              onChanged: (val) => setState(() => person['isSelected'] = val),
              activeColor: const Color(0xFF0F172A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(person['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(person['email'], style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Cancel Button
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Cancel",
              style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.w600)),
        ),
        const SizedBox(width: 10),
        // Schedule Button wrapped in Flexible
        Flexible(
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.access_time, size: 18),
            label: const Text(
              "Schedule Reports",
              overflow: TextOverflow.ellipsis, // Prevents text from pushing past edge
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF155DFC),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}