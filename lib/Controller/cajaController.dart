import '../Model/cajaModel.dart';

class CajaController {
  CajaModel? _caja;

  void setDatos(String billetes, String valBillete, String monedas, String valMoneda) {
    try {
      int numB = int.parse(billetes);
      double valB = double.parse(valBillete);
      int numM = int.parse(monedas);
      double valM = double.parse(valMoneda);
      _caja = CajaModel(numB, valB, numM, valM);
    } catch (e) {
      throw Exception('Datos inválidos');
    }
  }

  String calcularTotal() {
    if (_caja == null) return 'Ingrese todos los datos.';
    double total = _caja!.calcularTotal();
    return 'El total en caja es: \$${total.toStringAsFixed(2)}';
  }
}
