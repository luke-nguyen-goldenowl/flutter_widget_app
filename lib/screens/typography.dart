import 'package:flutter/material.dart';

class TypographyScreen extends StatefulWidget {
  static const String routeName = '/typography';

  const TypographyScreen({Key? key}) : super(key: key);

  @override
  _TypographyScreenState createState() => _TypographyScreenState();
}

class _TypographyScreenState extends State<TypographyScreen> {
  final Map<String, String> _fontWeightType = {
    'w100': 'Light',
    'w300': 'Light',
    'w400': 'Regular',
    'w500': 'Medium',
  };

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
            (_getFontWeightType(itemData.style) ?? '') +
                ' ' +
                itemData.style!.fontSize!.floor().toString(),
          ),
        ),
        _line(),
      ],
    );
  }

  String? _getFontWeightType(TextStyle? style) {
    String _fonWeight = style!.fontWeight.toString().split('.').last;
    return _fontWeightType[_fonWeight];
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
    print(_textTheme.headline1!.fontWeight.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography'),
      ),
      body: ListView(
        //padding: const EdgeInsets.all(10),
        children: [
          for (var i = 0; i < itemData.length; i++) _buildText(itemData[i]),
        ],
      ),
    );
  }
}

class ItemData {
  String title;
  String description;
  TextStyle? style;
  //final, const, var ìn flutter

  ItemData(this.title, this.description, this.style);
}
