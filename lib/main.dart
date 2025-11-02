import 'package:atomic_design_lab2/View/mainPage.dart';
import 'package:atomic_design_lab2/View/billView.dart';
import 'package:atomic_design_lab2/View/billResultView.dart';
import 'package:atomic_design_lab2/View/schoolResultView.dart';
import 'package:atomic_design_lab2/View/schoolView.dart';
import 'package:atomic_design_lab2/View/bankView.dart';
import 'package:atomic_design_lab2/View/bankResultView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboratorio 2 - Desarrollo de aplicaciones móviles',
      initialRoute: "/",
      routes: {
        '/': (context) => MainPage(),
        '/school': (context) => SchoolView(),
        '/bank': (context) => BankView(),
        '/bill': (context) => BillView(),
        '/bankResult': (context) => BankResultView(),
        '/resultado': (context) => ResultadoView(),
        '/promediosEscuela': (context) => SchoolResultView(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}
