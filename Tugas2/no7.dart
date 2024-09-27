void main() {
  var tasks = ['A', 'B', 'C', 'D', 'E'];
  var dependencies = {
    'B': ['A'],
    'C': ['A', 'B'],
    'D': ['C'],
  };

  var completedTasks = <String>[];

  while (tasks.isNotEmpty) {
    for (var task in tasks) {
      if (!dependencies.containsKey(task) || 
          dependencies[task]!.every((dep) => completedTasks.contains(dep))) {
        print('Complete task: $task');
        completedTasks.add(task);
        tasks.remove(task);
        break;
      }
    }
  }
}