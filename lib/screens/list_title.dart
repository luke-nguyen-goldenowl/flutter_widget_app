import 'package:flutter/material.dart';

class ListTitleView extends StatelessWidget {
  static const String routeName = '/list-title';

  const ListTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Title'),
      ),
      body: Container(),
    );
  }
}
