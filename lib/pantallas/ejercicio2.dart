import 'package:flutter/material.dart';

class CapacidadDisco extends StatefulWidget {
  @override
  State<CapacidadDisco> createState() => _CapacidadDiscoState();
}

class _CapacidadDiscoState extends State<CapacidadDisco> {
  final gbCtrl = TextEditingController();

  double mb = 0, kb = 0, bytes = 0;

  void calcular() {
    final gb = double.tryParse(gbCtrl.text) ?? 0;

    setState(() {
      mb = gb * 1024;
      kb = mb * 1024;
      bytes = kb * 1024;
    });
  }

  @override
  void dispose() {
    gbCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capacidad de Disco'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ingrese la capacidad del disco (en GB):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            TextField(
              controller: gbCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Gigabytes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcular,
              child: Text('Convertir'),
            ),
            SizedBox(height: 16),
            Text('Megabytes: ${mb.toStringAsFixed(2)} MB'),
            Text('Kilobytes: ${kb.toStringAsFixed(2)} KB'),
            Text('Bytes: ${bytes.toStringAsFixed(2)} B'),
          ],
        ),
      ),
    );
  }
}
