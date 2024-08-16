import 'package:flutter/material.dart';

class Neumorph extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const Neumorph({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[100],
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade700,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
           BoxShadow(
            color: Colors.purple.shade200,
            offset: const Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}