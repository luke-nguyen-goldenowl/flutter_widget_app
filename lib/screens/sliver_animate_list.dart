import 'package:flutter/material.dart';

class MySliverAnimatedList extends StatefulWidget {
  static const String routeName = '/sliver animated list';

  const MySliverAnimatedList({Key? key}) : super(key: key);

  @override
  _MySliverAnimatedListState createState() => _MySliverAnimatedListState();
}

class _MySliverAnimatedListState extends State<MySliverAnimatedList> {
  final List<int> _list = [0, 1, 2];
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Animated List'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _list.insert(_list.length, _list.length);
                _listKey.currentState!.insertItem(_list.length - 1);
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _list.removeAt(_list.length - 1);
                _listKey.currentState!.removeItem(
                  _list.length - 1,
                  (context, animation) {
                    return SizeTransition(
                      axis: Axis.vertical,
                      sizeFactor: animation,
                      child: const SizedBox(
                        height: 50,
                      ),
                    );
                  },
                );
              });
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAnimatedList(
            key: _listKey,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                axis: Axis.vertical,
                sizeFactor: animation,
                child: Card(
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      "Item " + _list[index].toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
            initialItemCount: _list.length,
          )
        ],
      ),
    );
  }
}
