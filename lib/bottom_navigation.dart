import 'package:flutter/material.dart';
import 'package:flutter_pemula_submission/mainscreen.dart';
import 'package:flutter_pemula_submission/about.dart';
import 'package:flutter_pemula_submission/get_weather.dart';
class Halamannav extends StatefulWidget {
  @override
  _HalamannavState createState() => _HalamannavState();
}

class _HalamannavState extends State {
  int _selectedIndex = 0;

  final _widgetOptions = [
    MainScreen(),
    BelajarGetData(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny),
              title: Text('Forecast'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.priority_high),
              title: Text('About'),
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
