import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget{
  final VoidCallback onPressed;

  CalculateButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.calculate),
        label: Text('Calcular Sueldo'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          side: BorderSide(color: Colors.red, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.redAccent,
        ),
    );
  }
}