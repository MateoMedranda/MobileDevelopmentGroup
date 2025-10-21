import 'package:flutter/material.dart';

class CalculateIncentive extends StatefulWidget {
  @override
  State<CalculateIncentive> createState() => _CalculateIncentiveState();
}

class _CalculateIncentiveState extends State<CalculateIncentive>{
  // Lógica
  // Controlador de texto para capturar la entrada del usuario
  final unitiesCtrl = TextEditingController();

  // Declarar las variables resultado
  String incentive = "";

  void calculate(){
    final unities = int.parse(unitiesCtrl.text) ?? 0;

    setState(() {
      if(unities <= 100){
        incentive = "No se ha superado el promedio de producción mínimo, (No recibe incentivo)";
      }else{
        incentive = "Felicidades, se ha superado el promedio de producción mínimo, (Recibe incentivo)";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //encabezado
      appBar: AppBar(
        title: Text('Incentivo de producción'),
        backgroundColor: Colors.greenAccent,
      ),

      //body
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Ingrese las unidades producidas en la semana: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16,),

            TextField(
              controller: unitiesCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto en unidades (u)',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: calculate,
              child: Text('Evaluar'),
            ),

            SizedBox(height: 16,),

            Text(incentive),
          ],
        ),
      ),

    );
  }

}