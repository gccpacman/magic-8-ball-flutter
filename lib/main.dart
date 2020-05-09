import 'dart:math';
import 'dart:async';

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
  int _start = 10;
  Timer _timer;

  void startTimer(){
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec,(Timer timer) => setState(
      (){
        if (_start < 1) {
          timer.cancel();
        } else {
          _start = _start - 1;
        }
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                ballNumber = Random().nextInt(5) + 1;
                print('Ball got clicked.');
              });
            },
            child: Image.asset('images/ball$ballNumber.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '$_start',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RaisedButton(
            onPressed: (){
              print('start button pressed.');
              startTimer();
            },
            child: Text('Start'),
          ),
          RaisedButton(
            onPressed: (){
              setState(() {
                print('reset button pressed.');
                if (_timer.isActive) {
                  _timer.cancel();
                  print('timer canceled.');
                }
                _start = 10;     
              });
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}
