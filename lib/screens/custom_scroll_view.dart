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
    Map<String, String> _names = {
      'Sliver List': MySliverList.routeName,
      'Sliver Animated List': MySliverAnimatedList.routeName,
      'Sliver App Bar': MySliverAppBar.routeName,
      'Sliver Grid': MySliverGrid.routeName,
      'Sliver Fill Remaining': MySliverFillRemaining.routeName,
      'Sliver Fill Viewport': MySliverFillViewport.routeName,
      'Sliver Fade Transition And Opacity':
          MySliverFadeTransitionAndOpacity.routeName,
      'Sliver Offstage': MySliverOffstage.routeName,
      'Sliver Image App Bar': SliverImageAppBar.routeName,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Scroll View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < _names.length; i++)
            Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.grey[300],
              elevation: 10,
              child: TextButton(
                child: Text(
                  _names.keys.toList()[i],
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, _names.values.toList()[i]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
