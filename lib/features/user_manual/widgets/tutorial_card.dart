import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String duration;
  final VoidCallback? onTap; // Added for interactivity

  const TutorialCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( // Wrapped in InkWell to handle taps
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Row(
          children: [
            // Icon Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3E8FF),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Icon(icon, color: const Color(0xFF9333EA)),
            ),
            const SizedBox(width: 16),

            // Text Content Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
                  ),
                  Text(
                      subtitle,
                      style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.play_circle_outline, size: 14, color: Color(0xFF9333EA)),
                      const SizedBox(width: 4),
                      Text(
                          duration,
                          style: const TextStyle(
                              color: Color(0xFF9333EA),
                              fontSize: 11,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),

            // --- TRAILING ICON ADDED HERE ---
            const Icon(
              Icons.chevron_right,
              color: Color(0xFFCBD5E1), // Subtle grey matching your browse topics
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}