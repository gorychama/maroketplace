import 'package:flutter/material.dart';
import 'package:maroketplace/screens/bookmarks/bookmarks.dart';
import 'package:maroketplace/screens/home/home.dart';
import 'package:maroketplace/screens/listing/listing.dart';
import 'package:maroketplace/screens/profile/profile.dart';

class MainBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const MainBottomNavBar({super.key, this.currentIndex = 0});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ClassifiedHomeScreen(),
    BookmarksScreen(),
    ListingScreen(),
    ProfileScreen(), // Placeholder for Chat Screen
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Icon _navIcon(IconData filled, IconData outlined, int index) {
    return Icon(
      _selectedIndex == index ? filled : outlined,
      color: _selectedIndex == index ? Colors.green : Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _navIcon(Icons.home, Icons.home_outlined, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.favorite, Icons.favorite_border, 1),
            label: 'Favori',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.list, 
            Icons.list_alt_outlined, 2),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.map, Icons.map_outlined, 3),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.person, Icons.person_outline, 4),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
