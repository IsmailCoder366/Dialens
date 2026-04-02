import 'package:flutter/material.dart';

class NotificationsPanel extends StatelessWidget {
  const NotificationsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 20),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notifications", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Text("2 unread", style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // --- HEADER ACTIONS ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(child: _buildHeaderButton("Mark All Read")),
                const SizedBox(width: 12),
                Expanded(child: _buildHeaderButton("Clear All")),
              ],
            ),
          ),

          // --- NOTIFICATION LIST ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildNotificationCard(
                  type: "alert",
                  title: "High Glucose Alert",
                  message: "Your glucose reading of 245 mg/dL is above your target range.",
                  time: "15 min ago",
                  actionLabel: "Log Insulin",
                  isUnread: true,
                ),
                _buildNotificationCard(
                  type: "reminder",
                  title: "Dinner Glucose Check",
                  message: "It's time for your post-dinner glucose check.",
                  time: "30 min ago",
                  actionLabel: "Log Now",
                  isUnread: true,
                ),
                _buildNotificationCard(
                  type: "success",
                  title: "7-Day Streak! 🔥",
                  message: "You've logged your glucose every day this week. Keep it up!",
                  time: "2 hours ago",
                  actionLabel: "View Stats",
                ),
                _buildNotificationCard(
                  type: "insight",
                  title: "Pattern Detected",
                  message: "Your post-lunch readings have been 15% higher this week. Consider adjusting meal timing.",
                  time: "5 hours ago",
                  actionLabel: "View Insights",
                ),
                _buildNotificationCard(
                  type: "medication",
                  title: "Evening Medication",
                  message: "Time to take your evening insulin dose.",
                  time: "1 day ago",
                  actionLabel: "Mark Taken",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFE2E8F0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: Colors.white,
      ),
      child: Text(label, style: const TextStyle(color: Color(0xFF1E293B), fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildNotificationCard({
    required String type,
    required String title,
    required String message,
    required String time,
    required String actionLabel,
    bool isUnread = false,
  }) {
    // Determine theme colors based on type
    Color borderColor;
    Color iconColor;
    IconData icon;

    switch (type) {
      case "alert":
        borderColor = const Color(0xFFFECACA); // Red
        iconColor = Colors.red;
        icon = Icons.error_outline;
        break;
      case "reminder":
        borderColor = const Color(0xFFFED7AA); // Orange
        iconColor = Colors.orange;
        icon = Icons.access_time;
        break;
      case "success":
        borderColor = const Color(0xFFBBF7D0); // Green
        iconColor = Colors.green;
        icon = Icons.check_circle_outline;
        break;
      case "insight":
        borderColor = const Color(0xFFE9D5FF); // Purple
        iconColor = Colors.purple;
        icon = Icons.show_chart;
        break;
      default: // medication
        borderColor = const Color(0xFFFED7AA);
        iconColor = Colors.orange;
        icon = Icons.access_time;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B))),
              ),
              if (isUnread)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Color(0xFF2563EB), shape: BoxShape.circle),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, height: 1.4)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Color(0xFF94A3B8)),
                        const SizedBox(width: 4),
                        Text(time, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        actionLabel,
                        style: const TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}