import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralCard extends StatelessWidget {
  final String code;
  final String link;

  const ReferralCard({super.key, required this.code, required this.link});

  @override
  Widget build(BuildContext context) {
    const pinkPrimary = Color(0xFFE91E63);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: pinkPrimary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Referral Code", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(code, style: const TextStyle(color: pinkPrimary, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              IconButton(
                onPressed: () => Clipboard.setData(ClipboardData(text: code)),
                icon: const Icon(Icons.copy, color: pinkPrimary),
                style: IconButton.styleFrom(backgroundColor: pinkPrimary.withOpacity(0.1)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text("Share this code with friends to get started", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
          const SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(child: Text(link, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12), overflow: TextOverflow.ellipsis)),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Clipboard.setData(ClipboardData(text: link)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pinkPrimary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text("Copy"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}