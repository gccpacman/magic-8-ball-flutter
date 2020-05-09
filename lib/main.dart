import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(home: BallPage()),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ask Me Anything',
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Ball()),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
            print('Ball got clicked.');
          });
        },
        child: Image.asset('images/ball$ballNumber.png'),
      ),
    );
  }
}
