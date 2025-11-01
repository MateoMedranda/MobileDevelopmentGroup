import '../Model/cajaModel.dart';

class CajaController {
  CajaModel? _caja;

  void setDatos(String billetes, String valBillete, String monedas, String valMoneda) {
    try {
      int nB = int.parse(billetes);
      double vB = double.parse(valBillete);
      int nM = int.parse(monedas);
      double vM = double.parse(valMoneda);
      _caja = CajaModel(nB, vB, nM, vM);
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
