import 'package:flutter/material.dart';
import '../Widget/app_input.dart';
import '../Widget/action_button.dart';

class VentasPage extends StatefulWidget {
  const VentasPage({super.key});

  @override
  State<VentasPage> createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  final _ventasController = TextEditingController();
  List<double> ventas = [];

  int menores10k = 0;
  int entre10y20k = 0;
  int mayores20k = 0;
  double total = 0;

  void agregarVenta() {
    if (_ventasController.text.isEmpty) {
      mostrarMensaje("Ingresa un valor de venta");
      return;
    }

    final valor = double.tryParse(_ventasController.text);
    if (valor == null || valor <= 0) {
      mostrarMensaje("Valor inválido");
      return;
    }

    setState(() {
      ventas.add(valor);
      _ventasController.clear();
    });
  }

  void calcularTotales() {
    if (ventas.isEmpty) {
      mostrarMensaje("No hay ventas registradas");
      return;
    }

    menores10k = ventas.where((v) => v <= 10000).length;
    entre10y20k = ventas.where((v) => v > 10000 && v < 20000).length;
    mayores20k = ventas.where((v) => v >= 20000).length;
    total = ventas.fold(0, (suma, v) => suma + v);

    setState(() {});
  }

  void mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 4.13 - Ventas"),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputVenta(controller: _ventasController, label: "Monto de venta"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculateButton(
                  onPressed: agregarVenta,
                  setIcon: const Icon(Icons.add),
                  text: "Agregar",
                  color: Colors.indigo,
                ),
                CalculateButton(
                  onPressed: calcularTotales,
                  setIcon: const Icon(Icons.calculate),
                  text: "Calcular",
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: ventas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Venta ${index + 1}: \$${ventas[index]}"),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text("≤ 10,000: $menores10k"),
            Text(">10,000 y <20,000: $entre10y20k"),
            Text("≥ 20,000: $mayores20k"),
            const SizedBox(height: 10),
            Text(
              "Monto total: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
