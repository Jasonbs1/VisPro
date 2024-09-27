import 'dart:collection';

void main() {
  var customers = Queue<String>.from(['A', 'B', 'C', 'D', 'E']);
  var counter1 = [], counter2 = [];

  while (customers.isNotEmpty) {
    if (counter1.length <= counter2.length) {
      counter1.add(customers.removeFirst());
    } else {
      counter2.add(customers.removeFirst());
    }
  }

  print('Counter 1 serves: ${counter1.join(", ")}');
  print('Counter 2 serves: ${counter2.join(", ")}');
}