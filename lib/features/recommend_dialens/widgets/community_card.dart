import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final String title;
  final String description;
  final String rating;
  final String trustLabel;
  final VoidCallback? onTap;

  const CommunityCard({
    super.key,
    this.title = "Join Our Community",
    this.description = "Over 50,000 people are already managing their diabetes better with Dialens",
    this.rating = "4.8★ Rating",
    this.trustLabel = "Trusted",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( // Making the whole card tappable to join
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // Specific light lavender/blue gradient used in the footer
          gradient: const LinearGradient(
            colors: [Color(0xFFEFF6FF), Color(0xFFFAF5FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFF1F5F9)), // Subtle border
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.people_outline, color: Color(0xFF8B5CF6)),
                ),
                const SizedBox(width: 16),
                // Text Content Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Badges Row
            Row(
              children: [
                _buildBadge(Icons.star, rating, const Color(0xFFEFF6FF), Colors.blue),
                const SizedBox(width: 12),
                _buildBadge(Icons.check_circle_outline, trustLabel, const Color(0xFFFAF5FF), Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE BADGE BUILDER ---
  Widget _buildBadge(IconData icon, String label, Color bg, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: iconColor, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}