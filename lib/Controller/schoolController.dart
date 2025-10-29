import '../Model/schoolModel.dart';

class SchoolController {
  SchoolModel? _school;
  List<List<int>> courses = [];
  List<String> coursesString = [];

  void setCourse(String ages){
    try {
      coursesString.add(ages);
      courses.add(ages.split(',').map((age) => int.parse(age.trim())).toList());
    } catch (e) {
      throw Exception('Ingrese valores numéricos válidos');
    }
  }

  String calculateAverages(){
    String result = "Promedio de edad en cada curso: \n";
    _school = SchoolModel(courses);
    final List<double> coursesAverages = _school!.calculateCoursesAverage();
    final double schoolAverage = _school!.calculateSchoolAverage();

    for(int i = 0; i<coursesAverages.length;i++){
      result += "curso ${i+1}: ${coursesAverages[i].toStringAsFixed(2)} años \n";
    }

    result += "\n\nPromedio de edad del colegio: ${schoolAverage.toStringAsFixed(2)} años";
    return result;
  }

  String getCourses(){
    String result = "Cursos Registrados: \n";
    for(int i = 0; i<coursesString.length; i++){
      result += "Curso ${i+1}: ${coursesString[i]}\n";
    }
    return result;
  }

}