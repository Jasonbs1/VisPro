import 'dart:io';

void main() {
  print('Enter the number of hours parked:');
  var hours = int.parse(stdin.readLineSync()!);

  var fee;
  if (hours <= 2) {
    fee = hours * 2000;
  } else {
    fee = 2 * 2000 + (hours - 2) * 1000;
  }

  print('The parking fee is: Rp $fee');
}