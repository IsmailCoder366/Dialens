import 'package:flutter/material.dart';

class AIInsightCard extends StatelessWidget {
  final String title;
  final String content;
  final List<Color> gradientColors;
  final IconData? trailing;
  final IconData? icon;

  const AIInsightCard({
    super.key,
    required this.title,
    required this.content,
    required this.gradientColors,
    this.trailing,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (icon != null) ...[
            Icon(icon, color: Colors.white.withOpacity(0.8), size: 24),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 12),
            Icon(trailing, color: Colors.white, size: 15)
          ],
        ],
      ),
    );
  }
}