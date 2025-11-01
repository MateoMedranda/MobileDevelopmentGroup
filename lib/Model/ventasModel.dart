class VentasModel {
  final List<double> ventas;

  VentasModel(this.ventas);

  Map<String, dynamic> calcularTotales() {
    int menor10 = 0, entre10y20 = 0, mayor20 = 0;
    double total = 0;

    for (var v in ventas) {
      total += v;
      if (v <= 10000) menor10++;
      else if (v < 20000) entre10y20++;
      else mayor20++;
    }

    return {
      "menor10": menor10,
      "entre10y20": entre10y20,
      "mayor20": mayor20,
      "total": total,
    };
  }
}
