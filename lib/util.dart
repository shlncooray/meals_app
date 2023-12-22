import 'package:flutter/material.dart';

Color getColorFromString(String color) {
  switch (color.toLowerCase()) {
    case 'purple':
      return Colors.purple;
    case 'red':
      return Colors.red;
    case 'orange':
      return Colors.orange;
    case 'amber':
      return Colors.amber;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'lightblue':
      return Colors.lightBlue;
    case 'lightgreen':
      return Colors.lightGreen;
    case 'pink':
      return Colors.pink;
    case 'teal':
      return Colors.teal;
    default:
      return Colors.orange;
  }
}
