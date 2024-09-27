import 'dart:math';

class Location {
  String name;
  Map<String, int> distances;

  Location(this.name, this.distances);
}

void main() {
  var locations = {
    'A': Location('A', {'B': 10, 'C': 15, 'D': 20, 'E': 25}),
    'B': Location('B', {'A': 10, 'C': 35, 'D': 25, 'E': 30}),
    'C': Location('C', {'A': 15, 'B': 35, 'D': 30, 'E': 20}),
    'D': Location('D', {'A': 20, 'B': 25, 'C': 30, 'E': 15}),
    'E': Location('E', {'A': 25, 'B': 30, 'C': 20, 'D': 15}),
  };

  var route = ['A'];
  var current = 'A';
  var totalDistance = 0;

  while (route.length < locations.length) {
    var nearest = locations.keys
        .where((loc) => !route.contains(loc))
        .reduce((a, b) => locations[current]!.distances[a]! < locations[current]!.distances[b]! ? a : b);
    
    totalDistance += locations[current]!.distances[nearest]!;
    route.add(nearest);
    current = nearest;
  }

  totalDistance += locations[current]!.distances['A']!;
  route.add('A');

  print('Optimized route: ${route.join(' -> ')}');
  print('Total distance: $totalDistance km');
}