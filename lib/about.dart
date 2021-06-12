import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
        boxShadow: [
            // color: Colors.white, //background color of box
          BoxShadow(
            color: Colors.red,
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          )
        ],
    ),
              padding: EdgeInsets.all(16.0),
              child: Text(
                'PagarAlam Travel is an application that helps travelers find out about various interesting destinations from the city of PagarAlam ranging from baths, parks and restaurants, there is a weather forecast feature that gives an overview of the weather conditions for the next 5 days so that travelers can plan trips without fear of rain and others using the API from openweathermap.org',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                 
                ),
              ),
            ),
        ],
      ),
    );
  }
}