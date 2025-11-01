import '../Model/ventasModel.dart';

class VentasController {
  VentasModel? _ventas;

  void setVentas(String texto) {
    try {
      final lista = texto.split(',').map((e) => double.parse(e.trim())).toList();
      _ventas = VentasModel(lista);
    } catch (e) {
      throw Exception('Formato incorrecto');
    }
  }

  String obtenerResumen() {
    if (_ventas == null) return 'Primero ingrese las ventas.';
    final datos = _ventas!.calcularTotales();
    return '''
Ventas de 10,000 o menos: ${datos["menor10"]}
Ventas entre 10,000 y 20,000: ${datos["entre10y20"]}
Ventas mayores a 20,000: ${datos["mayor20"]}
Monto total: \$${datos["total"].toStringAsFixed(2)}
''';
  }
}
