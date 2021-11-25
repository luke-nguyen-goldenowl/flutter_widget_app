import 'package:flutter/material.dart';

class MySliverAppBar extends StatefulWidget {
  static const String routeName = '/sliver app bar';

  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  bool _floating = false;
  bool _pinned = false;
  bool _snap = false;
  bool _stretch = false;
  bool _bottom = false;
  bool _forceElevation = false;
  bool _collapsedHeight = false;
  bool _padding = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(_padding ? 10 : 0),
              sliver: SliverAppBar(
                title: const Text('Sliver App Bar'),
                expandedHeight: 200,
                collapsedHeight: _collapsedHeight ? 100 : null,
                stretch: _stretch,
                flexibleSpace: const FlexibleSpaceBarSettings(
                  isScrolledUnder: false,
                  toolbarOpacity: 1,
                  currentExtent: 200,
                  maxExtent: 200,
                  minExtent: 200,
                  child: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(20),
                    title: Text(
                      'Flex App Bar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    background: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://kenh14cdn.com/2020/9/25/hinh-nen-iphone-11-1600990116056809485952.jpg',
                      ),
                    ),
                    stretchModes: [
                      StretchMode.zoomBackground,
                    ],
                  ),
                ),
                stretchTriggerOffset: 1000,
                pinned: _pinned,
                floating: _floating,
                snap: _floating ? _snap : false,
                elevation: 30,
                forceElevated: _forceElevation,
                bottom: _bottom
                    ? AppBar(
                        title: const Text('Bottom'),
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      )
                    : null,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SwitchListTile(
                    title: const Text(
                      'Floating',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _floating,
                    onChanged: (val) {
                      setState(() {
                        _floating = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Pinned',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _pinned,
                    onChanged: (val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Snap',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _snap,
                    onChanged: (val) {
                      setState(() {
                        _snap = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Stretch',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _stretch,
                    onChanged: (val) {
                      setState(() {
                        _stretch = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Bottom',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _bottom,
                    onChanged: (val) {
                      setState(() {
                        _bottom = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'ForceElevation',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _forceElevation,
                    onChanged: (val) {
                      setState(() {
                        _forceElevation = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'CollapsedHeight',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _collapsedHeight,
                    onChanged: (val) {
                      setState(() {
                        _collapsedHeight = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Padding',
                      style: TextStyle(fontSize: 17),
                    ),
                    value: _padding,
                    onChanged: (val) {
                      setState(() {
                        _padding = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Item ' + index.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
