import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherView extends StatefulWidget {
  static const String routeName = '/other-view';

  const OtherView({Key? key}) : super(key: key);

  @override
  _OtherViewState createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  double _value = 1.2;
  double _value1 = 1.0;
  var _selectedRange = const RangeValues(1, 2.5);
  var _selectedRange1 = const RangeValues(2, 4);
  bool? _checkBox = true;
  bool? _checkBox1 = false;
  bool? _checkBox2;
  final bool _radio = true;
  final bool _radio1 = false;
  final bool? _radio2 = null;
  bool? _groupRadio = true;
  bool _switch = false;

  void _onChangedRadio(bool? value) {
    setState(() {
      _groupRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other View'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _myIconTitle('Progress indicators', Icons.donut_large),
              _space(),
              const CircularProgressIndicator(),
              _space(),
              _space(),
              const LinearProgressIndicator(),
              _space(),
              const LinearProgressIndicator(
                value: 0.0,
              ),
              _space(),
              _myIconTitle('Selection controls', Icons.check_box),
              _space(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    tristate: true,
                    value: _checkBox,
                    onChanged: (val) {
                      setState(() {
                        _checkBox = val;
                      });
                    },
                  ),
                  Checkbox(
                    tristate: true,
                    value: _checkBox1,
                    onChanged: (val) {
                      setState(() {
                        _checkBox1 = val;
                      });
                    },
                  ),
                  Checkbox(
                    tristate: true,
                    value: _checkBox2,
                    onChanged: (val) {
                      setState(() {
                        _checkBox2 = val;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _myRadio(_radio),
                  _myRadio(_radio1),
                  _myRadio(_radio2),
                ],
              ),
              Switch(
                value: _switch,
                onChanged: (val) {
                  setState(() {
                    _switch = val;
                  });
                },
              ),
              _space(),
              _myIconTitle('Sliders', Icons.tune),
              Slider(
                min: 0,
                max: 5,
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                },
              ),
              Slider(
                divisions: 5,
                min: 0,
                max: 5,
                value: _value1,
                onChanged: (val) {
                  setState(() {
                    _value1 = val;
                  });
                },
              ),
              RangeSlider(
                min: 0,
                max: 5,
                values: _selectedRange,
                onChanged: (val) {
                  setState(() {
                    _selectedRange = val;
                  });
                },
              ),
              RangeSlider(
                divisions: 5,
                min: 0,
                max: 5,
                values: _selectedRange1,
                onChanged: (val) {
                  setState(() {
                    _selectedRange1 = val;
                  });
                },
              ),
              _space(),
              _myIconTitle("Tooltips", Icons.message),
              _space(),
              const Tooltip(
                message: 'This is a tooltip',
                child: Icon(
                  Icons.near_me,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myIconTitle(String name, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.purple,
        ),
        const SizedBox(width: 10),
        Text(name),
      ],
    );
  }

  Widget _myRadio(bool? value) {
    return Radio<bool?>(
      value: value,
      groupValue: _groupRadio,
      onChanged: _onChangedRadio,
    );
  }

  Widget _space() {
    return const SizedBox(
      height: 10,
    );
  }
}
