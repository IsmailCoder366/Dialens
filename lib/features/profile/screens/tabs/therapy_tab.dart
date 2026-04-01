import 'package:flutter/material.dart';
import '../../../stat/widgets/action_card.dart';

class TherapyTab extends StatelessWidget {
  const TherapyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // --- DIABETES PROFILE SECTION ---
        const Text("Diabetes Profile",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownField("Diabetes Type", "Type 1"),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildDataField("Year of Diagnosis", "2010")),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDropdownField("Sex", "Male")),
                ],
              ),
              const SizedBox(height: 16),
              _buildDropdownField("Insulin Therapy Method", "Insulin Pump"),
              const SizedBox(height: 16),
              _buildToggleRow("Pills/Medications", "Track oral medications", true),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- UNIT PREFERENCES SECTION ---
        const Text("Unit Preferences",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Column(
            children: [
              _buildDropdownField("Glucose Unit", "mg/dL"),
              const SizedBox(height: 16),
              _buildDropdownField("Carbohydrate Unit", "Grams (g)"),
              const SizedBox(height: 16),
              _buildDropdownField("A1c Unit", "Percent (%)"),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- GLUCOSE THRESHOLDS SECTION ---
        const Text("Glucose Thresholds",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Column(
            children: [
              _buildInfoBox("These ranges affect your graphs and statistics. The \"Very Low\" threshold is locked for medical safety."),
              const SizedBox(height: 20),
              _buildThresholdInput("Very High Threshold", "250", "mg/dL", Colors.red),
              const SizedBox(height: 16),
              _buildTargetRangeInput("Target Range", "70", "180"),
              const SizedBox(height: 16),
              _buildThresholdInput("Very Low Threshold", "54", "mg/dL", Colors.red, isLocked: true),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text("Locked for medical safety", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- BODY METRICS SECTION ---
        const Text("Body Metrics",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildMetricInput("Current Weight", "165", "lbs")),
                  const SizedBox(width: 12),
                  Expanded(child: _buildMetricInput("Target Weight", "160", "lbs")),
                ],
              ),
              const SizedBox(height: 16),
              _buildMetricInput("Height", "175", "cm"),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  // --- REUSABLE COMPONENT BUILDERS ---

  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              icon: const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
              items: [value].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (_) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: Text(value, style: const TextStyle(color: Color(0xFF1E293B))),
        ),
      ],
    );
  }

  Widget _buildToggleRow(String title, String subtitle, bool value) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text(subtitle, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            ],
          ),
        ),
        Switch.adaptive(
          value: value,
          activeColor: const Color(0xFF155DFC),
          onChanged: (val) {},
        ),
      ],
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF155DFC), size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF1E40AF), fontSize: 13))),
        ],
      ),
    );
  }

  Widget _buildThresholdInput(String label, String value, String unit, Color dotColor, {bool isLocked = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 4, backgroundColor: dotColor),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Text(value, style: TextStyle(color: isLocked ? const Color(0xFF94A3B8) : const Color(0xFF1E293B))),
              ),
            ),
            const SizedBox(width: 12),
            Text(unit, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
            if (isLocked) ...[
              const SizedBox(width: 8),
              const Icon(Icons.lock_outline, size: 16, color: Color(0xFFCBD5E1)),
            ]
          ],
        ),
      ],
    );
  }

  Widget _buildTargetRangeInput(String label, String low, String high) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 4, backgroundColor: Colors.green),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildDataField("", low)),
            const SizedBox(width: 12),
            Expanded(child: _buildDataField("", high)),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricInput(String label, String value, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(child: _buildDataField("", value)),
            const SizedBox(width: 12),
            Text(unit, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
          ],
        ),
      ],
    );
  }
}