class Student {
  String name;
  String studentid;
  int grade;


Student(this.name, this.studentid, this.grade);

void displayinfo() {
  print('''
Student's Name : $name
Student's ID : $studentid
Student's Grade : $grade
''');
}

void gradecheck() {
  if(grade >=70) {
    print('$name lulus dengan nilai : $grade');
  } else {
    print('$name tidak lulus dengan nilai : $grade');
  }
}
}

void main() {
 Student student1 = Student('a', '12', 90);
 student1.displayinfo();

 student1.gradecheck();
}