import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  static const String routeName = '/container-view';

  const ContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container View'),
      ),
      body: Container(),
    );
  }
}
