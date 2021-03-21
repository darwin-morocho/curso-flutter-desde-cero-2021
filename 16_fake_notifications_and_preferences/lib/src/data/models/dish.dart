class Dish {
  final int id;
  final String name, photo, description;
  final double price;
  final double? rate;
  final int counter;

  Dish({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.rate,
    required this.description,
    this.counter = 0,
  });

  Dish updateCounter(int counter) {
    return Dish(
      id: this.id,
      name: this.name,
      photo: this.photo,
      price: this.price,
      rate: this.rate,
      description: this.description,
      counter: counter,
    );
  }
}
