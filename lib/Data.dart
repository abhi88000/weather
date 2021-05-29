import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget data(int pressure, int visibility, int humidity, double windspeed) {
  return Column(
    children: [
      new Divider(
        thickness: 2,
        color: Colors.black,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(
            "PRESSURE $pressure kPa ",
            style: GoogleFonts.commissioner(fontSize: 18),
          ),
          new Text(
            "VISIBIITY  ${visibility / 1000} km",
            style: GoogleFonts.commissioner(fontSize: 18),
          ),
        ],
      ),
      new Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(
            "HUMIDITY $humidity%",
            style: GoogleFonts.commissioner(fontSize: 18),
          ),
          new Text(
            "WINDSPEED  $windspeed km/h",
            style: GoogleFonts.commissioner(fontSize: 18),
          ),
        ],
      ),
      new Divider(
        thickness: 2,
        color: Colors.black,
      ),
    ],
  );
}
