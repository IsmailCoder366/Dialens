import 'package:flutter/material.dart';

class StatGridCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subTitle;
  final Widget icon;
  final Color backgroundColor;

  const StatGridCard({
    super.key,
    required this.title,
    required this.value,
    this.subTitle,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.03)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          if (subTitle != null) ...[
            const SizedBox(height: 4),
            Text(subTitle!, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
          ]
        ],
      ),
    );
  }
}