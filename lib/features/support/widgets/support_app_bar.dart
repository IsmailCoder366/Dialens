import 'package:flutter/material.dart';

class SupportAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final VoidCallback? onBackPress;

  const SupportAppBar({
    super.key,
    this.title = "Support & Feedback",
    this.height = 110.0, // Increased height for the rounded bottom pocket
    this.onBackPress,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4F39F6), Color(0xFF432DD7)],
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
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.forum_outlined, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// AppBar(
//       backgroundColor: Colors.transparent, // Required to see the gradient below
//       elevation: 0,
//       centerTitle: true,
//       // The gradient and rounded corners are defined here
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [startColor, endColor],
//           ),
//         ),
//       ),
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back, color: Colors.white),
//         onPressed: onBackPress ?? () => Navigator.pop(context),
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.forum_outlined, color: Colors.white),
//           onPressed: () {},
//         ),
//         const SizedBox(width: 8),
//       ],
//     );