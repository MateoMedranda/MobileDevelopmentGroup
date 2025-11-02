import '../View/mainPage.dart';
import '../View/billView.dart';
import '../View/billResultView.dart';
import '../View/schoolResultView.dart';
import '../View/schoolView.dart';
import '../View/bankView.dart';
import '../View/bankResultView.dart';
import '../View/cajaPage.dart';
import '../View/ventasPage.dart';
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
        '/caja': (context) => CajaPage(),
        '/ventas': (context) => VentasPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}
