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
  TextDirection _textDir = TextDirection.ltr;
  StackFit _fit = StackFit.loose;
  Clip _clipBehavior = Clip.hardEdge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Align'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: _align,
                textDirection: _textDir,
                fit: _fit,
                clipBehavior: _clipBehavior,
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
                  Positioned(
                    right: -50,
                    bottom: -50,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
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
          _myDrop<TextDirection>(
            _textDir,
            TextDirection.values,
            onChangeValue: (val) {
              setState(() {
                _textDir = val;
              });
            },
          ),
          _myDrop<StackFit>(
            _fit,
            StackFit.values,
            onChangeValue: (val) {
              setState(() {
                _fit = val;
              });
            },
          ),
          _myDrop<Clip>(
            _clipBehavior,
            Clip.values,
            onChangeValue: (val) {
              setState(() {
                _clipBehavior = val;
              });
            },
          ),
        ],
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
