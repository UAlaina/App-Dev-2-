import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pizza_details_screen.dart';
import 'screens/order_summary_screen.dart';
import 'providers/user_provider.dart';
import 'providers/pizza_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PizzaProvider()),
      ],
      child: MaterialApp(
        title: 'Pizza App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const RegisterScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/details': (context) => const PizzaDetailsScreen(),
          '/orderSummary': (context) => const OrderSummaryScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}