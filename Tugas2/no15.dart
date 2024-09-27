import 'dart:collection';

class Task {
  String name;
  List<String> dependencies;
  Task(this.name, this.dependencies);
}

void main() {
  var tasks = {
    'A': Task('A', []),
    'B': Task('B', ['A']),
    'C': Task('C', ['B']),
    'D': Task('D', ['A']),
    'E': Task('E', ['D']),
    'F': Task('F', ['C', 'E']),
  };

  var completed = <String>[];
  var queue = Queue<String>();

  // Find tasks with no dependencies
  tasks.forEach((name, task) {
    if (task.dependencies.isEmpty) {
      queue.add(name);
    }
  });

  while (queue.isNotEmpty) {
    var taskName = queue.removeFirst();
    completed.add(taskName);

    // Check if completing this task allows any other tasks to start
    tasks.forEach((name, task) {
      if (!completed.contains(name) && !queue.contains(name)) {
        if (task.dependencies.every((dep) => completed.contains(dep))) {
          queue.add(name);
        }
      }
    });
  }

  print('Efficient task order: ${completed.join(' -> ')}');
}