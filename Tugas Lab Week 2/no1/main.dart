import 'class.dart'; 

void main() {
  // Create a Student instance
  Student student1 = Student('a', '12', 90);
  
  // Display student information
  student1.displayInfo();
  
  // Check the student's grade
  student1.gradeCheck();

  // Example of using setter to update grade
  print('Updating grade...');
  student1.grade = 85; // Update grade
  student1.displayInfo(); // Display updated information
  student1.gradeCheck(); // Check the updated grade
}
