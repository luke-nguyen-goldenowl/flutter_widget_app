import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_app/screens/bottom_app_bar_view.dart';
import 'package:flutter_widget_app/screens/container_view.dart';
import 'package:flutter_widget_app/screens/form_view.dart';
import 'package:flutter_widget_app/screens/list_title.dart';
import 'package:flutter_widget_app/screens/other_view.dart';
import 'package:flutter_widget_app/screens/row_and_column.dart';
import 'package:flutter_widget_app/screens/sliver_animate_list.dart';
import 'package:flutter_widget_app/screens/sliver_app_bar.dart';
import 'package:flutter_widget_app/screens/sliver_fade_transition_and_opacity.dart';
import 'package:flutter_widget_app/screens/sliver_grid.dart';
import 'package:flutter_widget_app/screens/sliver_list.dart';
import 'package:flutter_widget_app/screens/sliver_offstage.dart';
import 'package:flutter_widget_app/screens/stack_and_align.dart';
import 'package:flutter_widget_app/screens/wrap_and_chip_view.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget App'),
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
                Navigator.pushNamed(context, BottomAppBarView.routeName);
              },
              child: const Text(
                'Bottom App Bar View',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, FormView.routeName);
              },
              child: const Text(
                'Form View',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ListTitleView.routeName);
              },
              child: const Text(
                'List Title',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, WrapAndChipView.routeName);
              },
              child: const Text(
                'Wrap And Chip View',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RowAndColumn.routeName);
              },
              child: const Text(
                'Row & Column',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ContainerView.routeName);
              },
              child: const Text(
                'Container View',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, StackAndAlign.routeName);
              },
              child: const Text(
                'Stack & Align',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, OtherView.routeName);
              },
              child: const Text(
                'Other View',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
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
                'Sliver grid',
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
          ],
        ),
      ),
    );
  }
}
