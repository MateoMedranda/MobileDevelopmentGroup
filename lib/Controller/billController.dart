import '../Model/billModel.dart';

class BillController {
  BillModel? _bill;

  void setSales(String s1, String s2, String s3){
    try {
      final List<double> sales = [
        double.parse(s1),
        double.parse(s2),
        double.parse(s3)
      ];
      _bill = BillModel(sales);
    } catch (e) {
      throw Exception('Ingrese valores numéricos válidos');
    }
  }

  String calculateSalary(){
    if (_bill == null) return 'Primero ingrese las ventas';
    final salary = _bill!.calculateSalary();
    return "\$${salary.toStringAsFixed(2)}";
  }

  String calculateTotalSales() {
    if (_bill == null) return 'Primero ingrese las ventas';
    final total = _bill!.getTotalSales();
    return "\$${total.toStringAsFixed(2)}";
  }

  String calculateFinalTotalSales() {
    if (_bill == null) return 'Primero ingrese las ventas';
    final total = _bill!.calculateFinalTotal();
    return "\$${total.toStringAsFixed(2)}";
  }

  String calculateIVA() {
    if (_bill == null) return 'Primero ingrese las ventas';
    final iva = _bill!.calculateIVA();
    return "\$${iva.toStringAsFixed(2)}";
  }

  String calculateDiscount() {
    if (_bill == null) return 'Primero ingrese las ventas';
    final discount = _bill!.calculateDiscount();
    return "\$${discount.toStringAsFixed(2)}";
  }

  List<String> getSales() {
    if (_bill == null) return ['0', '0', '0'];
    return _bill!.sales.map((s) => s.toStringAsFixed(2)).toList();
  }
}