import 'dart:math';

import 'package:flutter/material.dart';

class MySliverGrid extends StatefulWidget {
  static const String routeName = '/sliver grid';

  const MySliverGrid({Key? key}) : super(key: key);

  @override
  _MySliverGridState createState() => _MySliverGridState();
}

class _MySliverGridState extends State<MySliverGrid> {
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
                  'Header Text 1',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverGrid.extent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.amber,
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
                  'Header Text 2',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 40.0,
              maxHeight: 60.0,
              child: Container(
                color: Colors.grey,
                child: const Text(
                  'Header Text 3',
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
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
