import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        new Column(
          children: [
            new Text("time"),
            new Text("image"),
            new Text("temperature")
          ],
        )
      ],
      
    );
  }
}