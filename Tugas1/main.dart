import 'dart:io';
import 'generator.dart';
import 'sorter.dart';
import 'pyramid.dart';


void main() {
  print('Enter the number of elements to generate:');
  final count = int.parse(stdin.readLineSync()!);
  
  final numbers = generateNumbers(count);
  print('Generated numbers: $numbers');
  
  while (true) {
    print('\nChoose an option:');
    print('1. Bubble sort');
    print('2. Inverted Bubble sort');
    print('3. Shuffle');
    print('4. Print pyramid');
    print('5. Print sorted pyramid');
    print('6. Exit');
    
    final choice = stdin.readLineSync();
    if (choice == '6') break;
    
    final stopwatch = Stopwatch()..start();
    
    switch (choice) {
      case '1':
        bubbleSort(numbers);
        print('Sorted numbers: $numbers');
      case '2':
        invertedBubbleSort(numbers);
        print('Inverted sorted numbers: $numbers');
      case '3':
        shuffle(numbers);
        print('Shuffled numbers: $numbers');
      case '4':
        printPyramid(numbers);
      case '5':
        printSortedPyramid(numbers);
      default:
        print('Invalid choice');
    }
    
    stopwatch.stop();
    print('Execution time: ${stopwatch.elapsedMicroseconds} microseconds');
  }
}