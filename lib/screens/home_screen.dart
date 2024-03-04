import 'package:flutter/material.dart';
import 'package:flutter_3/screens/dashboard_screen.dart';
import 'package:flutter_3/screens/robots_list_screen.dart';
import 'package:flutter_3/screens/settings_screen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: const [
          CurvedNavigationBarItem(
              child: Icon(Icons.dashboard, color: Colors.white),
              label: 'Dashboard',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(Icons.android, color: Colors.white),
              label: 'Robots',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
              labelStyle: TextStyle(color: Colors.white)),
        ],
        color: Color(0xff293038),
        buttonBackgroundColor: Color(0xff293038),
        backgroundColor: const Color(0xff121417),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {});
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        letIndexChange: (index) => true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {});
        },
        children: [
          // Define the widgets for each screen here
          Center(child: DashboardScreen()),
          const Center(child: RobotsListScreen()),
          const Center(child: SettingsScreen()),
        ],
      ),
    );
  }
}
