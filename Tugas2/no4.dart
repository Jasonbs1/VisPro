import 'dart:io';

void main() {
  print('Masukkan temperatur dalam celcius : ');
  var celcius =  int.parse(stdin.readLineSync()!);

  var fahrenheit = (celcius * 9 / 5) + 32;

  print('$celcius celcius sama dengan $fahrenheit fahrenheit');
}