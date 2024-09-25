void printPyramid(List<int> numbers) {
  var maxNum = numbers.reduce(max);
  var maxWidth = maxNum.toString().length;
  var level = 0;
  var index = 0;
  
  pyramidHelper(numbers, maxWidth, level, index);
}

void pyramidHelper(List<int> numbers, int maxWidth, int level, int index) {
  var elementsInLevel = level + 1;
  var spaces = ' ' * ((maxWidth + 1) * (4 - level) ~/ 2);
  var levelNumbers = <int>[];
  
  addNumbersToLevel(numbers, index, elementsInLevel, levelNumbers);
  
  print(spaces + levelNumbers.map((n) => n.toString().padLeft(maxWidth)).join(' '));
  
  index += elementsInLevel;
  level++;
  
  (index < numbers.length && level < 4) ? pyramidHelper(numbers, maxWidth, level, index) : null;
}

void addNumbersToLevel(List<int> numbers, int start, int count, List<int> levelNumbers) {
  levelNumbers.add(numbers[start]);
  count--;
  start++;
  count > 0 ? addNumbersToLevel(numbers, start, count, levelNumbers) : null;
}

void printSortedPyramid(List<int> numbers) {
  var sorted = List<int>.from(numbers);
  sortListAscending(sorted, 0);
  printPyramid(sorted);
}

void sortListAscending(List<int> numbers, int i) {
  var j = i + 1;
  while (j < numbers.length) {
    var temp = numbers[i] < numbers[j] ? numbers[i] : numbers[j];
    numbers[j] = numbers[i] < numbers[j] ? numbers[j] : numbers[i];
    numbers[i] = temp;
    j++;
  }
  i < numbers.length - 1 ? sortListAscending(numbers, i + 1) : null;
}

int max(int a, int b) => a > b ? a : b;