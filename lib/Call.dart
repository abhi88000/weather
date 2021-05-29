import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/Data.dart';
import 'package:weather/Temperature.dart';

Future<Album> fetchAlbum() async {
  String a = 'london';
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=32.679290&lon=74.904891&units=metric&appid=dd9beb1b199cd83fb59525dfa63dcc02'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  int temp;
  double lat;
  double long;
  int pressure;
  String ico;
  String condition;
  int feels;
  String desc;
  int humidity;
  int visibility;
  double wind;
  String name;

  Album({
    required this.temp,
    required this.lat,
    required this.long,
    required this.pressure,
    required this.ico,
    required this.condition,
    required this.feels,
    required this.desc,
    required this.humidity,
    required this.visibility,
    required this.wind,
    required this.name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      temp: json['main']['temp'].toInt(),
      lat: json['coord']['lat'],
      long: json['coord']['lon'],
      pressure: json['main']['pressure'],
      ico: json['weather'][0]['icon'],
      condition: json['weather'][0]['main'],
      feels: json['main']['feels_like'].toInt(),
      desc: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      visibility: json['visibility'],
      wind: json['wind']['speed'],
      name: json['name'],
    );
  }
}

class Call extends StatefulWidget {
  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            var ss = snapshot.data!;
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: fetchAlbum,
                child: ListView(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          new Text(ss.name, style: GoogleFonts.caveat(fontSize: 60 ,fontWeight: FontWeight.bold),),
                          new Text(ss.desc, style: GoogleFonts.caveat(fontSize: 20 ,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      temperature(
                          (ss.temp).toString(), ss.ico, ss.feels, ss.condition),
                    data(ss.pressure, ss.visibility,ss.humidity,ss.wind),
                    ]),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          }),
    );
  }
}
