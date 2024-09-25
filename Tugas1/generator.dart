import 'dart:math';

List<int> generateNumbers(int count) {
  final random = Random();
  final numbers = <int>[];
  var i = 0;
  while (i < count) {
    numbers.add(random.nextInt(100));
    i++;
  }
  return numbers;
}