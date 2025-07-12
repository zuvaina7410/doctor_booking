import 'package:flutter/material.dart';

Widget customText({
  required String text, 
  double size = 14.0, 
  FontWeight weight = FontWeight.normal, 
  Color color = Colors.black,
  int? count,
  TextOverflow? overflow,
  }) {
  return Text(
    text,
    style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    maxLines: count,
    overflow: overflow,
  );
}

