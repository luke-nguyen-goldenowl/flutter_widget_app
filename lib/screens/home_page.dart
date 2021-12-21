import 'package:flutter/material.dart';
import 'package:flutter_widget_app/screens/buton_view.dart';
import 'package:flutter_widget_app/screens/bottom_app_bar_view.dart';
import 'package:flutter_widget_app/screens/container_view.dart';
import 'package:flutter_widget_app/screens/cupertino_tab.dart';
import 'package:flutter_widget_app/screens/cupertino_widgets.dart';
import 'package:flutter_widget_app/screens/cupertino_widgets_cont.dart';
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
import 'package:flutter_widget_app/screens/typography.dart';
import 'package:flutter_widget_app/screens/wrap_and_chip_view.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> _names = {
      'Bottom App Bar View': BottomAppBarView.routeName,
      'Form View': FormView.routeName,
      'List Title': ListTitleView.routeName,
      'Wrap And Chip View': WrapAndChipView.routeName,
      'Row & Column': RowAndColumn.routeName,
      'Container View': ContainerView.routeName,
      'Stack & Align': StackAndAlign.routeName,
      'Other View': OtherView.routeName,
      'Button View': ButtonView.routeName,
      'Typography': TypographyScreen.routeName,
      'Custom Scroll View': MyCustomScrollView.routeName,
      'Load More Category': LoadMoreCategory.routeName,
      'Load More Products': LoadMoreProducts.routeName,
      'Coupons': Coupons.routeName,
      'OTP Count Down': MyOTPCountDown.routeName,
      'Cupertino Widgets 1': CupetinoWidgets.routeName,
      'Cupertino Widgets 2': CupertinoWidgetCont.routeName,
      'Cupertino Tab': CupertinoTabScreen.routeName,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget App'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            for (int i = 0; i < _names.length; i++)
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, _names.values.toList()[i]);
                },
                child: Text(
                  _names.keys.toList()[i],
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                color: Colors.purple[300],
                shape: const CircleBorder(),
              ),
          ],
        ),
      ),
    );
  }
}
