class CajaModel {
  final int numBilletes;
  final double valorBillete;
  final int numMonedas;
  final double valorMoneda;

  CajaModel(this.numBilletes, this.valorBillete, this.numMonedas, this.valorMoneda);

  double calcularTotal() {
    return (numBilletes * valorBillete) + (numMonedas * valorMoneda);
  }
}
