import 'package:flutter/material.dart';

class CarbsLogScreen extends StatelessWidget {
  const CarbsLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFE44A00); // Signature orange for Carbs

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Carbs & Meals", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.camera_alt, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- TOTAL CARBOHYDRATES INPUT ---
            _buildSectionCard(
              title: "Total Carbohydrates",
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("271", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                      Text("grams", style: TextStyle(color: Color(0xFF94A3B8))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["15g", "30g", "45g", "60g"]
                        .map((val) => _buildQuickGramChip(val))
                        .toList(),
                  ),
                ],
              ),
            ),

            // --- MEAL TYPE SELECTOR ---
            _buildSectionCard(
              title: "Meal Type",
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
                children: [
                  _buildMealTile(Icons.breakfast_dining, "Breakfast", "7-10 AM"),
                  _buildMealTile(Icons.lunch_dining, "Lunch", "12-2 PM"),
                  _buildMealTile(Icons.restaurant, "Dinner", "6-8 PM"),
                  _buildMealTile(Icons.icecream, "Snack", "Anytime"),
                ],
              ),
            ),

            // --- SEARCH FOODS ---
            _buildSectionCard(
              title: "Search Foods",
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Color(0xFF94A3B8)),
                    hintText: "Search for foods...",
                    hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // --- RECENT & FAVORITES ---
            _buildSectionCard(
              title: "Recent & Favorites",
              trailing: const Icon(Icons.history, size: 18, color: Color(0xFF94A3B8)),
              child: Column(
                children: [
                  _buildFoodItem("Oatmeal with berries", "45g carbs • 280 cal", true),
                  _buildFoodItem("Chicken salad", "12g carbs • 320 cal", false),
                  _buildFoodItem("Apple", "25g carbs • 95 cal", true),
                  _buildFoodItem("Whole wheat bread (2 slices)", "30g carbs • 160 cal", false),
                ],
              ),
            ),

            // --- MEAL PHOTO ---
            _buildSectionCard(
              title: "Meal Photo (Optional)",
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.camera_alt_outlined, size: 32, color: Color(0xFF94A3B8)),
                    SizedBox(height: 8),
                    Text("Take or upload photo", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                  ],
                ),
              ),
            ),

            // --- SAVE BUTTON ---
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDBA74), // Muted orange
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text("Save Carbs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Logging 271g carbs • No meal type", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE BUILDING BLOCKS ---

  Widget _buildSectionCard({required String title, required Widget child, Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w500)),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildQuickGramChip(String label) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildMealTile(IconData icon, String title, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: const Color(0xFF475569)),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String name, String details, bool isFavorite) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                    if (isFavorite) const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.star, size: 14, color: Colors.amber),
                    ),
                  ],
                ),
                Text(details, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}