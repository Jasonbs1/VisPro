import 'dart:io';

void main() {
  const applePrice = 5000;
  const orangePrice = 4000;

  print('Enter the number of kilograms of apples:');
  var appleKg = double.parse(stdin.readLineSync()!);

  print('Enter the number of kilograms of oranges:');
  var orangeKg = double.parse(stdin.readLineSync()!);

  var totalCost = (applePrice * appleKg) + (orangePrice * orangeKg);

  print('Total cost: Rp ${totalCost.toStringAsFixed(0)}');
}