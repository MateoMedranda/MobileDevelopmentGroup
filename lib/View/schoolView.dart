import 'package:flutter/material.dart';
import '../Controller/schoolController.dart';
import '../Widget/action_button.dart';
import '../Widget/app_input.dart';

class SchoolView extends StatefulWidget {
  @override
  State<SchoolView> createState() => _SchoolViewState();
}

class _SchoolViewState extends State<SchoolView> {
  final controller = SchoolController();
  final agesCrtl = TextEditingController();

  String courses = "";

  void _addCourse() {
    controller.setCourse(agesCrtl.text);
    setState(() {
      courses = controller.getCourses();
    });
  }

  void _calculate() {
    final result = controller.calculateAverages();

    Navigator.pushNamed(context, '/promediosEscuela', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promedio de edad por curso y del colegio'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Ingresa las edades de los estudiantes del curso separando por coma (Ex: 10,11,12,9,12)',
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30),
            InputVenta(controller: agesCrtl, label: "Edades"),
            SizedBox(height: 30),
            CalculateButton(
              onPressed: _addCourse,
              setIcon: Icon(Icons.add),
              text: 'Agregar Curso',
              color: Colors.blueAccent,
            ),
            SizedBox(height: 30),
            CalculateButton(
              onPressed: _calculate,
              setIcon: Icon(Icons.calculate),
              text: 'Calcular Promedios',
              color: Colors.redAccent,
            ),
            SizedBox(height: 30),
            Text(courses, textAlign: TextAlign.left),
          ],
        ),
      ),
    );
  }
}
