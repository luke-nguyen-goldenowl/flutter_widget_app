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
      body: Container(),
    );
  }
}
