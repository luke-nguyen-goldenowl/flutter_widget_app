import 'package:flutter/material.dart';

class WrapView extends StatelessWidget {
  static const String routeName = '/wrap-view';

  const WrapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap View'),
      ),
      body: Container(),
    );
  }
}
