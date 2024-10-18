class Graph {
  final List<List<int>> adjacencyMatrix;
  final List<int> vertices;
  List<bool> visited;

  Graph(this.adjacencyMatrix, this.vertices)
      : visited = List<bool>.filled(vertices.length, false);

  int findNearestUnvisited(int current) {
    int nearest = -1;
    int minDistance = double.infinity.toInt();
    for (int i = 0; i < vertices.length; i++) {
      if (!visited[i] && adjacencyMatrix[current][i] != 0) {
        if (adjacencyMatrix[current][i] < minDistance) {
          minDistance = adjacencyMatrix[current][i];
          nearest = i;
        }
      }
    }
    return nearest;
  }

  void traverseGraph() {
    int current = 0;
    markVisited(current); // Mark the starting vertex as visited
    print('Starting at vertex: ${vertices[current]}');

    while (!allVerticesVisited()) {
      if (isLastVertex(current)) {
        print('Reached the last vertex: ${vertices[current]}');

        // Find the nearest unvisited vertex
        int nearest = findNearestUnvisited(current);
        if (nearest != -1) {
          print('Connecting current vertex ${vertices[current]} to nearest unvisited vertex: ${vertices[nearest]}');
          markVisited(nearest);
          current = nearest; // Move to the nearest unvisited vertex
        } else {
          print('No unvisited vertex found. Stopping traversal.');  
          break; // Stop traversal if no unvisited vertex is found
        }
      } else {
        int next = goToNextVertex(current);
        print('Moving to the next vertex: ${vertices[next]}');
        current = next;
        markVisited(current); // Mark the new current vertex as visited
      }
    }

    print('All vertices have been visited.');
  }

  void markVisited(int index) {
    visited[index] = true;
    print('Marking vertex ${vertices[index]} as visited');
  }

  bool isLastVertex(int index) {
    return index == vertices.length - 1;
  }

  int goToNextVertex(int current) {
    return (current + 1) % vertices.length;
  }

  bool allVerticesVisited() {
    return visited.every((v) => v);
  }
}

void main() {
  List<int> vertices = [5, 3, 6, 2, 8];
  List<List<int>> adjacencyMatrix = [
    [0, 10, 15, 20, 25],
    [10, 0, 35, 25, 30],
    [15, 35, 0, 30, 10],
    [20, 25, 30, 0, 50],
    [25, 30, 10, 50, 0],
  ];

  Graph graph = Graph(adjacencyMatrix, vertices);
  graph.traverseGraph();
}
