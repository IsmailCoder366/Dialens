import 'package:flutter/material.dart';

class HomeActionButton extends StatelessWidget {
  final String images;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const HomeActionButton({
    super.key,
    required this.images,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 82,
            width: 89,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image(image: AssetImage(images))
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}