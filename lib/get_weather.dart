import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiUrl =
    "https://api.openweathermap.org/data/2.5/weather?q=pagaralam&units=metric&APPID=3e7d51461c99408ff6f959ee54750877";
Future<Post> fecthPost() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to make request');
  }
}

class Post {
  final String name;
  final String description;
  final String weather;
  final int temp;
  final int humidity;
  final int wind;

  Post({required this.name, required this.description, required this.temp,required this.humidity, required this.wind,required this.weather});

  factory Post.fromJson(Map<String, dynamic> json) {
    print(json);
    return Post(
        name: json['name'],
        description: json['weather'][0]['description'],
        weather: json['weather'][0]['main'],
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],);
  }
}

class BelajarGetData extends StatelessWidget {
  final Future<Post> post = fecthPost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forecast'),
      ),
      body: Container(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 200,
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.wb_sunny, size: 40.0),
                          title: Text(snapshot.data!.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40)),
                          subtitle: Text(snapshot.data!.description,
                              style: const TextStyle(fontSize: 26)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.amber,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
