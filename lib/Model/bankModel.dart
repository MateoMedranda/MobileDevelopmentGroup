class BankModel {
  final double monthlyDeposit;
  final double annualInterestRate;
  final int years;

  List<double> yearlyTotals = [];

  BankModel({
    required this.monthlyDeposit,
    required this.annualInterestRate,
    required this.years,
  });

  List<double> calculateYearlyInvestment() {
    yearlyTotals.clear();
    double total = 0.0;

    for (int year = 1; year <= years; year++) {
      // Calcular el total acumulado al final de cada año
      // Fórmula: Total anterior + (depósito mensual * 12) * (1 + tasa de interés)
      total = (total + (monthlyDeposit * 12)) * (1 + annualInterestRate / 100);
      yearlyTotals.add(total);
    }

    return yearlyTotals;
  }

  double getFinalTotal() {
    if (yearlyTotals.isEmpty) {
      calculateYearlyInvestment();
    }
    return yearlyTotals.isNotEmpty ? yearlyTotals.last : 0.0;
  }

  double getTotalDeposited() {
    return monthlyDeposit * 12 * years;
  }

  double getTotalInterestEarned() {
    return getFinalTotal() - getTotalDeposited();
  }
}
