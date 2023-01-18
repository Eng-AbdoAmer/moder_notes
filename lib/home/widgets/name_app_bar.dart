import 'package:flutter/material.dart';

class NameAppBar extends StatelessWidget {
  String name;
  NameAppBar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          background: Paint()
            ..strokeWidth = 33
            ..color = Colors.red
            ..style = PaintingStyle.stroke
            ..strokeJoin = StrokeJoin.bevel),
    );
  }
}
