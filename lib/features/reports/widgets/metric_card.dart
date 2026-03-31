// The individual metric cards (Avg Glucose, In Range, Est. A1c)
import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String subValue;
  final Color? subValueColor;

  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.subValue,
    this.subValueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 11)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 4),
          Text(subValue, style: TextStyle(color: subValueColor ?? const Color(0xFF94A3B8), fontSize: 10, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// Reusable Expansion Tile for Trends and Time in Range
class PreviewExpansionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final bool isExpanded;
  final VoidCallback onToggle;
  final Widget child;

  const PreviewExpansionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.isExpanded,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: onToggle,
            leading: Icon(icon, color: iconColor, size: 20),
            title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.grey),
          ),
          if (isExpanded) ...[
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            Padding(padding: const EdgeInsets.all(16), child: child),
          ]
        ],
      ),
    );
  }
}