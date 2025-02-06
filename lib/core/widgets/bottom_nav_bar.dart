import 'package:flutter/material.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/pages/home_phone_screen.dart';
import 'package:tarbiyauz/features/phone_pages/more_phone/presentation/pages/more_phone_screen.dart';
import 'package:tarbiyauz/features/phone_pages/news_phone/presentation/pages/news_phone_screen.dart';
import 'package:tarbiyauz/features/phone_pages/video_phone/presentation/pages/video_phone_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List screens = [
    const HomePhoneScreen(),
    const NewsPhoneScreen(),
    const VideoPhoneScreen(),
    MorePhoneScreen()
  ];

  Widget buildNavBarItem({required String iconPath, required int index}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          width: 24,
          height: 24,
          color: _selectedIndex == index
              ? Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black
              : Colors.grey,
        ),
        const SizedBox(height: 4),
        if (_selectedIndex == index)
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: buildNavBarItem(
                iconPath: 'assets/icons/home_icon.png', index: 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavBarItem(
                iconPath: 'assets/icons/news_icon.png', index: 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavBarItem(
                iconPath: 'assets/icons/video_icon.png', index: 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavBarItem(
                iconPath: 'assets/icons/more_icon.png', index: 3),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: screens[_selectedIndex],
    );
  }
}
