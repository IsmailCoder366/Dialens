import 'package:flutter/material.dart';

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? availability;
  final Color iconBgColor;

  const SupportTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.availability,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: Colors.indigo, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                if (availability != null)
                  Text(availability!, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.open_in_new, color: Color(0xFFCBD5E1), size: 18),
        ],
      ),
    );
  }
}