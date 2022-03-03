import 'package:flutter/material.dart';

Widget customText(String text,double size,FontWeight weight,Color color){
  return Text(
    text,
    style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        fontFamily: 'Source Sans Pro'
    ),
  );
}