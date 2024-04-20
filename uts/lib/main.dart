import 'package:flutter/material.dart';

import 'fragment/bookmark.dart';
import 'fragment/discovery.dart';
import 'fragment/profile.dart';
import 'fragment/topfoodie.dart';
import 'fragment/home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget 
{
  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> 
{
  int _selectedTab = 0;
  String titleApp = 'Home';

  final List<Widget> _pages = [
    Home(),
    Discovery(),
    Bookmark(),
    TopFoodie(),
    Profile()
  ];

  final List<String> _title = [
    'Home',
    'Discovery',
    'Bookmark',
    'Top Foodie',
    'Profile'
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
      titleApp = _title[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '$titleApp | UTS AMBW - C14210004',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onTap: (index) => _changeTab(index),
          mouseCursor: SystemMouseCursors.grab,
          iconSize: 20,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Color.fromRGBO(6, 99, 220, 1)),
          selectedItemColor: const Color.fromRGBO(6, 99, 220, 1),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Discovery'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Bookmark'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              label: 'Top Foodie'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}

