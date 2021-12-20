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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
