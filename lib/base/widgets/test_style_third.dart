import 'package:flutter/material.dart';

class TextStyleThird extends StatelessWidget {
  final String text;
  final bool? isColor;

  const TextStyleThird({super.key, required this.text, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: isColor == null ? Colors.white : Colors.black, 
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
