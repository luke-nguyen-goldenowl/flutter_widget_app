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
import 'package:flutter_widget_app/screens/rich_text_view.dart';
import 'package:flutter_widget_app/screens/row_and_column.dart';
import 'package:flutter_widget_app/screens/stack_and_align.dart';
import 'package:flutter_widget_app/screens/typography.dart';
import 'package:flutter_widget_app/screens/wrap_and_chip_view.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ScreenData> _screenData = [
      ScreenData('Bottom App Bar View', BottomAppBarView.routeName,
          'Bottom application bar', Icons.menu),
      ScreenData('Form View', FormView.routeName,
          'TextField with decoration view', Icons.border_color),
      ScreenData(
          'List Title',
          ListTitleView.routeName,
          'Custom ListTile view with Icon and Text ([title], [subtile], [leading], [trailing],...)',
          Icons.format_list_bulleted),
      ScreenData('Wrap And Chip View', WrapAndChipView.routeName,
          'Custom Chip, ChoiceChip, InputChip in Wrap', Icons.view_agenda),
      ScreenData('Row & Column', RowAndColumn.routeName,
          'Show how to use param of Row&Column', Icons.view_quilt),
      ScreenData(
          'Container View',
          ContainerView.routeName,
          'Decorate Container with [color], [border], [borderRadius], [boxShadow], [gradient], [backgroundBlendMode]',
          Icons.font_download),
      ScreenData('Stack & Align', StackAndAlign.routeName,
          'Position with [clipBehavior]', Icons.filter),
      ScreenData(
          'Other View',
          OtherView.routeName,
          'Indicator, Radio, CheckBox, Switch, Slider, Tooltip',
          Icons.view_carousel),
      ScreenData(
          'Button View',
          ButtonView.routeName,
          'DropdownButton, BackButton, CloseButton, PopupMenuButton, FloatingActionButton, IconButton, ElevatedButton, TextButton, OutlineButton, CupertinoButton, MaterialButton, RawMaterialButton, ToggleButton',
          Icons.center_focus_strong),
      ScreenData('Rich Text', RichTextView.routeName,
          'Text, RichText, TextSpan, WidgetSpan', Icons.text_format),
      ScreenData('Typography', TypographyScreen.routeName,
          'All of the predefined text styles', Icons.text_fields),
      ScreenData('Custom Scroll View', MyCustomScrollView.routeName,
          'All of slivers in CustomScrollView', Icons.swap_vert),
      ScreenData(
          'Load More Category',
          LoadMoreCategory.routeName,
          'Lazy load data of Categories with Load_Case, show with List',
          Icons.loop),
      ScreenData(
          'Load More Products',
          LoadMoreProducts.routeName,
          'Lazy load data of Products with Load_Case, show with Grid',
          Icons.loop),
      ScreenData(
          'Coupons',
          Coupons.routeName,
          'Use CustomPaint and ShapeBorder to Custom a CouponShapeBorder with DashLine',
          Icons.confirmation_number),
      ScreenData(
          'OTP Count Down',
          MyOTPCountDown.routeName,
          'Use Timer to count down the second of DateTime, support for OTP (APIs or CustomTextField)',
          Icons.trending_down),
      ScreenData(
          'Cupertino Widgets 1',
          CupetinoWidgets.routeName,
          'Cupertino Widgets UI with show Dialog, Popup, ContextMenu,...',
          Icons.widgets),
      ScreenData(
          'Cupertino Widgets 2',
          CupertinoWidgetCont.routeName,
          'Continues of Cupertino Widgets UI with Picker, CupertinoSegmentedControl with Sliding,CupertinoPageTransition,...',
          Icons.widgets),
      ScreenData('Cupertino Tab', CupertinoTabScreen.routeName,
          'CupertinoTabScaffold, CupertinoTabBar, CupertinoTabView', Icons.tab),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget App'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (int i = 0; i < _screenData.length; i++)
            Column(
              children: [
                ListTile(
                  leading: Icon(_screenData[i].icon),
                  onTap: () {
                    Navigator.pushNamed(context, _screenData[i].route);
                  },
                  title: Text(
                    _screenData[i].title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(_screenData[i].description),
                ),
                const Divider(
                  indent: 65,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class ScreenData {
  final String title;
  final String route;
  final String description;
  final IconData icon;

  ScreenData(this.title, this.route, this.description, this.icon);
}
