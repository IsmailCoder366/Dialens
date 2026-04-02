import 'package:flutter/material.dart';

class SelectionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionTile({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF2563EB) : const Color(0xFFF1F5F9)),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF475569), size: 20),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF475569))),
          ],
        ),
      ),
    );
  }
}