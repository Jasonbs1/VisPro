abstract class Vehicle {
  String _name;
  int _speed;

  Vehicle(this._name, this._speed);

  // Getter and Setter for name
  String get name => _name;
  set name(String newName) => _name = newName;

  // Getter and Setter for speed
  int get speed => _speed;
  set speed(int newSpeed) {
    if (newSpeed < 0) {
      print('Speed cannot be negative.');
      _speed = 0;
    } else {
      _speed = newSpeed;
    }
  }

  // Abstract method to be overridden by subclasses
  void move();
}

class Car extends Vehicle {
  Car(String name, int speed) : super(name, speed);

  @override
  void move() {
    String movementSpeed = _getMovementSpeed();
    print('The car $name moves $movementSpeed on roads.');
  }

  String _getMovementSpeed() {
    if (speed > 60) {
      return 'fast';
    } else if (speed < 30) {
      return 'slow';
    } else {
      return 'at a normal speed';
    }
  }
}

class Bike extends Vehicle {
  Bike(String name, int speed) : super(name, speed);

  @override
  void move() {
    String movementSpeed = _getMovementSpeed();
    print('The bike $name moves $movementSpeed through traffic.');
  }

  String _getMovementSpeed() {
    if (speed > 60) {
      return 'fast';
    } else if (speed < 30) {
      return 'slow';
    } else {
      return 'at a normal speed';
    }
  }
}
