import 'package:flutter/material.dart';
import 'package:flutter_widget_app/screens/bottom_app_bar_view.dart';
import 'package:flutter_widget_app/screens/container_view.dart';
import 'package:flutter_widget_app/screens/form_view.dart';
import 'package:flutter_widget_app/screens/home_page.dart';
import 'package:flutter_widget_app/screens/list_title.dart';
import 'package:flutter_widget_app/screens/other_view.dart';
import 'package:flutter_widget_app/screens/row_and_column.dart';
import 'package:flutter_widget_app/screens/stack_and_align.dart';
import 'package:flutter_widget_app/screens/wrap_and_chip_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget App',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case BottomAppBarView.routeName:
                return const BottomAppBarView();
              case ContainerView.routeName:
                return const ContainerView();
              case FormView.routeName:
                return const FormView();
              case ListTitleView.routeName:
                return const ListTitleView();
              case OtherView.routeName:
                return const OtherView();
              case RowAndColumn.routeName:
                return const RowAndColumn();
              case StackAndAlign.routeName:
                return const StackAndAlign();
              case WrapAndChipView.routeName:
                return const WrapAndChipView();

              case HomePage.routeName:

              default:
                return const HomePage();
            }
          },
        );
      },
      home: const HomePage(),
    );
  }
}
