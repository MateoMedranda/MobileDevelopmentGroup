import 'package:flutter/material.dart';
import '../Widget/app_input.dart';
import '../Widget/action_button.dart';

class CajaPage extends StatefulWidget {
  const CajaPage({super.key});

  @override
  State<CajaPage> createState() => _CajaPageState();
}

class _CajaPageState extends State<CajaPage> {
  final _billetesController = TextEditingController();
  final _monedasController = TextEditingController();
  final _valorBilleteController = TextEditingController();
  final _valorMonedaController = TextEditingController();

  double total = 0;

  void calcularTotal() {
    // Validaciones simples
    if (_billetesController.text.isEmpty ||
        _monedasController.text.isEmpty ||
        _valorBilleteController.text.isEmpty ||
        _valorMonedaController.text.isEmpty) {
      mostrarMensaje("Por favor, completa todos los campos");
      return;
    }

    final billetes = int.tryParse(_billetesController.text) ?? 0;
    final monedas = int.tryParse(_monedasController.text) ?? 0;
    final valorBillete = double.tryParse(_valorBilleteController.text) ?? 0;
    final valorMoneda = double.tryParse(_valorMonedaController.text) ?? 0;

    setState(() {
      total = billetes * valorBillete + monedas * valorMoneda;
    });
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
        title: const Text("Ejercicio 4.12 - Caja Registradora"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputVenta(controller: _billetesController, label: "Número de billetes"),
            const SizedBox(height: 10),
            InputVenta(controller: _valorBilleteController, label: "Valor de cada billete"),
            const SizedBox(height: 10),
            InputVenta(controller: _monedasController, label: "Número de monedas"),
            const SizedBox(height: 10),
            InputVenta(controller: _valorMonedaController, label: "Valor de cada moneda"),
            const SizedBox(height: 20),
            CalculateButton(
              onPressed: calcularTotal,
              setIcon: const Icon(Icons.calculate),
              text: "Calcular total",
              color: Colors.teal,
            ),
            const SizedBox(height: 20),
            Text(
              "Total en caja: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
