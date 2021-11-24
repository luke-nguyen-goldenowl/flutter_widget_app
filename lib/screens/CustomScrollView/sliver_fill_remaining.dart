import 'package:flutter/material.dart';

class MySliverFillRemaining extends StatefulWidget {
  static const String routeName = '/sliver fill remaining';

  const MySliverFillRemaining({Key? key}) : super(key: key);

  @override
  _MySliverFillRemainingState createState() => _MySliverFillRemainingState();
}

class _MySliverFillRemainingState extends State<MySliverFillRemaining> {
  bool _hasScrollBody = true;
  bool _fillOverscoll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Fill Remaining'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amber[300],
              height: 500,
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text(
                      'Has Scroll Body',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _hasScrollBody,
                    onChanged: (val) {
                      setState(() {
                        _hasScrollBody = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Fill Overscroll',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _fillOverscoll,
                    onChanged: (val) {
                      setState(() {
                        _fillOverscoll = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: _hasScrollBody,
            fillOverscroll: _fillOverscoll,
            child: Container(
              color: Colors.blue[100],
              child: Icon(
                Icons.sentiment_very_satisfied,
                size: 75,
                color: Colors.blue[900],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amber[300],
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}
