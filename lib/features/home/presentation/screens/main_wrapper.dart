import 'package:dialens/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  // List of pages to display
  final List<Widget> _pages = [
    const HomeScreen(), // Your existing Home UI
    const Center(child: Text("Analytics Page")),
    const Center(child: Text("Reports Page")),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack preserves the scroll state of your Home Screen
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      /// The Floating '+' Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEntrySheet(context),
        backgroundColor:  AppColors.primaryBlue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// The Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 20,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_filled, 'home'),
              _buildNavItem(1, Icons.bar_chart_rounded, 'Insights'),
              const SizedBox(width: 40), // Gap for the Floating Action Button
              _buildNavItem(2, Icons.description_outlined, 'Reports'),
              _buildNavItem(3, Icons.person_outline_rounded, 'More'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String text) {
    bool isSelected = _currentIndex == index;
    return InkWell( // Use InkWell for a nice ripple effect without the extra padding
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Constrains the column to its content
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? AppColors.primaryBlue : const Color(0xff6A7282),
          ),
          const SizedBox(height: 4), // Small gap between icon and text
          Text(
            text,
            style: TextStyle(
              fontSize: 12, // Reduced slightly to ensure it fits mobile screens
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primaryBlue : const Color(0xff6A7282),
            ),
          )
        ],
      ),
    );
  }

  void _showAddEntrySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        child: const Center(child: Text("Add New Entry Options Here")),
      ),
    );
  }
}