import 'package:flutter/material.dart';

class BottomAppBarView extends StatelessWidget {
  static const String routeName = '/bottom_app_bar';

  const BottomAppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar View'),
      ),
      body: Container(),
    );
  }
}
