import 'package:dialens/core/app_colors.dart';
import 'package:flutter/material.dart';

class RecentEntryTile extends StatelessWidget {
  final String title;
  final String time;
  final String value;
  final String mealType;
  final bool isInRange;

  const RecentEntryTile({
    super.key,
    required this.title,
    required this.time,
    required this.value,
    this.mealType = "Lunch",
    this.isInRange = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // The green glucose value box
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:  AppColors.lightgreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    value.split(' ')[0], // Extract only the number
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('md/dL', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 2),
                Text("$time • $mealType", style: TextStyle(color: Colors.grey[500], fontSize: 13)),
              ],
            ),
          ),
          // Conditional "In Range" badge
          if (isInRange)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFD1FAE5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "In Range",
                style: TextStyle(color: Color(0xFF065F46), fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}