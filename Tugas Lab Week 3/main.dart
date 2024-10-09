import 'dart:io'; // Library for input and output operations
import 'color.dart' as color;
import 'dart:async';

class Node {
  String? value; // Nullable property to store data within the node
  Node? next; // Pointer to the next node, also nullable

  Node(this.value); // Constructor to initialize the node with data
}

/// Delays the execution for a specified number of milliseconds
Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

/// Moves the cursor to a specific position in the console
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

/// Retrieves the current size of the terminal screen
List<int> getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

/// Clears the console screen and moves the cursor to the top-left corner
void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // Clear the entire screen and reset cursor position
}

/// Traverses the linked list and prints the data of each node
void traverseAndDisplay(Node head) {
  int index = 1; // Index for numbering nodes
  Node? currentNode = head; // Start from the head (first node)
  while (currentNode != null) {
    stdout.write('${index}. ${currentNode.value}\n'); // Print data for each node
    currentNode = currentNode.next; // Move to the next node
    index++;
  }
}

/// Inserts a new node at a specified position in the linked list
Node insertNodeAt(Node head, Node newNode, int position) {
  // If inserting at the first position, make newNode the head
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }

  // Start searching for the desired position from the head
  Node? currentNode = head;
  int index = 1;
  while (currentNode != null && index < position - 1) {
    currentNode = currentNode.next; // Traverse to the previous position
    index++;
  }

  // Insert the new node at the target position
  newNode.next = currentNode?.next;
  if (currentNode != null) {
    currentNode.next = newNode;
  }

  return head; // Return the updated head
}

/// Swaps two nodes at specified positions in the linked list
Node swapNodes(Node head, int pos1, int pos2) {
  if (pos1 == pos2) return head; // No need to swap if positions are the same

  // Find the nodes at the specified positions
  Node? prevNode1, node1 = head;
  Node? prevNode2, node2 = head;
  int index = 1;

  while (node1 != null && index < pos1) {
    prevNode1 = node1;
    node1 = node1.next;
    index++;
  }

  index = 1; // Reset index for the second node search
  while (node2 != null && index < pos2) {
    prevNode2 = node2;
    node2 = node2.next;
    index++;
  }

  // If either node is not found, return the original head
  if (node1 == null || node2 == null) return head;

  // Connect previous nodes to the swapped nodes
  if (prevNode1 != null) {
    prevNode1.next = node2;
  } else {
    head = node2; // Update head if node1 was the head
  }

  if (prevNode2 != null) {
    prevNode2.next = node1;
  } else {
    head = node1; // Update head if node2 was the head
  }

  // Swap the next pointers of the two nodes
  Node? temp = node1.next;
  node1.next = node2.next;
  node2.next = temp;

  return head; // Return the new head after the swap
}

/// Deletes a node at a specified position in the linked list
Node deleteNodeAt(Node head, int position) {
  if (position == 1) {
    return head.next ?? head; // Return the new head after deleting the first node
  }

  // Find the node at the specified position
  Node? currentNode = head;
  Node? prevNode;
  int index = 1;
  while (currentNode != null && index < position) {
    prevNode = currentNode;
    currentNode = currentNode.next;
    index++;
  }

  // If the node to delete is found, connect the previous node to the next one
  if (currentNode != null && prevNode != null) {
    prevNode.next = currentNode.next;
  }

  return head; // Return the new head after deletion
}

/// Creates a loop in the linked list
Node createLoop(Node head) {
  Node? currentNode = head;
  while (currentNode!.next != null) {
    currentNode = currentNode.next;
  }
  currentNode.next = head; // Connect last node to the head to form a loop
  return head;
}

/// Constructs a linked list from a hardcoded string
Node craftListFromString(String input) {
  final whitespacePattern = RegExp(r"^\s+$");
  Node head = Node(input[0]);
  if (!whitespacePattern.hasMatch(input)) {
    for (int i = 1; i < input.length; i++) {
      if (!whitespacePattern.hasMatch(head.value!)) {
        if (!whitespacePattern.hasMatch(input[i])) {
          insertNodeAt(head, Node(input[i]), 0);
        }
      } else {
        head = Node(input[i]);
      }
    }
  } else {
    head = Node("?"); // Set head to a placeholder if the input is empty or whitespace
  }
  createLoop(head); // Activate loop in the linked list
  return head;
}

/// Retrieves the next node in the linked list
Node? getNextNode(Node node) {
  return node.next;
}

/// Main entry point of the program
void main() async {
  try {
    int delayDuration = 5; // Delay duration for printing
    clearScreen(); // Clear the screen
    moveTo(0, 0); // Move to top-left corner

    // Hardcoded values
    String name = "JASON";
    int repetitions = 10;

    Node head = craftListFromString(name); // Create linked list from hardcoded name
    clearScreen();
    moveTo(0, 0);
    
    stdout.write("Number of repetitions: $repetitions\n"); // Display repetitions
    clearScreen();

    String currentColor = color.RESET; // Initialize color
    while (repetitions > 0) {
      Node? currentNode = null;
      stdout.write(currentColor);
      for (int row = 1; row <= getScreenSize()[1]; row++) {
        currentNode ??= head; // Initialize currentNode to head if it's null
        if (row % 2 != 0) { // Odd rows
          for (int col = 1; col <= getScreenSize()[0]; col++) {
            moveTo(row, col);
            stdout.write(currentNode!.value); // Display node value
            currentNode = getNextNode(currentNode)!; // Move to the next node
            await delay(delayDuration); // Delay for a specified duration
          }
        } else { // Even rows
          for (int col = getScreenSize()[0]; col > 0; col--) {
            moveTo(row, col);
            stdout.write(currentNode!.value); // Display node value
            currentNode = getNextNode(currentNode)!; // Move to the next node
            await delay(delayDuration); // Delay for a specified duration
          }
        }
      }
      currentColor = color.getRandomColor(currentColor); // Change color for the next repetition
      repetitions -= 1; // Decrement repetition count
    }
    stdout.write(color.RESET); // Reset color
    clearScreen();
    moveTo(0, 0);
    stdout.write("Done :)");
  } on Exception catch (_) {
    stdout.write(color.RESET); // Reset color
    clearScreen();
    moveTo(0, 0);
    stdout.write("Whoops? :(");
  }
}
