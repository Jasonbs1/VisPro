import 'dart:async';
import 'dart:io';

// ASCII art for the greeting message
const String greeting = '''
██╗  ██╗██████╗ ██████╗      █████╗ ██████╗ ███╗   ██╗ ██████╗ ██╗     ██████╗ 
██║  ██║██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔═══██╗██║     ██╔══██╗
███████║██████╔╝██║  ██║    ███████║██████╔╝██╔██╗ ██║██║   ██║██║     ██║  ██║
██╔══██║██╔══██╗██║  ██║    ██╔══██║██╔══██╗██║╚██╗██║██║   ██║██║     ██║  ██║
██║  ██║██████╔╝██████╔╝    ██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗██████╔╝
╚═╝  ╚═╝╚═════╝ ╚═════╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═════╝ 
''';

// Function to display the ASCII greeting with a rising animation
Future<void> displayAsciiGreeting() async {
  List<int> terminalSize = getTerminalSize();
  int terminalWidth = terminalSize[0];
  int terminalHeight = terminalSize[1];

  // Split the greeting into lines
  List<String> greetingLines = greeting.split('\n');
  int greetingHeight = greetingLines.length;

  // Calculate the starting Y position (bottom of the terminal)
  int startY = terminalHeight - greetingHeight;

  // Calculate the center X position
  int centerX = (terminalWidth ~/ 2) - (greetingLines[0].length ~/ 2);

  // Animate the greeting rising from the bottom
  for (int y = startY; y >= 0; y--) {
    clearScreen();

    // Print each line of the greeting at the current Y position
    for (int i = 0; i < greetingLines.length; i++) {
      // Move to the correct position for each line
      print('\x1B[${y + i};${centerX}H${greetingLines[i]}');
    }

    // Delay for smooth animation
    await Future.delayed(Duration(milliseconds: 100));
  }
}

// Function to get terminal size (columns and rows)
List<int> getTerminalSize() {
  int columns = stdout.terminalColumns;
  int rows = stdout.terminalLines;
  return [columns, rows];
}

// Function to clear the screen
void clearScreen() {
  // Clear the entire screen and reset cursor position
  print('\x1B[2J\x1B[H'); // Clear screen and move cursor to the home position
}
