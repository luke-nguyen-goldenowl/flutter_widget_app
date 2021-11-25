import 'package:flutter/material.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_animate_list.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_app_bar.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_fade_transition_and_opacity.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_fill_remaining.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_fill_viewport.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_grid.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_image_app_bar.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_list.dart';
import 'package:flutter_widget_app/screens/CustomScrollView/sliver_offstage.dart';

class MyCustomScrollView extends StatelessWidget {
  static const String routeName = '/custom-scroll-view';

  const MyCustomScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Scroll View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverList.routeName);
              },
              child: const Text(
                'Sliver List',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverAnimatedList.routeName);
              },
              child: const Text(
                'Sliver Animated List',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverAppBar.routeName);
              },
              child: const Text(
                'Sliver App Bar',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverGrid.routeName);
              },
              child: const Text(
                'Sliver Grid',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverFillRemaining.routeName);
              },
              child: const Text(
                'Sliver Fill Remaining',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverFillViewport.routeName);
              },
              child: const Text(
                'Sliver Fill Viewport',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MySliverFadeTransitionAndOpacity.routeName);
              },
              child: const Text(
                'Sliver Fade Transition And Opacity',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MySliverOffstage.routeName);
              },
              child: const Text(
                'Sliver Offstage',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SliverImageAppBar.routeName);
              },
              child: const Text(
                'Sliver Image App Bar',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
