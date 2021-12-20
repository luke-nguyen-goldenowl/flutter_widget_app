import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class CupertinoWidgetCont extends StatefulWidget {
  static const String routeName = '/cupertino-widgets-cont';

  const CupertinoWidgetCont({Key? key}) : super(key: key);

  @override
  _CupertinoWidgetContState createState() => _CupertinoWidgetContState();
}

class _CupertinoWidgetContState extends State<CupertinoWidgetCont>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController1;
  int _selectedValue = 0;
  DateTime? _chosenDateTime;
  Duration? _chosenTimer;
  String? _groupValue1;
  int? _groupValue2;

  @override
  void initState() {
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    super.initState();
  }

  void _onSelectItem(int index) {
    setState(() {
      _selectedValue = index;
    });
  }

  void _showPicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoPicker.builder(
        itemExtent: 30,
        childCount: 5,
        onSelectedItemChanged: _onSelectItem,
        itemBuilder: (context, index) {
          return Text(
            'Item ' + index.toString(),
          );
        },
      ),
      semanticsDismissible: true,
    );
  }

  void _showDatePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (val) {
                  setState(() {
                    _chosenDateTime = val;
                  });
                },
                mode: CupertinoDatePickerMode.dateAndTime,
              ),
            ),
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  void _showTimerPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: CupertinoTimerPicker(
                onTimerDurationChanged: (val) {
                  setState(() {
                    _chosenTimer = val;
                  });
                },
              ),
            ),
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: CupertinoButton(
              child: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePage.routeName, (route) => false);
              },
            ),
            middle: const Text('Cupertino Widgets 2'),
            largeTitle: const Text("Large Title"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CupertinoPageTransition(
                  primaryRouteAnimation: _animationController1,
                  secondaryRouteAnimation: _animationController1,
                  linearTransition: false,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CupertinoButton(
                      onPressed: () => _animationController1.forward(),
                      child: const Text('Forward'),
                    ),
                    CupertinoButton(
                      onPressed: () => _animationController1.reverse(),
                      child: const Text('Reverse'),
                    ),
                    CupertinoButton(
                      onPressed: () => _animationController1.repeat(),
                      child: const Text('Repeat'),
                    ),
                  ],
                ),
                CupertinoButton(
                  onPressed: _showPicker,
                  child: Text(
                    'Show Cupertino Picker with Value: ' +
                        _selectedValue.toString(),
                  ),
                ),
                CupertinoButton(
                  onPressed: _showDatePicker,
                  child: Text(
                    'Show Cupertino Date Picker\n' +
                        (_chosenDateTime != null
                            ? _chosenDateTime.toString()
                            : 'No date time picked!'),
                  ),
                ),
                CupertinoButton(
                  onPressed: _showTimerPicker,
                  child: Text(
                    'Show Cupertino Timer Picker\n' +
                        (_chosenTimer != null
                            ? _chosenTimer.toString()
                            : 'No timer picked!'),
                  ),
                ),
                CupertinoSegmentedControl(
                  padding: const EdgeInsets.all(8),
                  groupValue: _groupValue1,
                  selectedColor: Colors.blue,
                  unselectedColor: Colors.white,
                  children: {
                    'a': Text(
                      'A',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    'b': Text(
                      'B',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    'c': Text(
                      'C',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    'd': Text(
                      'D',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  },
                  onValueChanged: (String value) {
                    setState(() {
                      _groupValue1 = value;
                    });
                  },
                ),
                Center(
                  child: Text(
                    _groupValue1 ?? '',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: CupertinoColors.white,
                  thumbColor: CupertinoColors.activeGreen,
                  padding: const EdgeInsets.all(8),
                  groupValue: _groupValue2,
                  children: {
                    0: Text(
                      "Item 1",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    1: Text(
                      "Item 2",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    2: Text(
                      "Item 3",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _groupValue2 = value;
                    });
                  },
                ),
                Center(
                  child: Text(
                    ((_groupValue2 ?? 0) + 1).toString(),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
