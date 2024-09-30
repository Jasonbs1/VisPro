class Student {
  String _name;
  String _studentId;
  int _grade;

  Student(this._name, this._studentId, this._grade);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String newName) => _name = newName;

  // Getter for student ID
  String get studentId => _studentId;

  // Setter for student ID
  set studentId(String newId) => _studentId = newId;

  // Getter for grade
  int get grade => _grade;

  // Setter for grade with validation
  set grade(int newGrade) {
    if (newGrade < 0 || newGrade > 100) {
      print('Invalid grade. It must be between 0 and 100.');
      _grade = 0; // Default to 0 if invalid
    } else {
      _grade = newGrade;
    }
  }

  void displayInfo() {
    print(''' 
Student's Name : $_name
Student's ID : $_studentId
Student's Grade : $_grade
''');
  }

  void gradeCheck() {
    if (_grade >= 70) {
      print('$_name lulus dengan nilai : $_grade');
    } else {
      print('$_name tidak lulus dengan nilai : $_grade');
    }
  }
}
