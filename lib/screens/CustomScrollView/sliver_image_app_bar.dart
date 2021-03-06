import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/images.dart';

class SliverImageAppBar extends StatefulWidget {
  static const String routeName = '/sliver-image-app-bar';

  const SliverImageAppBar({Key? key}) : super(key: key);

  @override
  _SliverImageAppBarState createState() => _SliverImageAppBarState();
}

class _SliverImageAppBarState extends State<SliverImageAppBar> {
  late ScrollController _controller;
  bool silverCollapsed = false;
  bool _padding = true;
  Widget mytitle = const Opacity(
    opacity: 1,
    child: Text(
      'Sliver App Bar',
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 100 && !_controller.position.outOfRange) {
        if (!silverCollapsed) {
          // do what ever you want when silver is collapsing !
          setState(() {
            mytitle = const AnimatedOpacity(
              opacity: 0,
              duration: Duration(milliseconds: 200),
              child: Text(
                'Sliver App Bar',
              ),
            );
            _padding = false;
            silverCollapsed = true;
          });
        }
      }
      if (_controller.offset < 100 && !_controller.position.outOfRange) {
        if (silverCollapsed) {
          // do what ever you want when silver is expanding !
          setState(() {
            mytitle = const AnimatedOpacity(
              opacity: 1,
              duration: Duration(milliseconds: 200),
              child: Text(
                'Sliver App Bar',
              ),
            );
            _padding = true;
            silverCollapsed = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            title: mytitle,
            stretch: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBarSettings(
              currentExtent: 0,
              maxExtent: 0,
              minExtent: 0,
              toolbarOpacity: 1,
              child: FlexibleSpaceBar(
                titlePadding: _padding
                    ? const EdgeInsets.only(bottom: 15, left: 10)
                    : null,
                title: const Text(
                  'Flex App Bar',
                ),
                background: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    MyImages.appBarImage,
                  ),
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
              ),
            ),
            pinned: true,
            elevation: 30,
            // bottom: AppBar(
            //   title: const Text('Bottom'),
            //   automaticallyImplyLeading: false,
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            // ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.grey,
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
    );
  }
}
