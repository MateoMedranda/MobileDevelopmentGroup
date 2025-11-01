import 'package:atomic_design_lab2/Model/bankModel.dart';
import 'package:atomic_design_lab2/Widget/action_button.dart';
import 'package:flutter/material.dart';

class BankResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BankModel bankModel =
        ModalRoute.of(context)!.settings.arguments as BankModel;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          'Resultados de Inversión',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card con resumen general
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.blue[600]!, Colors.blue[800]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(Icons.trending_up, size: 48, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      'Resumen de Inversión',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildSummaryRow(
                      'Depósito mensual:',
                      '\$${bankModel.monthlyDeposit.toStringAsFixed(2)}',
                    ),
                    _buildSummaryRow(
                      'Tasa de interés:',
                      '${bankModel.annualInterestRate.toStringAsFixed(1)}% anual',
                    ),
                    _buildSummaryRow('Período:', '${bankModel.years} años'),
                    Divider(color: Colors.white70, thickness: 1),
                    _buildSummaryRow(
                      'Total depositado:',
                      '\$${bankModel.getTotalDeposited().toStringAsFixed(2)}',
                    ),
                    _buildSummaryRow(
                      'Intereses ganados:',
                      '\$${bankModel.getTotalInterestEarned().toStringAsFixed(2)}',
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildSummaryRow(
                        'TOTAL FINAL:',
                        '\$${bankModel.getFinalTotal().toStringAsFixed(2)}',
                        isTotal: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Card con desglose año por año
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.blue[700],
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Evolución Año por Año',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: bankModel.yearlyTotals.length,
                        itemBuilder: (context, index) {
                          final year = index + 1;
                          final total = bankModel.yearlyTotals[index];
                          final deposited =
                              bankModel.monthlyDeposit * 12 * year;
                          final interest = total - deposited;

                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue[200]!),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Año $year',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.blue[800],
                                        ),
                                      ),
                                      Text(
                                        'Depositado: \$${deposited.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Text(
                                        'Intereses: \$${interest.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '\$${total.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: CalculateButton(
                    onPressed: () => Navigator.pop(context),
                    setIcon: Icon(Icons.arrow_back),
                    text: 'Nuevo Cálculo',
                    color: Colors.blue[600],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CalculateButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/'),
                    setIcon: Icon(Icons.home),
                    text: 'Inicio',
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTotal ? 18 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
