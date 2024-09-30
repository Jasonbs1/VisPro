abstract class Animal {
  void sound();  // Abstract method for sound
  void eat();    // Abstract method for eating
}

// Dog class that extends Animal
class Dog extends Animal {
  @override
  void sound() {
    print('Dog barks: Woof Woof!');
  }

  @override
  void eat() {
    print('Dog is eating bones.');
  }
}

// Cat class that extends Animal
class Cat extends Animal {
  @override
  void sound() {
    print('Cat meows: Meow Meow!');
  }

  @override
  void eat() {
    print('Cat is eating fish.');
  }
}
