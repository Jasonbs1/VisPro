import 'dart:io';

void main() {
  const double pi = 3.14;

  // Get input from the user for the diameter
  stdout.write('Enter the diameter of the circle: ');
  double diameter = double.parse(stdin.readLineSync()!);

  // Calculate the radius
  double radius = diameter / 2;

  // Calculate the area of the circle
  double area = pi * radius * radius;

  // Display the area
  print('The area of the circle is: $area');
}
