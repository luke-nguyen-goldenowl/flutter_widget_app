import 'package:flutter/material.dart';

class ContainerView extends StatefulWidget {
  static const String routeName = '/container_view';

  const ContainerView({Key? key}) : super(key: key);

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  bool _showBorder = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container View'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
          //SwitchListTile(value: _showBorder, onChanged: onChanged)
        ],
      ),
    );
  }
}
