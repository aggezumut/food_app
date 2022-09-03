import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText.title(
      {Key? key, required this.text, this.size = 25, this.fontWeight = FontWeight.bold, this.color = Colors.black})
      : super(key: key);

  const AppText.subtitle(
      {Key? key, required this.text, this.size = 16, this.fontWeight = FontWeight.normal, this.color = Colors.grey})
      : super(key: key);

  const AppText.normal(
      {Key? key, required this.text, this.size = 22, this.fontWeight = FontWeight.bold, this.color = Colors.black})
      : super(key: key);

  const AppText.card(
      {Key? key, required this.text, this.size = 18, this.fontWeight = FontWeight.w600, this.color = Colors.white})
      : super(key: key);

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
