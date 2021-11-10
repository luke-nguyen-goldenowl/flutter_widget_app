import 'package:flutter/material.dart';

class StackAndAlign extends StatelessWidget {
  static const String routeName = '/stack-&-align';

  const StackAndAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Align'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
