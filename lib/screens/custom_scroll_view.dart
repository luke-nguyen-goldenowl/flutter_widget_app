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
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          for (int i = 0; i < _names.length; i++)
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  Navigator.pushNamed(context, _names.values.toList()[i]);
                },
                child: Text(
                  _names.keys.toList()[i],
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                color: Colors.red[((i % 3) + 1) * 100],
              ),
            ),
        ],
      ),
    );
  }
}
