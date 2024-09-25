import 'dart:math';

void bubbleSort(List<int> numbers) {
  var i = 0;
  var j = 0;
  var temp = 0;
  recursiveSort(numbers, i, j, temp, false);
}

void invertedBubbleSort(List<int> numbers) {
  var i = 0;
  var j = 0;
  var temp = 0;
  recursiveSort(numbers, i, j, temp, true);
}

void recursiveSort(List<int> numbers, int i, int j, int temp, bool ascending) {
  var shouldSwap = ascending ? numbers[j] > numbers[j + 1] : numbers[j] < numbers[j + 1];
  temp = shouldSwap ? numbers[j] : numbers[j + 1];
  numbers[j + 1] = shouldSwap ? numbers[j + 1] : numbers[j];
  numbers[j] = temp;
  
  j++;
  var resetJ = j >= numbers.length - 1 - i;
  i += resetJ ? 1 : 0;
  j = resetJ ? 0 : j;
  
  var continueSort = i < numbers.length - 1;
  continueSort ? recursiveSort(numbers, i, j, temp, ascending) : null;
}

void shuffle(List<int> numbers) {
  final random = Random();
  var i = numbers.length - 1;
  var temp = 0;
  
  shuffleHelper(numbers, random, i, temp);
}

void shuffleHelper(List<int> numbers, Random random, int i, int temp) {
  var j = random.nextInt(i + 1);
  temp = numbers[i];
  numbers[i] = numbers[j];
  numbers[j] = temp;
  
  i--;
  i >= 0 ? shuffleHelper(numbers, random, i, temp) : null;
}