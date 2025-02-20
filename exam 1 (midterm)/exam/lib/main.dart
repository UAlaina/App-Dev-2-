import 'package:flutter/material.dart';

void main() {
  runApp(const HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        )
      ),
      home: HotelBookingScreen(),
    );
  }
}

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  int guestCount = 1;
  int roomCount = 1;

  void incrementGuests() {
    setState(() {
      guestCount++;
    });
  }

  void decrementGuests() {
    if (guestCount > 1) {
      setState(() {
        guestCount--;
      });
    }
  }

  void incrementRooms() {
    setState(() {
      roomCount++;
    });
  }

  void decrementRooms() {
    if (roomCount > 1) {
      setState(() {
        roomCount--;
      });
    }
  }

  void showReservationMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Text(
            'You booked $guestCount guests and ${roomCount} rooms.\nthanks',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.black,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10),
        child: const Icon(
          Icons.arrow_back_ios, color: Colors.orange,
        ),
      ),
      title: const Text('Hotels', style: TextStyle(color: Colors.white),
      ),
    ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 15),
                const Text('Las Vegas, NV', style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 18
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.people, color: Colors.black),
                const SizedBox(width: 15),
                Text('$guestCount Guests', style: const TextStyle(fontSize: 20),
                ),
                const Spacer(),

                _buildButton(Icons.remove, decrementGuests),
                const SizedBox(width: 10),
                _buildButton(Icons.add, incrementGuests),
              ],
            ),
          ),
          const Divider(height: 1),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.hotel, color: Colors.black),
                const SizedBox(width: 15),
                Text('$roomCount Room', style: const TextStyle(fontSize: 20),
                ),
                const Spacer(),

                _buildButton(Icons.remove, decrementRooms),
                const SizedBox(width: 10),
                _buildButton(Icons.add, incrementRooms),
              ],
            ),
          ),
          const Divider(height: 1),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.arrow_forward, color: Colors.black),
                const SizedBox(width: 15),
                Text('Today', style: const TextStyle(fontSize: 20),
                ),
                Spacer(),
                const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.arrow_back, color: Colors.black),
                const SizedBox(width: 15),
                Text('Tomorrow', style: const TextStyle(fontSize: 20),
                ),
                Spacer(),
                const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(onPressed: showReservationMessage, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            ),
              child: const Text(
                'Reserve', style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange[200]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.orange),
        onPressed: onPressed,
      ),
    );
  }
}



