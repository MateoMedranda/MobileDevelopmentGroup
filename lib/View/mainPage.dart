import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header minimalista
              SizedBox(height: 40),
              Text(
                'Laboratorio 2',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Desarrollo de aplicaciones móviles',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 8),
              Container(width: 40, height: 2, color: Colors.grey[400]),
              SizedBox(height: 40),

              // Lista de ejercicios
              Expanded(child: ListView(children: _buildMenuItems(context))),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final menuItems = [
      {
        'number': '01',
        'title': 'Ejercicio 1 - Escuela',
        'subtitle': 'Promedios por curso',
        'icon': Icons.school,
        'color': Colors.green[600]!,
        'route': '/school',
        'enabled': true,
      },
      {
        'number': '02',
        'title': 'Ejercicio 2 - Interés Bancario',
        'subtitle': 'Inversión compuesta',
        'icon': Icons.account_balance,
        'color': Colors.blue[600]!,
        'route': '/bank',
        'enabled': true,
      },
      {
        'number': '03',
        'title': 'Ejercicio 3 - Vendedor y Ventas',
        'subtitle': 'Sueldo y comisiones',
        'icon': Icons.attach_money,
        'color': Colors.orange[600]!,
        'route': '/bill',
        'enabled': true,
      },
      {
        'number': '04',
        'title': 'Ejercicio 4 - Caja Registradora',
        'subtitle': 'Control de ventas',
        'icon': Icons.point_of_sale,
        'color': Colors.purple[600]!,
        'route': null,
        'enabled': false,
      },
      {
        'number': '05',
        'title': 'Ejercicio 5 - Ventas Totales',
        'subtitle': 'Análisis de ventas',
        'icon': Icons.analytics,
        'color': Colors.red[600]!,
        'route': null,
        'enabled': false,
      },
    ];

    return menuItems.map((item) => _buildMenuItem(context, item)).toList();
  }

  Widget _buildMenuItem(BuildContext context, Map<String, dynamic> item) {
    final bool isEnabled = item['enabled'] as bool;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            if (isEnabled && item['route'] != null) {
              Navigator.pushNamed(context, item['route']);
            }
            // Si no está habilitado o no tiene ruta, no hace nada
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icono con color
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: item['color'],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(item['icon'], color: Colors.white, size: 24),
                  ),
                ),
                SizedBox(width: 20),
                // Contenido
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item['subtitle'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                // Flecha - ahora siempre visible
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
