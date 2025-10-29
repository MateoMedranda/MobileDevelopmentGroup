class SchoolModel {
  final List<List<int>> courses;
  List<double> coursesAverages = [];

  SchoolModel(this.courses);

  List<double> calculateCoursesAverage(){
    List<double> averages = [];
    for(List<int> course in courses){
      double sum = 0;
      for(int i = 0; i<course.length; i++){
        sum+=course[i];
      }
      averages.add(sum/course.length);
    }
    coursesAverages = averages;

    return averages;
  }

  double calculateSchoolAverage(){
    double averageNum = 0;
    double averageDen = 0;
    for(int i = 0; i<courses.length; i++){
      averageNum += coursesAverages[i]*courses[i].length;
      averageDen += courses[i].length;
    }
    return averageNum/averageDen;
  }

}