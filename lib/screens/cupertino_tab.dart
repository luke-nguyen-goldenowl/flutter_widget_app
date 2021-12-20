import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabScreen extends StatefulWidget {
  static const String routeName = '/cupertino-tabs';
  const CupertinoTabScreen({Key? key}) : super(key: key);

  @override
  _CupertinoTabScreenState createState() => _CupertinoTabScreenState();
}

class _CupertinoTabScreenState extends State<CupertinoTabScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.subject_rounded),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tab 2',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text('Content of tab ${index + 1}'),
            );
          },
        );
      },
    );
  }
}
