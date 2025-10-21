import 'package:flutter/material.dart';

class ConversionMetros extends StatefulWidget {
  @override
  State<ConversionMetros> createState() => _ConversionMetrosState();
}

class _ConversionMetrosState extends State<ConversionMetros> {
  final metrosCtrl = TextEditingController();

  double yardas = 0, pies = 0, centimetros = 0, pulgadas = 0;

  void calcular() {
    final metros = double.tryParse(metrosCtrl.text) ?? 0;

    setState(() {
      centimetros = metros * 100;
      pulgadas = centimetros / 2.54;
      pies = pulgadas / 12;
      yardas = pies / 3;
    });
  }

  @override
  void dispose() {
    metrosCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversión de Metros'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ingrese una medida en metros:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            TextField(
              controller: metrosCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Metros',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcular,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text('Yardas: ${yardas.toStringAsFixed(4)}'),
            Text('Pies: ${pies.toStringAsFixed(4)}'),
            Text('Centímetros: ${centimetros.toStringAsFixed(4)}'),
            Text('Pulgadas: ${pulgadas.toStringAsFixed(4)}'),
          ],
        ),
      ),
    );
  }
}
