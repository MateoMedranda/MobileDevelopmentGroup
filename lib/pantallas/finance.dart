import 'package:flutter/material.dart';

class CalculateFinance extends StatefulWidget {
  @override
  State<CalculateFinance> createState() => _CalculateFinanceState();
}

class _CalculateFinanceState extends State<CalculateFinance>{
  // Lógica
  // Controlador de texto para capturar la entrada del usuario
  final amountCtrl = TextEditingController();

  // Declarar las variables resultado
  double fee = 0;

  void calculate(){
    final amount = double.parse(amountCtrl.text) ?? 0;

    setState(() {
      if(amount < 5000){
        fee = amount * 0.03;
      }else{
        fee = amount * 0.02;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //encabezado
      appBar: AppBar(
        title: Text('Cuota a pagar'),
        backgroundColor: Colors.amber,
      ),

      //body
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Ingrese el monto de la finanza: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16,),

            TextField(
              controller: amountCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto en dólares (\$)',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: calculate,
              child: Text('Calcular'),
            ),

            SizedBox(height: 16,),

            Text('El monto que el cliente debe pagar es: ${fee.toStringAsFixed(2)} (\$)'),
          ],
        ),
      ),

    );
  }

}