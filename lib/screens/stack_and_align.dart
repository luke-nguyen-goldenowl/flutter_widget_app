import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackAndAlign extends StatefulWidget {
  static const String routeName = '/stack-&-align';

  const StackAndAlign({Key? key}) : super(key: key);

  @override
  _StackAndAlignState createState() => _StackAndAlignState();
}

class _StackAndAlignState extends State<StackAndAlign> {
  final List<Alignment> _listAlign = [
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];
  Alignment _align = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Align'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                alignment: _align,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.greenAccent[400],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            _myDrop<Alignment>(
              _align,
              _listAlign,
              onChangeValue: (val) {
                setState(() {
                  _align = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _myDrop<T>(T myValue, List<T> myList, {required onChangeValue}) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Row(
        children: [
          Expanded(
            child: Text(
              myValue.runtimeType.toString(),
              style: const TextStyle(fontSize: 17),
            ),
          ),
          DropdownButton<T>(
            borderRadius: BorderRadius.circular(10),
            value: myValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            onChanged: onChangeValue,
            items: myList.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString().split('.').last),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
