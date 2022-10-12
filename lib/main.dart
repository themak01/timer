import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int timeLeft = 5;
  void _startCountDown () {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(timeLeft>0){
        setState(() {
          timeLeft--;
        });
      }else{
        timer.cancel();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              timeLeft == 0 ? 'DONE' : timeLeft.toString(),
              style: TextStyle(fontSize: 70),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              child: Text(
                "S T A R T",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
