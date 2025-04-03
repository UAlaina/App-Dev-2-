import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBallAnimation(),
    );
  }
}

class MyBallAnimation extends StatefulWidget {
  const MyBallAnimation({super.key});

  @override
  State<MyBallAnimation> createState() => _MyBallAnimationState();
}

class _MyBallAnimationState extends State<MyBallAnimation> with SingleTickerProviderStateMixin{

  //create objects for animation ans controller
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this)..repeat(reverse: true);
    _animation = Tween<double>(begin: 0,end: 350).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            //the translate function is called activation function that gets the offset value
            //from the animation which helps the ball to move from initial position that is 0
            return Transform.translate(offset: Offset(0, _animation.value),
            child: child);
          },
          child: Container(
            //color: Colors.redAccent,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
