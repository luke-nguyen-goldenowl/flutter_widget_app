import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
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
                  background: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg',
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
      ),
    );
  }
}
