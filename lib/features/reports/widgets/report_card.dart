import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final int pageCount;
  final String fileSize;
  final String timeAgo;
  final List<String>? sharedWith;
  final bool isShared;

  const ReportCard({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    required this.pageCount,
    required this.fileSize,
    required this.timeAgo,
    this.sharedWith,
    this.isShared = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color textNavy = Color(0xFF1E293B);
    const Color textGrey = Color(0xFF64748B);
    const Color borderGrey = Color(0xFFF1F5F9);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Report Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F3FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.description, color: Color(0xFF155DFC), size: 24),
              ),
              const SizedBox(width: 16),
              // Report Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: textNavy)),
                        if (isShared) _buildSharedBadge(),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(date, style: const TextStyle(fontSize: 14, color: textGrey)),
                    const SizedBox(height: 8),
                    // Metadata Row
                    Wrap(
                      spacing: 8,
                      children: [
                        _buildDotInfo(type),
                        _buildDotInfo("$pageCount pages"),
                        _buildDotInfo(fileSize),
                        _buildDotInfo(timeAgo),
                      ],
                    ),
                    if (sharedWith != null && sharedWith!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.people_outline, size: 14, color: textGrey),
                          const SizedBox(width: 4),
                          Text("Shared with: ${sharedWith!.join(', ')}",
                              style: const TextStyle(fontSize: 12, color: textGrey)),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
            ],
          ),
          const SizedBox(height: 16),
          // Action Buttons
          Row(
            children: [
              _buildActionButton(Icons.visibility_outlined, "View"),
              const SizedBox(width: 8),
              _buildActionButton(Icons.file_download_outlined, "Download"),
              const SizedBox(width: 8),
              _buildActionButton(Icons.share_outlined, "Share"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSharedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDCFCE7)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.share, size: 12, color: Color(0xFF22C55E)),
          SizedBox(width: 4),
          Text("Shared",
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF22C55E))),
        ],
      ),
    );
  }

  Widget _buildDotInfo(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
        const SizedBox(width: 4),
        const Text("•", style: TextStyle(color: Color(0xFFCBD5E1))),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF1E293B)),
            const SizedBox(width: 6),
            Text(label,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
          ],
        ),
      ),
    );
  }
}