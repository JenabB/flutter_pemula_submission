import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class BelajarGetData extends StatelessWidget {
  final String apiUrl =
      "https://api.openweathermap.org/data/2.5/weather?q=pagaralam&units=metric&APPID=3e7d51461c99408ff6f959ee54750877";
  Future<List<dynamic>> _fecthDataUsers() async {
   
    var result = await http.get(Uri.parse(apiUrl));
     debugPrint(json.decode(result.body));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar GET HTTP'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
