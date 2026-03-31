import 'package:flutter/material.dart';

class RecipientSelectionTile extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const RecipientSelectionTile({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          // Custom Styled Checkbox
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: isSelected,
              onChanged: onChanged,
              activeColor: const Color(0xFF0F172A), // Dark navy from image
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 12),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E293B))),
                Text(email,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
              ],
            ),
          ),
          // Role Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Text(
              role,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF64748B)),
            ),
          ),
        ],
      ),
    );
  }
}