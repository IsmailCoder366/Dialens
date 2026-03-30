import 'package:flutter/material.dart';

class ReportTemplateCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pages; // Added per Container.png
  final String sections; // Added per Container.png
  final IconData icon;
  final bool isSelected;
  final bool isPopular;
  final List<String>? tags; // Added for the "Included sections" row
  final VoidCallback onTap;

  const ReportTemplateCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pages,
    required this.sections,
    required this.icon,
    required this.isSelected,
    this.isPopular = false,
    this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffEFF6FF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF155DFC) : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.blue.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon Box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: const Color(0xFF155DFC), size: 24),
                ),
                const SizedBox(width: 12),
                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          if (isPopular) _buildPopularBadge(),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                      const SizedBox(height: 6),
                      // Meta Info (Pages & Sections)
                      Row(
                        children: [
                          Icon(Icons.description_outlined, size: 14, color: Colors.grey.shade400),
                          const SizedBox(width: 4),
                          Text(pages, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                          const SizedBox(width: 16),
                          Text(sections, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                // Selection Indicator
                Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: isSelected ? const Color(0xFF155DFC) : Colors.grey.shade300,
                  size: 24,
                ),
              ],
            ),
            // Expanded Tag Section (Only shows if isSelected is true)
            if (isSelected) ...[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(color: Color(0xFFF1F5F9), height: 1),
              ),
              const Text("Included sections:",
                  style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: (tags ?? ["Key stats", "Latest readings"]).map((tag) => _buildTag(tag)).toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildPopularBadge() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(6)),
      child: const Text("Popular", style: TextStyle(color: Color(0xFFD97706), fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Text(label, style: const TextStyle(color: Color(0xFF155DFC), fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}