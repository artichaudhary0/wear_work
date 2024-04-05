import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/browse_maid_directory/browse_home_screen/browse_home_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid_before_after_screen/browse_maid_before_after_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid_profile_screen/browse_maid_profile_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid_search_screen/browse_maid_search_screen.dart';

class BrowseMaidMainScreen extends StatefulWidget {
  const BrowseMaidMainScreen({super.key});

  @override
  State<BrowseMaidMainScreen> createState() => _BrowseMaidMainScreenState();
}

class _BrowseMaidMainScreenState extends State<BrowseMaidMainScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  List<Widget> screens = [
    const BrowseMaidHomeScreen(),
    const BrowseMaidSearchScreen(),
    const BrowseMaidBeforeAfterScreen(),
    const BrowseMaidProfileScreen(),
  ];
  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          BrowseMaidHomeScreen(),
          BrowseMaidSearchScreen(),
          BrowseMaidBeforeAfterScreen(),
          BrowseMaidProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.borderColor,
        selectedLabelStyle: const TextStyle(
          color: AppColors.mainColor,
        ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.borderColor,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.mainColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.mainColor,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compare,
              color: AppColors.mainColor,
            ),
            label: "Before/After",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.mainColor,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
