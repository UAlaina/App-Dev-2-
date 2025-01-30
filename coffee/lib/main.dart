import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoffeeHome(),
    );
  }
}

class CoffeeHome extends StatefulWidget {
  const CoffeeHome({super.key});

  //this state represents the present state of the widget
  @override
  State<CoffeeHome> createState() => _CoffeeHomeState();
}


class _CoffeeHomeState extends State<CoffeeHome> {
  // Variables for coffee and toppings count
  int coffeeCount = 1;
  int toppingCount = 0;

  // Prices for coffee and toppings
  double coffeePrice = 5.00;
  double toppingPrice = 1.50;

  // Calculate total price
  double get total => (coffeeCount * coffeePrice) + (toppingCount * toppingPrice);

  // Methods to increment and decrement coffee count
  void incrementCoffee() {
    setState(() {
      coffeeCount++;
    });
  }

  void decrementCoffee() {
    setState(() {
      if (coffeeCount > 0) coffeeCount--;
    });
  }

  // Methods to increment and decrement topping count
  void incrementTopping() {
    setState(() {
      toppingCount++;
    });
  }

  void decrementTopping() {
    setState(() {
      if (toppingCount > 0) toppingCount--;
    });
  }

  // Pay Now action (for now just print the total)
  void payNow() {
    print("Total to pay: \$${total.toStringAsFixed(2)}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('COFFEE APP'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("BUY ME A COFFEE"),
        Image.asset('assets/coffee.jpg', height: 200, width: 200,),

              SizedBox(height: 20),

              // Coffee counter section
              Text('Coffee: \$${coffeePrice.toStringAsFixed(2)} each', style: TextStyle(fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: decrementCoffee, icon: Icon(Icons.remove)),
                  Text(coffeeCount.toString(), style: TextStyle(fontSize: 20)),
                  IconButton(onPressed: incrementCoffee, icon: Icon(Icons.add)),
                ],
              ),

              SizedBox(height: 20),

              // Toppings counter section
              Text('Toppings: \$${toppingPrice.toStringAsFixed(2)} each', style: TextStyle(fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: decrementTopping, icon: Icon(Icons.remove)),
                  Text(toppingCount.toString(), style: TextStyle(fontSize: 20)),
                  IconButton(onPressed: incrementTopping, icon: Icon(Icons.add)),
                ],
              ),

              SizedBox(height: 20),

              // Display total price
              Text('Total: \$${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 40),

              // Pay Now button
              ElevatedButton(
                onPressed: payNow,
                child: Text('Pay Now', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                 ),
              ),
            ],
        ),
      ),
    );
  }
}

