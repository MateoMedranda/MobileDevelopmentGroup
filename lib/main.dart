import 'package:atomic_design_lab2/View/billView.dart';
import 'package:atomic_design_lab2/View/billResultView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sueldo Calcular',
      initialRoute: "/",
      routes: {
        '/': (context)=>BillView(),
        '/resultado': (context)=>ResultadoView(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
      ),

    );
  }

}
