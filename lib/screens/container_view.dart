import 'package:flutter/material.dart';

class ContainerView extends StatefulWidget {
  static const String routeName = '/container_view';

  const ContainerView({Key? key}) : super(key: key);

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  bool _showBorder = true;
  bool _showShadow = true;
  List<BoxShadow> listShadow = [];

  void _onShowBorder(bool value) {
    setState(() {
      _showBorder = value;
    });
  }

  void _onShowShadow(bool value) {
    setState(() {
      _showShadow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container View'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              border: _showBorder
                  ? Border.all(
                      width: 5,
                      color: Colors.red,
                    )
                  : null,
              boxShadow: _showShadow ? listShadow : null,
            ),
          ),
          SwitchListTile(
            title: const Text(
              'Border',
            ),
            value: _showBorder,
            onChanged: _onShowBorder,
          ),
          SwitchListTile(
            title: const Text(
              'Shadow',
            ),
            value: _showShadow,
            onChanged: _onShowShadow,
          ),
        ],
      ),
    );
  }
}
