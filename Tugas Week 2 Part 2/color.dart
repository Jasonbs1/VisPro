import 'dart:math';

// ANSI codes for foreground (text) colors
const List<String> ansiForegroundColors = [
  '\x1B[31m', // Red
  '\x1B[32m', // Green
  '\x1B[33m', // Yellow
  '\x1B[34m', // Blue
  '\x1B[35m', // Magenta
  '\x1B[36m', // Cyan
];

// ANSI codes for background colors
const List<String> ansiBackgroundColors = [
  '\x1B[41m', // Red background
  '\x1B[42m', // Green background
  '\x1B[43m', // Yellow background
  '\x1B[44m', // Blue background
  '\x1B[45m', // Magenta background
  '\x1B[46m', // Cyan background
];

// Function to get a random color for both text and background
Map<String, String> getRandomColorScheme() {
  int index = Random().nextInt(ansiForegroundColors.length);
  return {
    'foreground': ansiForegroundColors[index],
    'background': ansiBackgroundColors[index],
  };
}
