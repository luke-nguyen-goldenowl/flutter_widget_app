import 'dart:math';

import 'package:flutter/material.dart';

class MySliverGrid extends StatefulWidget {
  static const String routeName = '/sliver grid';

  const MySliverGrid({Key? key}) : super(key: key);

  @override
  _MySliverGridState createState() => _MySliverGridState();
}

class _MySliverGridState extends State<MySliverGrid> {
  double _crossAxisCount = 2;
  double _childAspectRatio = 2;
  double _crossAxisSpacing = 10;
  double _mainAxisSpacing = 10;
  double _mainAxisExtent = 2;
  bool _axisExtent = false;
  double _maxCrossAxisExtent = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Grid'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 40.0,
              maxHeight: 60.0,
              child: Container(
                color: Colors.grey,
                child: const Text(
                  'Sliver List Slider',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  'Max Cross Axis Extent',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Slider(
                  min: 1,
                  max: 400,
                  value: _maxCrossAxisExtent,
                  onChanged: (val) {
                    setState(() {
                      _maxCrossAxisExtent = val;
                    });
                  },
                ),
                const Text(
                  'Child Aspect Ratio',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Slider(
                  min: 0.5,
                  max: 5,
                  value: _childAspectRatio,
                  onChanged: (val) {
                    setState(() {
                      _childAspectRatio = val;
                    });
                  },
                ),
                const Text(
                  'Main Axis Spacing',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Slider(
                  min: 0,
                  max: 30,
                  value: _mainAxisSpacing,
                  onChanged: (val) {
                    setState(() {
                      _mainAxisSpacing = val;
                    });
                  },
                ),
                const Text(
                  'Cross Axis Spacing',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Slider(
                  min: 0,
                  max: 30,
                  value: _crossAxisSpacing,
                  onChanged: (val) {
                    setState(() {
                      _crossAxisSpacing = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text(
                    'Main Axis Extent',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  value: _axisExtent,
                  onChanged: (val) {
                    setState(() {
                      _axisExtent = val;
                    });
                  },
                ),
                Slider(
                  min: 0,
                  max: 200,
                  value: _mainAxisExtent,
                  onChanged: (val) {
                    setState(() {
                      _mainAxisExtent = val;
                    });
                  },
                ),
                const Text(
                  'Cross Axis Count',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Slider(
                  min: 1,
                  max: 4,
                  divisions: 3,
                  value: _crossAxisCount,
                  onChanged: (val) {
                    setState(() {
                      _crossAxisCount = val;
                    });
                  },
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 40.0,
              maxHeight: 60.0,
              child: Container(
                color: Colors.blue,
                child: const Text(
                  'Sliver Grid Delegate With Max Cross Axis Extent',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                margin: const EdgeInsets.all(5.0),
                color: Colors.yellow,
              ),
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: _maxCrossAxisExtent,
              mainAxisSpacing: _mainAxisSpacing,
              crossAxisSpacing: _crossAxisSpacing,
              childAspectRatio: _childAspectRatio,
              mainAxisExtent: _axisExtent ? _mainAxisExtent : null,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 40.0,
              maxHeight: 60.0,
              child: Container(
                color: Colors.grey,
                child: const Text(
                  'Sliver Grid Delegate With Fixed CrossAxisCount',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount.toInt(),
              childAspectRatio:
                  _childAspectRatio, // = (width / height) when [mainAxisExtent] = null
              mainAxisSpacing: _mainAxisSpacing,
              crossAxisSpacing: _crossAxisSpacing,
              mainAxisExtent: _axisExtent ? _mainAxisExtent : null,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                margin: const EdgeInsets.all(5.0),
                color: Colors.red,
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
