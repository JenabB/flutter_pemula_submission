import 'package:flutter/material.dart';
import 'package:flutter_pemula_submission/mainscreen.dart';
import 'package:flutter_pemula_submission/about.dart';

class Halamannav extends StatefulWidget {
  @override
  _HalamannavState createState() => _HalamannavState();
}

class _HalamannavState extends State {
  int _selectedIndex = 0;

  final _widgetOptions = [
    MainScreen(),
    MainScreen(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              title: Text('Satu'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_compact),
              title: Text('Dua'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Tiga'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          fixedColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
