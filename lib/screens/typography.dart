import 'package:flutter/material.dart';

class TypographyScreen extends StatefulWidget {
  static const String routeName = '/typography';

  const TypographyScreen({Key? key}) : super(key: key);

  @override
  _TypographyScreenState createState() => _TypographyScreenState();
}

class _TypographyScreenState extends State<TypographyScreen> {
  final double _lineSpace = 15;

  Widget _line() {
    return Padding(
      padding: EdgeInsets.only(top: _lineSpace, bottom: _lineSpace),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'H1',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'Light ' +
                    Theme.of(context)
                        .textTheme
                        .headline1!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'H2',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                'Light ' +
                    Theme.of(context)
                        .textTheme
                        .headline2!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for the date in the dialog shown by [shownDatePicker].',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'H3',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .headline3!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'H4',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .headline4!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'H5',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .headline5!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for large text in the dialogs (e.g., the month and year in the the dialog shown by [shownDatePicker]).',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'H6',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                'Medium ' +
                    Theme.of(context)
                        .textTheme
                        .headline6!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title]).',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Subtitle1',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for the primary text in lists (e.g., [ListTile.title]).',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Subtitle2',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Text(
                'Medium ' +
                    Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'For medium emphasis text that\'s a little smaller than [subtitle1].',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'BodyText1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for emphasizing text that would otherwise be [bodyText2].',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'BodyText2',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'The default text style for [Material].',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Button',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              Text(
                'Medium ' +
                    Theme.of(context)
                        .textTheme
                        .button!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Caption',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .caption!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Used for auxiliary text associated with images.',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _line(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Overline',
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
              Text(
                'Regular ' +
                    Theme.of(context)
                        .textTheme
                        .overline!
                        .fontSize!
                        .floor()
                        .toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            'Typically used for captions or to introduce a (larger) headline.',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
