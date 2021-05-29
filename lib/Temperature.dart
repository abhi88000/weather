
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget temperature(String a , String b , int c, String d)
{
  return Padding(
      padding: EdgeInsets.fromLTRB(8, 10, 5, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Text(
                "$a°C",
                style: GoogleFonts.shadowsIntoLight( fontSize:50 ),
              ),
              //new Divider(),
              new Text('FEELS LIKE $c°C ' ,style: GoogleFonts.permanentMarker(fontSize: 20),),
            ],
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network('http://openweathermap.org/img/wn/$b@2x.png', scale: 1,),
              new Text("$d",style: GoogleFonts.permanentMarker(fontSize: 20),)
              
            ],
          ),
          new Divider()
        ],
      ),
    );
}