import 'package:flutter/material.dart';

class HbA1cCard extends StatelessWidget {
  final double percentage;
  final double decrease;
  final VoidCallback onTap;

  const HbA1cCard({
    super.key,
    required this.percentage,
    required this.decrease,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF), // Light blue background from image
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Estimated HbA1c",
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "$percentage%",
                        style: const TextStyle(
                          color: Color(0xFF1E3A8A),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_downward, size: 16, color: Color(0xFF64748B)),
                      Text(
                        "$decrease%",
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // The floating-style blue icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFF155DFC),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Footer text with arrow
          InkWell(
            onTap: onTap,
            child: Row(
              children: const [
                Text(
                  "Based on 30-day average. Great progress!",
                  style: TextStyle(
                    color: Color(0xFF155DFC),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF155DFC),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}