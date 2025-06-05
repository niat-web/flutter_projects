import 'package:flutter/material.dart';

class CalcWidget extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;
  const CalcWidget(
      {super.key,
      required this.text,
      this.fillColor = Colors.cyan,
      this.textColor = Colors.black,
      required this.textSize,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: textSize),
        ));
  }
}
