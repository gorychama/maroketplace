import 'package:flutter/material.dart';
import 'package:maroketplace/screens/bookmarks/bookmarks.dart';
import 'package:maroketplace/screens/home/home.dart';
import 'package:maroketplace/screens/listing/listing.dart';
import 'package:maroketplace/screens/mapscreen.dart/mapscreen.dart';
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
    MapScreen(),
    // ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    // if (index == 2) return; // FAB index handled separately
    setState(() {
      _selectedIndex = index;
    });
  }

  Icon _navIcon(IconData icon, int index) {
    return Icon(
      icon,
      color: _selectedIndex == index ? Colors.green : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 10,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: _navIcon(Icons.home, 0),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: _navIcon(Icons.favorite_border, 1),
                onPressed: () => _onItemTapped(1),
              ),
              const SizedBox(width: 40), // space for FAB
              IconButton(
                icon: _navIcon(Icons.list_alt, 2),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: _navIcon(Icons.map_outlined, 3),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
