import 'package:flutter/material.dart';

class TypographyScreen extends StatefulWidget {
  static const String routeName = '/typography';

  const TypographyScreen({Key? key}) : super(key: key);

  @override
  _TypographyScreenState createState() => _TypographyScreenState();
}

class _TypographyScreenState extends State<TypographyScreen> {
  Widget _line() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15, top: 5),
      child: Divider(
        height: 1,
      ),
    );
  }

  Widget _buildText(ItemData? itemData) {
    return Column(
      children: [
        ListTile(
          title: Text(
            itemData!.title,
            style: itemData.style,
          ),
          subtitle: Text(itemData.description),
          trailing: Text(
            itemData.getFontWeight() + ' ' + itemData.getFontSize(),
          ),
        ),
        _line(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var _textTheme = Theme.of(context).textTheme;
    List<ItemData> itemData = [
      ItemData('H1', '', _textTheme.headline1),
      ItemData(
          'H2',
          'Used for the date in the dialog shown by [showDatePicker].',
          _textTheme.headline2),
      ItemData('H3', '', _textTheme.headline3),
      ItemData('H4', '', _textTheme.headline4),
      ItemData(
          'H5',
          'Used for large text in dialogs (e.g., the month and year in the dialog shown by [showDatePicker]).',
          _textTheme.headline5),
      ItemData(
          'H6',
          'Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title]).',
          _textTheme.headline6),
      ItemData(
          'Subtitle1',
          'Used for the primary text in lists (e.g., [ListTile.title]).',
          _textTheme.subtitle1),
      ItemData(
          'Subtitle2',
          'For medium emphasis text thatư\'s a little smaller than [subtitle1].',
          _textTheme.subtitle2),
      ItemData(
          'BodyText1',
          'Used for emphasizing text that would otherwise be [bodyText2].',
          _textTheme.bodyText1),
      ItemData('BodyText2', 'The default text style for [Material].',
          _textTheme.bodyText2),
      ItemData('Caption', 'Used for auxiliary text associated with images',
          _textTheme.caption),
      ItemData(
          'Button',
          'Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].',
          _textTheme.button),
      ItemData(
          'Overline',
          'The smallest style. Typically used for captions or to introduce a (larger) headline.',
          _textTheme.overline),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography'),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < itemData.length; i++)
            if (itemData[i].style != null) _buildText(itemData[i]),
        ],
      ),
    );
  }
}

class ItemData {
  final String title;
  final String description;
  final TextStyle? style;
  //final, const, var ìn flutter

  ItemData(this.title, this.description, this.style);

  String getFontSize() {
    return style?.fontSize?.floor().toString() ?? '';
  }

  String getFontWeight() {
    return style?.fontWeight.toString().split('.').last ?? '';
  }
}
