import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../provider/reports_provider.dart';
import '../widgets/email_doctor_dialog.dart';
import '../widgets/glucose_graph.dart';
import '../widgets/metric_card.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/report_template_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReportsProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF155DFC),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () {}),
        title: const Text("Reports", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.file_download_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create and share professional health reports", style: TextStyle(color: AppColors.primaryBlue, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),


            ///  ---Time Tabs---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ["Day", "Week", "Month", "3 Months"].map((label) {
                bool isSelected = provider.selectedPeriod == label;
                return GestureDetector(
                  onTap: () => provider.setPeriod(label),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF155DFC) : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(label,
                        style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),


            /// ---Report Header---
            _buildHeader("Report Templates", showPopularBadge: true),
            const SizedBox(height: 16),


            /// ---Report Section---
            ReportTemplateCard(
              title: "Quick Summary",
              subtitle: "Essential metrics for daily review",
              pages: "1 page",          // Added
              sections: "2 sections",   // Added
              icon: Icons.flash_on_rounded,
              isSelected: provider.selectedTemplate == "Quick Summary",
              tags: const ["Key stats", "Latest readings"], // Optional: Add specific tags
              onTap: () => provider.setTemplate("Quick Summary"),
            ),
            ReportTemplateCard(
              title: "Comprehensive Report",
              subtitle: "Complete overview for medical appointments",
              pages: "4 pages",         // Added
              sections: "5 sections",   // Added
              icon: Icons.description_outlined,
              isPopular: true,
              isSelected: provider.selectedTemplate == "Comprehensive Report",
              onTap: () => provider.setTemplate("Comprehensive Report"),
            ),
            ReportTemplateCard(
              title: "Clinical Report",
              subtitle: "Detailed medical data for healthcare providers",
              pages: "6 pages",
              sections: "4 sections",
              icon: Icons.medical_services_outlined,
              isSelected: provider.selectedTemplate == "Clinical Report",
              onTap: () => provider.setTemplate("Clinical Report"),
            ),
            ReportTemplateCard(
              title: "Pattern Analysis",
              subtitle: "Focus on daily patterns and trends",
              pages: "3 pages",
              sections: "3 sections",
              icon: Icons.analytics,
              isSelected: provider.selectedTemplate == "Pattern Analysis",
              onTap: () => provider.setTemplate("Pattern Analysis"),
            ),
            const SizedBox(height: 30),

            /// ---Report Preview Card ---
            _buildReportPreview(provider),

            const SizedBox(height: 30),
            _buildHeader("Quick Actions"),
            const SizedBox(height: 16),
            Row(
              children: [
                QuickActionButton(
                  icon: Icons.inbox, // Matches the icon in Container (2).png
                  label: "Email to Doctor",
                  iconColor:  AppColors.primaryBlue, // Purple
                  iconBgColor: const Color(0xFFF5F3FF), // Soft Purple
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true, // Allows clicking outside to close
                      builder: (BuildContext context) {
                        return const EmailDoctorDialog();
                      },
                    );
                  },
                ),
                const SizedBox(width: 12),
                QuickActionButton(
                  icon: Icons.person,
                  label: "Share with the Family",
                  iconColor: const Color(0xFF00A63E), // Orange
                  iconBgColor: const Color(0xFFFFF7ED), // Soft Orange
                  onTap: () => print("Print Pressed"),
                ),
              ],
            ),
            const SizedBox(height: 12),
             Row(
              children: [
                QuickActionButton(
                  icon: Icons.file_download_outlined, // Matches the icon in Container (2).png
                  label: "Download PDF",
                  iconColor: const Color(0xFF9333EA), // Purple
                  iconBgColor: const Color(0xFFF5F3FF), // Soft Purple
                  onTap: () => print("Download Pressed"),
                ),
                const SizedBox(width: 12),
                QuickActionButton(
                  icon: Icons.print_outlined,
                  label: "Print Report",
                  iconColor: const Color(0xFFEA580C), // Orange
                  iconBgColor: const Color(0xFFFFF7ED), // Soft Orange
                  onTap: () => print("Print Pressed"),
                ),
              ],
            ),

            const SizedBox(height: 30),
            _buildHeader("Recent Reports", actionText: "View All", onActionTap: () {}),
            const SizedBox(height: 16),
            _buildRecentTile("Weekly Report", "Dec 2-8, 2024", Colors.blue),
            _buildRecentTile("Monthly Report", "November 2024", Colors.purple),

            const SizedBox(height: 30),

            // --- NEW: Schedule Recurring Reports Card ---
            _buildScheduleCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// --- UI HELPER METHODS ---

  Widget _buildHeader(
      String title, {
        bool showPopularBadge = false, // For the "Popular" star badge
        String? actionText,            // For "Today", "View All", etc.
        VoidCallback? onActionTap,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1. Title (Left Side)
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // 2. Right Side Logic
        if (showPopularBadge)
        // Styled Badge for "Report Templates" section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 14),
                SizedBox(width: 4),
                Text(
                  "Popular",
                  style: TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        else if (actionText != null)
        // Plain text for "Report Preview" (Today) or "Recent Reports" (View All)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText,
              style: TextStyle(
                // Change color based on whether it's a link (View All) or label (Today)
                color: actionText == "Today"
                    ? Colors.grey.shade500
                    : const Color(0xFF155DFC),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
  Widget _buildReportPreview(ReportsProvider provider) {
    return Column(
      children: [
        _buildHeader("Report Preview", actionText: "Today"),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: Column(
            children: [
              // 1. Top Summary Card
              _buildSummaryCard(provider),

              // 2. Glucose Trends
              PreviewExpansionTile(
                title: "Glucose Trends",
                icon: Icons.trending_up,
                iconColor: Colors.blue,
                isExpanded: provider.isGlucoseTrendsExpanded,
                onToggle: provider.toggleGlucoseTrends,
                child: Column(
                  children: [
                    // FIX: Call the real pixel-perfect graph instead of an image
                    GlucoseTrendGraph(spots: provider.graphData),

                    const SizedBox(height: 12),
                    const Text(
                        "7-day average glucose trend",
                        style: TextStyle(color: Colors.grey, fontSize: 11)
                    ),
                  ],
                ),
              ),

              // 3. Time in Range
              PreviewExpansionTile(
                title: "Time in Range",
                icon: Icons.track_changes,
                iconColor: Colors.green,
                isExpanded: provider.isTimeInRangeExpanded,
                onToggle: provider.toggleTimeInRange,
                child: _buildTimeInRangeContent(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(ReportsProvider provider) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(provider.selectedTemplate, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text("December 2-8, 2024", style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                ],
              ),
              _buildStatusBadge(provider.previewStatus),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: MetricCard(label: "Avg Glucose", value: "128", subValue: "mg/dL")),
              Expanded(child: MetricCard(label: "In Range", value: "72%", subValue: "Target: 70%", subValueColor: Colors.green)),
              Expanded(child: MetricCard(label: "Est. A1c", value: "6.2%", subValue: "↓ 0.3", subValueColor: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 12),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildTimeInRangeContent() {
    return const Column(
      children: [
        _RangeRow(label: "In Range (70-180)", value: "72%", color: Colors.green),
        SizedBox(height: 12),
        _RangeRow(label: "Above Range", value: "18%", color: Colors.orange),
        SizedBox(height: 12),
        _RangeRow(label: "Below Range", value: "10%", color: Colors.red),
      ],
    );
  }

  Widget _buildScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.calendar_today_outlined, color: Color(0xFF155DFC), size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Schedule Recurring Reports",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Automatically generate and email reports to your healthcare team every week or month.",
            style: TextStyle(color: Colors.blueGrey, fontSize: 13),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF155DFC),
                elevation: 0,
                side: const BorderSide(color: Color(0xFF155DFC)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Set Up Schedule"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTile(String title, String date, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(Icons.picture_as_pdf, color: iconColor, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}

class _RangeRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _RangeRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // The Colored Dot from Card.png
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          // The Label (e.g., In Range (70-180))
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // The Percentage Value
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1E293B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}