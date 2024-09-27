import 'dart:io';

void main() {
  const baseSalary = 4000000;
  const bonus = 200000;
  const standardHours = 40;

  print('Enter the number of hours worked this week:');
  var hoursWorked = int.parse(stdin.readLineSync()!);

  var totalSalary = baseSalary;
  if (hoursWorked > standardHours) {
    totalSalary += bonus;
  }

  print('Total salary: Rp $totalSalary');
}