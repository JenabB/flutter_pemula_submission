import 'package:flutter/material.dart';
import 'package:flutter_pemula_submission/mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PagarAlam Travel', theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ), home: MainScreen());
  }
}
