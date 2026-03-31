import 'package:flutter/material.dart';

class ExportFormatDialog extends StatefulWidget {
  const ExportFormatDialog({super.key});

  @override
  State<ExportFormatDialog> createState() => _ExportFormatDialogState();
}

class _ExportFormatDialogState extends State<ExportFormatDialog> {
  String selectedFormat = 'pdf'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Export Format",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 22, color: Color(0xFF64748B)),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text("Choose your preferred export format",
                  style: TextStyle(fontSize: 14, color: Color(0xFF64748B))),

              const SizedBox(height: 24),

              // PDF Option
              _buildFormatOption(
                id: 'pdf',
                title: "PDF Document",
                subtitle: "Best for sharing and printing",
                icon: Icons.description,
                iconColor: const Color(0xFF155DFC),
              ),

              const SizedBox(height: 12),

              // CSV Option
              _buildFormatOption(
                id: 'csv',
                title: "CSV Spreadsheet",
                subtitle: "For data analysis in Excel",
                icon: Icons.insert_drive_file_outlined,
                iconColor: const Color(0xFF64748B),
              ),

              const SizedBox(height: 24),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Cancel", style: TextStyle(color: Color(0xFF1E293B))),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.file_download_outlined, size: 18),
                    label: const Text("Download"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF155DFC),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormatOption({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    bool isSelected = selectedFormat == id;

    return GestureDetector(
      onTap: () => setState(() => selectedFormat = id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF155DFC) : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF155DFC) : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: isSelected ? Colors.white : iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Color(0xFF155DFC), size: 24),
          ],
        ),
      ),
    );
  }
}