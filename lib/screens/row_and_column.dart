import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  static const String routeName = '/row-&-column';

  const RowAndColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row & Column'),
      ),
      body: Container(),
    );
  }
}
