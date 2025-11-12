import 'package:flutter/material.dart';
import 'package:tmdb_flutter/view/account_screen.dart';
import 'package:tmdb_flutter/view/home_screen.dart';
import 'package:tmdb_flutter/view/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const List<Widget> _items = [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  void onTapItemBottom(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onTapItemBottom,
      ),
    );
  }
}
