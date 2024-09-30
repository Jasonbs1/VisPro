import 'dart:io';
import 'class.dart'; 

void main() {
  print('Would you like to create a car or a bike? (Enter "car" or "bike")');
  String? vehicleType = stdin.readLineSync()?.toLowerCase();

  print('Enter the name of the vehicle:');
  String name = stdin.readLineSync()!;

  print('Enter the speed of the vehicle:');
  int speed = int.parse(stdin.readLineSync()!);

  // Create either a Car or Bike based on the user's input
  Vehicle? vehicle;
  if (vehicleType == 'car') {
    vehicle = Car(name, speed);
  } else if (vehicleType == 'bike') {
    vehicle = Bike(name, speed);
  } else {
    print('Invalid vehicle type entered.');
    return;
  }

  // Display and modify vehicle attributes using getters and setters
  print('Vehicle created: ${vehicle.name} with speed ${vehicle.speed} km/h.');

  print('Would you like to update the vehicle name or speed? (Enter "name" or "speed")');
  String? updateField = stdin.readLineSync()?.toLowerCase();

  if (updateField == 'name') {
    print('Enter the new name:');
    vehicle.name = stdin.readLineSync()!;
    print('Updated vehicle name: ${vehicle.name}');
  } else if (updateField == 'speed') {
    print('Enter the new speed:');
    vehicle.speed = int.parse(stdin.readLineSync()!);
    print('Updated vehicle speed: ${vehicle.speed} km/h');
  }

  // Call the move method on the created vehicle
  vehicle.move();
}
