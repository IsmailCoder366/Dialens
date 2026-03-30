import 'package:dialens/features/reports/provider/reports_provider.dart';
import 'package:dialens/features/reports/widgets/report_template_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Reports", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.file_download_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text("Create and share professional health reports", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 16),

            // 1. Time Tabs (Reuse logic from Insights)
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
                    child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
            _buildSectionLabel("Report Templates", showStar: true),
            const SizedBox(height: 16),

            // 2. Dynamic Template Cards
            ReportTemplateCard(
              title: "Quick Summary",
              subtitle: "Essential metrics for daily review",
              icon: Icons.bolt_rounded,
              isSelected: provider.selectedTemplate == "Quick Summary",
              onTap: () => provider.setTemplate("Quick Summary"),
            ),
            ReportTemplateCard(
              title: "Comprehensive Report",
              subtitle: "Complete overview for medical appointments",
              icon: Icons.assignment_outlined,
              isPopular: true,
              isSelected: provider.selectedTemplate == "Comprehensive Report",
              onTap: () => provider.setTemplate("Comprehensive Report"),
            ),

            const SizedBox(height: 24),
            _buildSectionLabel("Recent Reports", actionText: "View All"),
            const SizedBox(height: 16),

            // Add your PDF tile here...
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text, {bool showStar = false, String? actionText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (showStar) const Icon(Icons.star, color: Colors.orange, size: 16),
          ],
        ),
        if (actionText != null)
          Text(actionText, style: const TextStyle(color: Color(0xFF155DFC), fontWeight: FontWeight.bold)),
      ],
    );
  }
}