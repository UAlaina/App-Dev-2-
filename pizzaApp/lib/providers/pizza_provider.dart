import 'package:flutter/material.dart';
import '../models/pizza_model.dart';

class PizzaProvider extends ChangeNotifier {
  final List<Pizza> _pizzas = [
    Pizza(
      name: 'Margherita',
      image: 'assets/margherita.png',
      description: 'Classic pizza with tomato sauce, mozzarella, and basil',
      basePrice: 8.99,
    ),
    Pizza(
      name: 'Pepperoni',
      image: 'assets/pepperoni.png',
      description: 'Pizza topped with tomato sauce, mozzarella, and pepperoni slices',
      basePrice: 10.99,
    ),
    Pizza(
      name: 'Veggie',
      image: 'assets/veggie.png',
      description: 'Pizza loaded with bell peppers, mushrooms, onions, and olives',
      basePrice: 9.99,
    ),
    Pizza(
      name: 'BBQ Chicken',
      image: 'assets/bbq_chicken.png',
      description: 'Pizza with BBQ sauce, chicken, red onions, and cilantro',
      basePrice: 12.99,
    ),
  ];

  List<Pizza> get pizzas => _pizzas;

  final Map<String, double> _sizeMultipliers = {
    'Small': 1.0,
    'Medium': 1.3,
    'Large': 1.6,
  };

  final List<Topping> _availableToppings = [
    Topping(name: 'Extra Cheese', price: 1.50),
    Topping(name: 'Mushrooms', price: 1.00),
    Topping(name: 'Onions', price: 0.75),
    Topping(name: 'Bell Peppers', price: 1.00),
    Topping(name: 'Olives', price: 1.25),
  ];

  List<Topping> get availableToppings => _availableToppings;
  Map<String, double> get sizeMultipliers => _sizeMultipliers;

  double calculateTotal(Pizza pizza, String size, int quantity, List<Topping> selectedToppings) {
    double baseTotal = pizza.basePrice * _sizeMultipliers[size]! * quantity;

    double toppingsTotal = 0;
    for (var topping in selectedToppings) {
      toppingsTotal += topping.price * topping.quantity;
    }

    return baseTotal + toppingsTotal;
  }
}