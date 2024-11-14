import 'package:chain_break/navigation/nav_keys.dart';
import 'package:chain_break/providers/bottom_navigationbar_provider.dart';
import 'package:chain_break/screens/home_page.dart';
import 'package:chain_break/screens/welness_screen.dart';
import 'package:chain_break/utils/test.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    // Access the selectedIndex from the BottomNavigationBarProvider
    final selectedIndex = Provider.of<BottomNavigationBarProvider>(context).selectedIndex;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Navigator(
            key: NavKeys.homeNav,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
          Navigator(
            key: NavKeys.statsNav,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const WelnessScreen(),
            ),
          ),
          Navigator(
            key: NavKeys.communityNav,
            // onGenerateRoute: (settings) => MaterialPageRoute(
            //   builder: (context) => const CommunityScreen(),
            // ),
          ),
          Navigator(
            key: NavKeys.achievementsNav,
            // onGenerateRoute: (settings) => MaterialPageRoute(
            //   builder: (context) => const AchievementsScreen(),
            // ),
          ),
          Navigator(
            key: NavKeys.profileNav,
            // onGenerateRoute: (settings) => MaterialPageRoute(
            //   builder: (context) => const ProfileScreen(),
            // ),
          ),
        ],
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          // Update the selectedIndex using the BottomNavigationBarProvider
          Provider.of<BottomNavigationBarProvider>(context, listen: false).updateIndex(index);
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
        },
        selectedIndex: selectedIndex,
        waterDropColor: Colors.blue,
        barItems: [
          BarItem(
            filledIcon: Icons.home_rounded,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.insert_chart_rounded,
            outlinedIcon: Icons.insert_chart_outlined,
          ),
          BarItem(
            filledIcon: Icons.people_rounded,
            outlinedIcon: Icons.people_outlined,
          ),
          BarItem(
            filledIcon: Icons.emoji_events_rounded,
            outlinedIcon: Icons.emoji_events_outlined,
          ),
          // BarItem(
          //   filledIcon: Icons.person_rounded,
          //   outlinedIcon: Icons.person_outlined,
          // ),
        ],
      ),
    );
  }
}
