import 'package:flutter/material.dart';

class MySliverOffstage extends StatefulWidget {
  static const String routeName = '/sliver-offstage';

  const MySliverOffstage({Key? key}) : super(key: key);

  @override
  _MySliverOffstageState createState() => _MySliverOffstageState();
}

class _MySliverOffstageState extends State<MySliverOffstage> {
  bool _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverSafeArea(
            sliver: SliverAppBar(
              title: Text('Sliver Offstage'),
            ),
          ),
          SliverOffstage(
            offstage: _offstage,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.amber,
                    height: 100,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SwitchListTile(
                  title: const Text('Offstage'),
                  value: _offstage,
                  onChanged: (val) {
                    setState(() {
                      _offstage = val;
                    });
                  },
                ),
                Container(
                  color: Colors.amber,
                  height: 100,
                ),
                Container(
                  color: Colors.red,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
