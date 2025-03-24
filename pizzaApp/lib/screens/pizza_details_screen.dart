import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pizza_model.dart';
import '../providers/pizza_provider.dart';
import '../providers/user_provider.dart';

class PizzaDetailsScreen extends StatefulWidget {
  const PizzaDetailsScreen({Key? key}) : super(key: key);

  @override
  _PizzaDetailsScreenState createState() => _PizzaDetailsScreenState();
}

class _PizzaDetailsScreenState extends State<PizzaDetailsScreen> {
  int quantity = 1;
  String selectedSize = 'Medium';
  late List<Topping> selectedToppings =[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pizzaProvider = Provider.of<PizzaProvider>(context, listen: false);
      setState(() {
        selectedToppings = List.from(pizzaProvider.availableToppings);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final pizza = ModalRoute.of(context)!.settings.arguments as Pizza;
    final pizzaProvider = Provider.of<PizzaProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    // if (selectedToppings == null) {
    //   selectedToppings = List.from(pizzaProvider.availableToppings);
    // }

    double totalPrice = pizzaProvider.calculateTotal(
        pizza,
        selectedSize,
        quantity,
        selectedToppings.where((t) => t.quantity > 0).toList()
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${pizza.name} Pizza'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pizza Image
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                pizza.image,
                fit: BoxFit.cover,
              ),
            ),

            // User ID display
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'User: ${userProvider.currentUser}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Pizza Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pizza.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    pizza.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Size Selection
                  Text(
                    'Select Size:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: pizzaProvider.sizeMultipliers.keys.map((size) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ChoiceChip(
                          label: Text(size),
                          selected: selectedSize == size,
                          onSelected: (selected) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 16),

                  // Quantity Selector
                  Row(
                    children: [
                      Text(
                        'Quantity:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Toppings
                  Text(
                    'Toppings:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: selectedToppings.length,
                    itemBuilder: (context, index) {
                      final topping = selectedToppings[index];
                      return ListTile(
                        title: Text(topping.name),
                        subtitle: Text('\$${topping.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                setState(() {
                                  if (topping.quantity > 0) topping.quantity--;
                                });
                              },
                            ),
                            Text(
                              '${topping.quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setState(() {
                                  topping.quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24),

                  // Total Price
                  Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Order Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/orderSummary',
                          arguments: {
                            'pizza': pizza,
                            'size': selectedSize,
                            'quantity': quantity,
                            'toppings': selectedToppings.where((t) => t.quantity > 0).toList(),
                            'totalPrice': totalPrice,
                          },
                        );
                      },
                      child: Text(
                        'Order Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}