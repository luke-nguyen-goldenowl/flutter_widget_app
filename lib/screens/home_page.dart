import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_app/screens/bottom_app_bar_view.dart';
import 'package:flutter_widget_app/screens/container_view.dart';
import 'package:flutter_widget_app/screens/form_view.dart';
import 'package:flutter_widget_app/screens/list_title.dart';
import 'package:flutter_widget_app/screens/other_view.dart';
import 'package:flutter_widget_app/screens/row_and_column.dart';
import 'package:flutter_widget_app/screens/stack_and_align.dart';
import 'package:flutter_widget_app/screens/wrap_and_chip_view.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Flutter Widget App'),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
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
            ],
          ),
        ],
      ),
    );
  }
}
