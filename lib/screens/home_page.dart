import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_app/screens/bottom_app_bar_view.dart';
import 'package:flutter_widget_app/screens/container_view.dart';
import 'package:flutter_widget_app/screens/my_count_down.dart';
import 'package:flutter_widget_app/screens/coupons.dart';
import 'package:flutter_widget_app/screens/custom_scroll_view.dart';
import 'package:flutter_widget_app/screens/form_view.dart';
import 'package:flutter_widget_app/screens/load_more_categories.dart';
import 'package:flutter_widget_app/screens/load_more_products.dart';
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
                Navigator.pushNamed(context, MyCustomScrollView.routeName);
              },
              child: const Text(
                'Custom Scroll View',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LoadMoreCategory.routeName);
              },
              child: const Text(
                'Lazy More Category',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LoadMoreProducts.routeName);
              },
              child: const Text(
                'Lazy More Products',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Coupons.routeName);
              },
              child: const Text(
                'Coupons',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MyOTPCountDown.routeName);
              },
              child: const Text(
                'OTP Count Down',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
