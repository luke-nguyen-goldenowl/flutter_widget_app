import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ContainerView extends StatefulWidget {
  static const String routeName = '/container_view';

  const ContainerView({Key? key}) : super(key: key);

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

enum MyBorderRadius {
  round,
  left,
  right,
  top,
  bottom,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  circle,
}

enum MyGradient {
  linearGradient,
  radialGradient,
  sweepGradient,
}

class _ContainerViewState extends State<ContainerView> {
  bool _showBorder = true;
  bool _showShadow = true;
  Map<MyBorderRadius, BorderRadius> mapBorder = {
    MyBorderRadius.round: BorderRadius.circular(20),
    MyBorderRadius.circle: BorderRadius.circular(200),
    MyBorderRadius.left:
        const BorderRadius.horizontal(left: Radius.circular(20)),
    MyBorderRadius.right:
        const BorderRadius.horizontal(right: Radius.circular(20)),
    MyBorderRadius.top: const BorderRadius.vertical(top: Radius.circular(20)),
    MyBorderRadius.bottom:
        const BorderRadius.vertical(bottom: Radius.circular(20)),
    MyBorderRadius.topLeft:
        const BorderRadius.only(topLeft: Radius.circular(20)),
    MyBorderRadius.topRight:
        const BorderRadius.only(topRight: Radius.circular(20)),
    MyBorderRadius.bottomLeft:
        const BorderRadius.only(bottomLeft: Radius.circular(20)),
    MyBorderRadius.bottomRight:
        const BorderRadius.only(bottomRight: Radius.circular(20)),
  };
  MyBorderRadius _radius = MyBorderRadius.round;
  BlendMode _blendMode = BlendMode.src;
  MyGradient _gradient = MyGradient.linearGradient;

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

  BorderRadius? _onChangedBorderRadius(MyBorderRadius radius) {
    return mapBorder[radius];
  }

  Gradient _onChangedBackground(MyGradient gradient) {
    return _gradient == MyGradient.linearGradient
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.blue,
              Colors.red,
            ],
            tileMode: TileMode.repeated,
          )
        : _gradient == MyGradient.radialGradient
            ? const RadialGradient(
                center: Alignment.center,
                radius: 0.5,
                colors: <Color>[
                  Colors.blue,
                  Colors.red,
                ],
                stops: <double>[0.5, 1.0],
              )
            : const SweepGradient(
                center: Alignment.center,
                startAngle: 0.0,
                endAngle: pi * 2,
                colors: <Color>[
                  Colors.blue,
                  Colors.red,
                  Colors.blue,
                  Colors.red,
                  Colors.blue,
                ],
                stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: _showBorder
                        ? Border.all(
                            width: 3,
                            color: Colors.blue,
                          )
                        : null,
                    borderRadius: _onChangedBorderRadius(_radius),
                    boxShadow: _showShadow
                        ? [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                    gradient: _onChangedBackground(_gradient),
                    backgroundBlendMode: _blendMode,
                  ),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text(
              'Border',
              style: TextStyle(fontSize: 17),
            ),
            value: _showBorder,
            onChanged: _onShowBorder,
          ),
          _myDrop<MyBorderRadius>(
            _radius,
            MyBorderRadius.values,
            onChangeValue: (val) {
              setState(() {
                _radius = val;
              });
            },
          ),
          SwitchListTile(
            title: const Text(
              'Shadow',
              style: TextStyle(fontSize: 17),
            ),
            value: _showShadow,
            onChanged: _onShowShadow,
          ),
          _myDrop<MyGradient>(
            _gradient,
            MyGradient.values,
            onChangeValue: (val) {
              setState(() {
                _gradient = val;
              });
            },
          ),
          _myDrop<BlendMode>(
            _blendMode,
            BlendMode.values,
            onChangeValue: (val) {
              setState(() {
                _blendMode = val;
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
