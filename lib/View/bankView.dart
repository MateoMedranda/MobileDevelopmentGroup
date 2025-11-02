import '../Controller/bankController.dart';
import '../Widget/action_button.dart';
import '../Widget/app_input.dart';
import 'package:flutter/material.dart';

class BankView extends StatefulWidget {
  @override
  State<BankView> createState() => _BankViewState();
}

class _BankViewState extends State<BankView> {
  final BankController _controller = BankController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _calculateAndNavigate() {
    if (_controller.validateInputs()) {
      _controller.calculateInvestment();
      Navigator.pushNamed(
        context,
        '/bankResult',
        arguments: _controller.bankModel,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Por favor, complete todos los campos con valores válidos',
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          'Calculadora de Inversión Bancaria',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 64,
                      color: Colors.blue[700],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ingrese los datos de su inversión',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    InputVenta(
                      controller: _controller.monthlyDeposit,
                      label: 'Depósito mensual (\$)',
                    ),
                    SizedBox(height: 16),
                    InputVenta(
                      controller: _controller.interestRate,
                      label: 'Tasa de interés anual (%)',
                    ),
                    SizedBox(height: 16),
                    InputVenta(
                      controller: _controller.years,
                      label: 'Número de años',
                    ),
                    SizedBox(height: 32),
                    CalculateButton(
                      onPressed: _calculateAndNavigate,
                      setIcon: Icon(Icons.calculate),
                      text: 'Calcular Inversión',
                      color: Colors.blue[700],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[300]!),
              ),
              child: Column(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue[700], size: 24),
                  SizedBox(height: 8),
                  Text(
                    'Información',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Esta calculadora le ayudará a determinar el crecimiento de su inversión con interés compuesto anual. Ingrese el monto que deposita cada mes, la tasa de interés anual y el número de años para ver el total acumulado año por año.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[700], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
