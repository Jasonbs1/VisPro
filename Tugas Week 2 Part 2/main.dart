import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'color.dart';
import 'firework.dart';
import 'ascii.dart';

// Function to get terminal size
Future<List<int>> getTerminalSize() async {
  return [stdout.terminalColumns, stdout.terminalLines];
}

// Function to clear the screen
void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

// Function to prompt the user for the number of fireworks
Future<int> promptFireworkCount() async {
  stdout.write('Enter the number of fireworks to display: ');
  return int.parse(stdin.readLineSync() ?? '5');
}

// Main entry point
void main() async {
  clearScreen();
  int numberOfFireworks = await promptFireworkCount();

  List<int> terminalSize = await getTerminalSize();
  int centerX = terminalSize[0] ~/ 2; // Center of the terminal horizontally
  int centerY = terminalSize[1] ~/ 2; // Center of the terminal vertically

  // Launch the first firework at the center
  Map<String, String> colorScheme = getRandomColorScheme();
  await launchFirework(centerX, centerY, colorScheme);

  // Launch the remaining fireworks at random positions
  for (int i = 1; i < numberOfFireworks; i++) {
    int x = Random().nextInt(terminalSize[0] - 10);  // Ensure the firework doesn't go out of bounds
    int launchHeight = Random().nextInt(terminalSize[1] ~/ 2) + 1;  // Random launch height
    Map<String, String> colorScheme = getRandomColorScheme();
    
    await launchFirework(x, launchHeight, colorScheme);
  }

  displayAsciiGreeting();
}
