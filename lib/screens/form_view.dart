import 'package:flutter/material.dart';

class FormView extends StatelessWidget {
  static const String routeName = '/form-view';

  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: Container(),
    );
  }
}
