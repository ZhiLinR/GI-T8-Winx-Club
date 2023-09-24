import 'package:flutter/material.dart';

import 'colors.dart' as custom_color;

class MainText extends StatelessWidget {
  final String text;
  const MainText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
   return Stack(
      children: <Widget>[
        // Stroked text as border.
         Text(
          text,
          style: TextStyle(
            fontSize: 40,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.blue[700]!,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: 40,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
