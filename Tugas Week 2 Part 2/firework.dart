import 'dart:async';
import 'dart:io';

// ASCII frames for firework explosion
const List<String> fireworkFrames = [
  "   *   ",
  "  ***  ",
  " ***** ",
  "*******",
  " ***** ",
  "  ***  ",
  "   *   ",
];

// Function to launch the firework as a vertical line "|"
Future<void> launchFirework(int x, int launchHeight, Map<String, String> colorScheme) async {
  int terminalHeight = stdout.terminalLines;

  for (int y = terminalHeight; y >= launchHeight; y--) {
    // Clear previous frame
    clearLineAt(y + 1);
    
    // Draw the launch line at the new position
    print('\x1B[${y};${x}H|\x1B[0m');
    await Future.delayed(Duration(milliseconds: 50));  // Adjust the delay for a smooth launch
  }

  // After launch, start the firework explosion
  await animateFirework(x, launchHeight, colorScheme);
}

// Function to animate the firework explosion
Future<void> animateFirework(int x, int y, Map<String, String> colorScheme) async {
  // Get background color with a fallback if the value is null
  String backgroundColor = colorScheme['background'] ?? '\x1B[40m';  // Default to black background

  // Change the entire background color during the explosion
  setBackgroundColor(backgroundColor);

  for (String frame in fireworkFrames) {
    await drawFrameAtPosition(x, y, frame, colorScheme);
    await Future.delayed(Duration(milliseconds: 200));
  }

  // Reset the background color after the firework explosion is over
  resetBackgroundColor();
}

// Helper function to draw firework explosion frame
Future<void> drawFrameAtPosition(int x, int y, String frame, Map<String, String> colorScheme) async {
  String foregroundColor = colorScheme['foreground'] ?? '\x1B[37m';  // Default to white text
  print('\x1B[${y};${x}H$foregroundColor$frame\x1B[0m');
}

// Helper function to clear the previous line (used for clearing the launch line)
void clearLineAt(int y) {
  print('\x1B[${y};0H\x1B[2K'); // Clears the specific line
}

// Function to set the entire terminal background color
void setBackgroundColor(String backgroundColorCode) {
  // Fill the screen with the background color
  print('$backgroundColorCode\x1B[2J');  // Clear screen with the background color
}

// Function to reset the terminal background to the default
void resetBackgroundColor() {
  print('\x1B[0m\x1B[2J'); // Reset the terminal to default color and clear the screen
}
