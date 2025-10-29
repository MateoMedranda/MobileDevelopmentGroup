import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget{
  final VoidCallback onPressed;
  final Icon setIcon;
  final text;
  final color;

  CalculateButton({required this.onPressed, required this.setIcon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: setIcon,
        label: Text(text),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: color,
        ),
    );
  }
}