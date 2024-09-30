import 'dart:io';
import 'class.dart'; 

void main() {
  // Create an instance of TemperatureConverter
  var converter = TemperatureConverter();

  // Ask the user for input
  print('Enter temperature in Celsius:');
  double celsius = double.parse(stdin.readLineSync()!);

  print('Convert to:');
  print('1. Réaumur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  int choice = int.parse(stdin.readLineSync()!);

  // Handle the user's choice
  switch (choice) {
    case 1:
      print('${celsius}°C = ${converter.celsiusToReaumur(celsius)}°Re');
      break;
    case 2:
      print('${celsius}°C = ${converter.celsiusToFahrenheit(celsius)}°F');
      break;
    case 3:
      print('${celsius}°C = ${converter.celsiusToKelvin(celsius)}K');
      break;
    default:
      print('Invalid choice!');
  }
}
