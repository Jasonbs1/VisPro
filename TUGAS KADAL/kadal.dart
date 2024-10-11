import 'dart:math';
import 'dart:async';

class Point {
  int x, y;
  Point(this.x, this.y);
}

class KadalGame {
  late List<List<String>> board;
  late List<Point> kadal;
  late Point food;
  int width, height;
  int score = 0;
  Random random = Random();
  List<List<Point>> kadalShape = [
    // Up
    [Point(0, -2), Point(-1, -1), Point(0, -1), Point(1, -1), Point(0, 0), 
     Point(-1, 1), Point(0, 1), Point(1, 1), Point(0, 2)],
    // Right
    [Point(2, 0), Point(1, -1), Point(1, 0), Point(1, 1), Point(0, 0), 
     Point(-1, -1), Point(-1, 0), Point(-1, 1), Point(-2, 0)],
    // Down
    [Point(0, 2), Point(-1, 1), Point(0, 1), Point(1, 1), Point(0, 0), 
     Point(-1, -1), Point(0, -1), Point(1, -1), Point(0, -2)],
    // Left
    [Point(-2, 0), Point(-1, -1), Point(-1, 0), Point(-1, 1), Point(0, 0), 
     Point(1, -1), Point(1, 0), Point(1, 1), Point(2, 0)],
  ];
  int currentDirection = 0; // 0: up, 1: right, 2: down, 3: left
  int growth = 0;

  KadalGame(this.width, this.height) {
    board = List.generate(height, (_) => List.filled(width, ' '));
    kadal = [Point(width ~/ 2, height ~/ 2)];
    generateFood();
  }

  void generateFood() {
    do {
      food = Point(random.nextInt(width), random.nextInt(height));
    } while (isPointInKadal(food));
  }

  bool isPointInKadal(Point p) {
    return getKadalPoints().any((kp) => kp.x == p.x && kp.y == p.y);
  }

  List<Point> getKadalPoints() {
    List<Point> points = [];
    for (int i = 0; i < kadal.length; i++) {
      Point segment = kadal[i];
      List<Point> segmentShape = kadalShape[currentDirection];
      for (Point p in segmentShape) {
        points.add(Point(
          (segment.x + p.x + width) % width,
          (segment.y + p.y + height) % height
        ));
      }
    }
    return points;
  }

  void move() {
    Point head = kadal.first;
    Point nextMove;

    if (food.x > head.x) {
      nextMove = Point(head.x + 1, head.y);
      currentDirection = 1; // Right
    } else if (food.x < head.x) {
      nextMove = Point(head.x - 1, head.y);
      currentDirection = 3; // Left
    } else if (food.y > head.y) {
      nextMove = Point(head.x, head.y + 1);
      currentDirection = 2; // Down
    } else {
      nextMove = Point(head.x, head.y - 1);
      currentDirection = 0; // Up
    }

    // Wrap around if out of bounds
    nextMove.x = (nextMove.x + width) % width;
    nextMove.y = (nextMove.y + height) % height;

    kadal.insert(0, nextMove);

    if (nextMove.x == food.x && nextMove.y == food.y) {
      score++;
      growth += 3; // Kadal akan bertambah panjang 3 segmen setiap makan
      generateFood();
    } else if (growth > 0) {
      growth--;
    } else {
      kadal.removeLast();
    }
  }

  void draw() {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        board[y][x] = ' ';
      }
    }

    for (var point in getKadalPoints()) {
      if (point.x >= 0 && point.x < width && point.y >= 0 && point.y < height) {
        board[point.y][point.x] = 'K';
      }
    }

    board[food.y][food.x] = 'O';

    print('\x1B[2J\x1B[0;0H'); // Clear console
    print('Score: $score');
    for (var row in board) {
      print(row.join(''));
    }
  }

  bool isGameOver() {
    var kadalPoints = getKadalPoints();
    var head = kadalPoints.first;
    return kadalPoints.skip(9).any((segment) => 
      segment.x == head.x && segment.y == head.y
    );
  }
}

void main() async {
  var game = KadalGame(40, 20);

  while (!game.isGameOver()) {
    game.move();
    game.draw();
    await Future.delayed(Duration(milliseconds: 200));
  }

  print('Game Over! Final Score: ${game.score}');
}