import 'package:flutter/material.dart';

class MySliverList extends StatefulWidget {
  static const String routeName = '/sliver list';

  const MySliverList({Key? key}) : super(key: key);

  @override
  _MySliverListState createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  final List<int> _list = [0, 1, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver List'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Item ' + _list[index].toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                );
              },
              childCount: _list.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.blueAccent,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _list.add(_list.length);
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.blueAccent,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _list.removeLast();
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
              ),
            ], addRepaintBoundaries: false),
          ),
        ],
      ),
    );
  }
}
