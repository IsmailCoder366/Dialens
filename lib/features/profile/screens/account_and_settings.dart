import 'package:dialens/features/profile/screens/tabs/account_tab.dart';
import 'package:dialens/features/profile/screens/tabs/settings_tab.dart';
import 'package:dialens/features/profile/screens/tabs/therapy_tab.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // length 3: Account, Therapy, Settings
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildCustomTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const AccountTab(),
                const TherapyTab(),
                const SettingsTab()
              ],
            ),
          ),
        ],
      ),
    );
  }



  /// HELPERS

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: const Color(0xFF155DFC),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text("Account & Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      actions: [
        IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.white), onPressed: () {}),
      ],
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      // This provides the solid blue background behind the tab bar

      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 4),
      child: Container(

        height: 48,
        padding: const EdgeInsets.all(4), // Creates the inset "track" spacing
        decoration: BoxDecoration(
            color: const Color(0xFF155DFC),
          borderRadius: BorderRadius.circular(14)
        ),
        child: TabBar(
          controller: _tabController,
          // Critical: Removes the default bottom line that usually appears in Flutter
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: const Color(0xFF155DFC),
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: "Account"),
            Tab(text: "Therapy"),
            Tab(text: "Settings"),
          ],
        ),
      ),
    );
  }
}