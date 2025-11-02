class BillModel {
  final List<double> sales;
  double totalSales = 0;
  double IVA = 0;
  double discount = 0;

  BillModel(this.sales);

  double calculateSalary(){
    double baseSalary = 365;
    for(int i = 0; i<3; i++){
      totalSales += sales[i];
    }
    double comission = totalSales * 0.12;
    return baseSalary + comission;
  }

  double calculateIVA(){
    IVA = totalSales * 0.15;
    return IVA;
  }

  double getTotalSales(){
    return totalSales;
  }

  double calculateDiscount(){
    if(totalSales > 2000){
      discount = totalSales * 0.20;
      return discount;
    }else{
      discount = 0;
      return 0;
    }
  }

  double calculateFinalTotal(){
    return totalSales + IVA - discount;
  }

  List<double> getSales(){
    return sales;
  }
}