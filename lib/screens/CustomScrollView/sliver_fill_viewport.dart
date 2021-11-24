import 'package:flutter/material.dart';

class MySliverFillViewport extends StatefulWidget {
  static const String routeName = '/sliver fill viewport';

  const MySliverFillViewport({Key? key}) : super(key: key);

  @override
  _MySliverFillViewportState createState() => _MySliverFillViewportState();
}

class _MySliverFillViewportState extends State<MySliverFillViewport> {
  double _fraction = 0.5;
  bool _padEnds = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Fill Viewport'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillViewport(
            viewportFraction: _fraction,
            padEnds: _padEnds,
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Slider(
                        min: 0.1,
                        max: 1.5,
                        value: _fraction,
                        onChanged: (val) {
                          setState(() {
                            _fraction = val;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text(
                          'Pad Ends',
                          style: TextStyle(fontSize: 17),
                        ),
                        value: _padEnds,
                        onChanged: (val) {
                          setState(() {
                            _padEnds = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: const Text(
                    'Item 1',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: const Text(
                    'Item 2',
                    style: TextStyle(
                      fontSize: 30,
                    ),
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
