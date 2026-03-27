import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../widgets/hb_a1c_card.dart';
import '../widgets/home_action_button.dart';
import '../widgets/recent_entry_tile.dart';
import '../widgets/ai_insight_card.dart';
import '../widgets/reminder_card.dart';
import '../widgets/summary_metrics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// ---THE BLUE HEADER SECTION ---
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 32,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF155DFC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                _buildTopBar(),
                const SizedBox(height: 24),
                _buildLatestGlucoseCard(), // Green main card
                const SizedBox(height: 24),

                /// REUSABLE ACTION BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeActionButton(
                      images: 'assets/images/Glucose.png',
                      label: "Glucose",
                      color: Colors.redAccent,
                      onTap: () {},
                    ),
                    SizedBox(width: 3),
                    HomeActionButton(
                      images: 'assets/images/Meal.png',
                      label: "Meal",
                      color: Colors.orange,
                      onTap: () {},
                    ),
                    SizedBox(width: 3),
                    HomeActionButton(
                      images: 'assets/images/Insulin.png',
                      label: "Insulin",
                      color: Colors.blueAccent,
                      onTap: () {},
                    ),
                    SizedBox(width: 3),
                    HomeActionButton(
                      images: 'assets/images/Activity.png',
                      label: "Activity",
                      color: Colors.greenAccent,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// --- THE SCROLLABLE BODY SECTION ---
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Section Header
                  buildCard(),

                  const SizedBox(height: 24),

                  ///  AI Insight Card
                  buildAiInsightCard(),

                  const SizedBox(height: 32),

                  /// Recall Section Header
                  _buildSectionHeader("Recent Entries", showViewAll: true),
                  const SizedBox(height: 16),

                  /// REUSABLE ENTRY TILES
                  const RecentEntryTile(
                    title: "Post-meal",
                    time: "15 min ago",
                    value: "145 mg/dL",
                  ),
                  const RecentEntryTile(
                    title: "Pre-meal",
                    time: "2 hours ago",
                    value: "98 mg/dL",
                  ),
                  const RecentEntryTile(
                    title: "Morning",
                    time: "5 hours ago",
                    value: "112 mg/dL",
                  ),

                  const SizedBox(height: 24),

                  /// HBA1C CARD
                  HbA1cCard(
                    percentage: 6.8,
                    decrease: 0.3,
                    onTap: () {
                      // Navigate to detailed HbA1c report
                    },
                  ),
                  const SizedBox(height: 16),

                  /// Reminder Card
                  ReminderCard(
                    title: "Dinner glucose check",
                    time: "Today at 6:30 PM",
                    onTap: () {
                      // Handle reminder action
                    },
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      /// FAB for the center '+' button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF155DFC),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  /// AI Insight Card Widget
  AIInsightCard buildAiInsightCard() {
    return const AIInsightCard(
      icon: Icons.insights,
      title: "AI Insight",
      content:
          "Your post-lunch readings have been higher this week. Consider reducing carbs by 15g or adjusting insulin timing.",
      gradientColors: [Color(0xFFAD46FF), Color(0xFF4F39F6)],
      trailing: Icons.arrow_forward_ios,
    );
  }

  /// Section Header Widget
  Widget buildCard() {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildSectionHeader(
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.summarize_outlined,
              "Today's Summary",
            ),

            const SizedBox(height: 16),

            /// REUSABLE SUMMARY STATS
            _buildSummaryStatsContainer(),
          ],
        ),
      ),
    );
  }

  /// --- HELPER METHODS ---

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Good morning,",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Text(
              "Sarah",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Image(
              image: AssetImage('assets/images/search_button.png'),
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Image(
              image: AssetImage('assets/images/notification_button.png'),
              width: 40,
              height: 40,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLatestGlucoseCard() {
    return Container(
      height: 116,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightgreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Glucose",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "15 mins ago",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "145 mg/dL",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "In Range",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStatsContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SummaryMetric(
            label: "Average",
            value: "132",
            icon: Icons.trending_up,
            iconColor: Colors.blue,
          ),
          SummaryMetric(
            label: "In Range",
            value: "68%",
            icon: Icons.center_focus_strong,
            iconColor: Colors.green,
          ),
          SummaryMetric(
            label: "Entries",
            value: "8",
            icon: Icons.bolt,
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title, {
    bool showViewAll = false,
    IconData? leadingIcon,
    IconData? trailingIcon,
    VoidCallback? onHeaderPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (leadingIcon != null) ...[
              Icon(leadingIcon, size: 25, color: AppColors.primaryBlue),
            ],
            SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        if (showViewAll)
          TextButton(
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(color: AppColors.primaryBlue),
            ),
          ),
        if (trailingIcon != null) ...[
          const SizedBox(width: 4),
          Icon(trailingIcon, size: 16, color: AppColors.primaryBlue),
        ],
      ],
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF155DFC)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart, color: Colors.grey),
            onPressed: () {},
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: const Icon(Icons.description, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
