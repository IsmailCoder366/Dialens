import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../widgets/home_action_button.dart';
import '../widgets/recent_entry_tile.dart';
import '../widgets/info_banner_card.dart';
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
                  _buildSectionHeader(
                      
                      icon: Icons.summarize_outlined,
                      "Today's Summary"),
                  const SizedBox(height: 16),

                  // REUSABLE SUMMARY STATS
                  _buildSummaryStatsContainer(),

                  const SizedBox(height: 24),

                  // REUSABLE PURPLE AI CARD
                  const InfoBannerCard(
                    title: "AI Insight",
                    content:
                        "Your post-lunch readings have been higher this week. Consider reducing carbs by 15g.",
                    gradientColors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                  ),

                  const SizedBox(height: 32),
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

                  /// REUSABLE BLUE HBA1C CARD
                  InfoBannerCard(
                    title: "Estimated HbA1c",
                    content:
                        "6.8% ↓ 0.3%\nBased on 30-day average. Great progress!",
                    gradientColors: [
                      const Color(0xFFDBEAFE),
                      const Color(0xFFBFDBFE),
                    ],
                    trailing: _buildHbA1cIcon(),
                  ),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
      ),
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

  Widget _buildSectionHeader(String title, {bool showViewAll = false, IconData? icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if(icon != null) ...[
              Icon(icon, size: 22, color: AppColors.primaryBlue)
            ],
            SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        if (showViewAll)
          TextButton(
            onPressed: () {},
            child: const Text("View All", style: TextStyle(color: Colors.blue)),
          ),
      ],
    );
  }

  Widget _buildHbA1cIcon() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF155DFC),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.trending_up, color: Colors.white),
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
