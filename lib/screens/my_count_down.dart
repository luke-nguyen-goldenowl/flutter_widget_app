import 'dart:async';
import 'package:flutter/material.dart';

class MyOTPCountDown extends StatefulWidget {
  static const String routeName = '/otp-count-down';
  const MyOTPCountDown({Key? key}) : super(key: key);

  @override
  _MyOTPCountDownState createState() => _MyOTPCountDownState();
}

class _MyOTPCountDownState extends State<MyOTPCountDown> {
  late Timer _timer;
  final Duration _countDownTime = const Duration(seconds: 1);
  int _start = 10;

  void _startTimer() {
    _timer = Timer.periodic(
      _countDownTime,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _onRefresh() {
    setState(() {
      _start = 10;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timer test")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () {
              _startTimer();
            },
            child: const Text(
              "Start",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            "$_start",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30),
          ),
          TextButton(
            onPressed: () {
              _onRefresh();
            },
            child: const Text(
              "Reffressh",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
