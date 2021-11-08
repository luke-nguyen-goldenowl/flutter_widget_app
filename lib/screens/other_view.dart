import 'package:flutter/material.dart';

class OtherView extends StatelessWidget {
  static const String routeName = '/other-view';

  const OtherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other View'),
      ),
      body: Container(),
    );
  }
}
