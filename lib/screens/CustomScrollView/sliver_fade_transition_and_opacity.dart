import 'package:flutter/material.dart';

class MySliverFadeTransitionAndOpacity extends StatefulWidget {
  static const String routeName = '/sliver-fade-transition-and-opacity';

  const MySliverFadeTransitionAndOpacity({Key? key}) : super(key: key);

  @override
  _MySliverFadeTransitionAndOpacityState createState() =>
      _MySliverFadeTransitionAndOpacityState();
}

class _MySliverFadeTransitionAndOpacityState
    extends State<MySliverFadeTransitionAndOpacity>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Fade Transition And Opacity'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFadeTransition(
            opacity: animation,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 100,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          SliverOpacity(
            opacity: _visible ? 1.0 : 0.0,
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
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: const Text('Opacity'),
              value: _visible,
              onChanged: (val) {
                setState(() {
                  _visible = val;
                });
              },
            ),
          ),
          SliverAnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
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
        ],
      ),
    );
  }
}
