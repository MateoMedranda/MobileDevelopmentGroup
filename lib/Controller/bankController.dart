import '../Model/bankModel.dart';
import 'package:flutter/material.dart';

class BankController {
  final TextEditingController monthlyDepositController =
      TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();

  BankModel? _bankModel;

  // Getters para los controladores
  TextEditingController get monthlyDeposit => monthlyDepositController;
  TextEditingController get interestRate => interestRateController;
  TextEditingController get years => yearsController;

  BankModel? get bankModel => _bankModel;

  void calculateInvestment() {
    final deposit = double.tryParse(monthlyDepositController.text) ?? 0.0;
    final rate = double.tryParse(interestRateController.text) ?? 10.0;
    final numYears = int.tryParse(yearsController.text) ?? 1;

    _bankModel = BankModel(
      monthlyDeposit: deposit,
      annualInterestRate: rate,
      years: numYears,
    );

    _bankModel!.calculateYearlyInvestment();
  }

  bool validateInputs() {
    return monthlyDepositController.text.isNotEmpty &&
        interestRateController.text.isNotEmpty &&
        yearsController.text.isNotEmpty &&
        (double.tryParse(monthlyDepositController.text) ?? 0) > 0 &&
        (double.tryParse(interestRateController.text) ?? 0) > 0 &&
        (int.tryParse(yearsController.text) ?? 0) > 0;
  }

  void clearInputs() {
    monthlyDepositController.clear();
    interestRateController.clear();
    yearsController.clear();
    _bankModel = null;
  }

  void dispose() {
    monthlyDepositController.dispose();
    interestRateController.dispose();
    yearsController.dispose();
  }
}
