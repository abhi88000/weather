import 'package:flutter/material.dart';
import 'package:weather/Data.dart';
import 'package:weather/Call.dart';
import 'package:weather/Forecast.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Front(),
          backgroundColor: Color.fromARGB(255, 223, 240, 217),
        ),
      ),
    );
  }
}

class Front extends StatefulWidget {
  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return new Call();

  }
}
