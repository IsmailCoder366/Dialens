import 'package:flutter/material.dart';

class ChallengesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final VoidCallback? onBackPress;

  const ChallengesAppBar({
    super.key,
    this.title = "Challenges",
    this.height = 110.0, // Custom height to accommodate the rounded corners
    this.onBackPress,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    /// Gradient Colors
    const Color startColor = Color(0xFFE17100);
    const Color endColor = Color(0xFFBB4D00);

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColor, endColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: onBackPress ?? () => Navigator.pop(context),
                ),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                // Trophy/Achievement Icon
                IconButton(
                  icon: const Icon(Icons.emoji_events_outlined, color: Colors.white),
                  onPressed: () {
                    // Navigate to achievements or rankings
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}