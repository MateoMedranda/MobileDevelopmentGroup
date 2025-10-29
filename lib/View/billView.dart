import 'package:flutter/material.dart';
import '../Controller/billController.dart';
import '../Widget/action_button.dart';
import '../Widget/app_input.dart';

class BillView extends StatefulWidget{
  @override
  State<BillView> createState() => _BillViewState();

}

class _BillViewState extends State<BillView> {
  final controller = BillController();
  final venta1Crtl = TextEditingController();
  final venta2Crtl = TextEditingController();
  final venta3Crtl = TextEditingController();

  //resultado
  void _calculate(){
    controller.setSales(venta1Crtl.text, venta2Crtl.text, venta3Crtl.text);
    final salary = controller.calculateSalary();
    final iva = controller.calculateIVA();
    final discount = controller.calculateDiscount();
    final salesStrings = controller.getSales();
    final totalSales = controller.calculateTotalSales();
    final finalTotal = controller.calculateFinalTotalSales();

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: {
        "salary": salary,
        "iva": iva,
        "discount": discount,
        "totalSales": totalSales,
        "finalTotal": finalTotal,
        'sale1': salesStrings[0],
        'sale2': salesStrings[1],
        'sale3': salesStrings[2],
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sueldo y Datos de Facturación'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Ingresa el precio de cada producto para conocer el sueldo y la factura',
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30),
            InputVenta(controller: venta1Crtl, label: "Producto 1"),
            SizedBox(height: 10),
            InputVenta(controller: venta2Crtl, label: "Producto 2"),
            SizedBox(height: 10),
            InputVenta(controller: venta3Crtl, label: "Producto 3"),
            SizedBox(height: 30),
            CalculateButton(onPressed: _calculate, setIcon: Icon(Icons.calculate),text: 'Calcular sueldo', color: Colors.redAccent,),
          ],
        ),
      ),

    );
  }


}

