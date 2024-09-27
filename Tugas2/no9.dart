class Item {
  String name;
  int weight;
  int value;

  Item(this.name, this.weight, this.value);
}

void main() {
  var items = [
    Item('Food', 3, 50),
    Item('Clothes', 2, 30),
    Item('Cooking gear', 4, 40),
    Item('Tent', 5, 70),
    Item('Sleeping bag', 2, 20),
  ];

  const maxWeight = 10;
  var backpack = <Item>[];
  var currentWeight = 0;
  var totalValue = 0;

  items.sort((a, b) => (b.value / b.weight).compareTo(a.value / a.weight));

  for (var item in items) {
    if (currentWeight + item.weight <= maxWeight) {
      backpack.add(item);
      currentWeight += item.weight;
      totalValue += item.value;
    }
  }

  print('Items in backpack:');
  for (var item in backpack) {
    print('${item.name} (${item.weight} kg, value: ${item.value})');
  }
  print('Total weight: $currentWeight kg');
  print('Total value: $totalValue');
}