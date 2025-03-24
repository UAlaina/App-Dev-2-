class Pizza {
  final String name;
  final String image;
  final String description;
  final double basePrice;

  Pizza({
    required this.name,
    required this.image,
    required this.description,
    required this.basePrice,
  });
}

class Topping {
  final String name;
  final double price;
  int quantity;

  Topping({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}