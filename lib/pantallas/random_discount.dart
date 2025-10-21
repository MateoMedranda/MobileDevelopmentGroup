import 'dart:math';
import 'package:flutter/material.dart';

class CalculateDiscount extends StatefulWidget {
  @override
  State<CalculateDiscount> createState() => _CalculateDiscountState();
}

class _CalculateDiscountState extends State<CalculateDiscount>{
  // Lógica
  // Declarar las variables resultado
  int discount = 0;
  int random = 0;

  void evaluate(){
    int min = 0;
    int max = 100;
    random = min + Random().nextInt(max - min + 1);

    setState(() {
      if(random >= 74){
        discount = 20;
      }else{
        discount = 15;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //encabezado
      appBar: AppBar(
        title: Text('Descuento al cliente'),
        backgroundColor: Colors.redAccent,
      ),

      //body
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: evaluate,
              child: Text('Probar suerte'),
            ),

            SizedBox(height: 16,),

            Text('Tu número fué: '),
            SizedBox(height: 16,),
            Text('${random}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 16,),
            Text('Obtuviste un descuento del: ${discount} % '),
          ],
        ),
      ),

    );
  }

}