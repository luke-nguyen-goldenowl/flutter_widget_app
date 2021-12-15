import 'package:flutter/material.dart';
import 'package:flutter_widget_app/widgets/form_radio_list_title.dart';

enum ShowListType { column, row }

class RowAndColumn extends StatefulWidget {
  static const String routeName = '/row-&-column';

  const RowAndColumn({Key? key}) : super(key: key);

  @override
  State<RowAndColumn> createState() => RowAndColumnState();
}

class RowAndColumnState extends State<RowAndColumn> {
  ShowListType _type = ShowListType.row;
  MainAxisSize mySize = MainAxisSize.max;
  MainAxisAlignment myMainAlign = MainAxisAlignment.start;
  CrossAxisAlignment myCrossAlign = CrossAxisAlignment.start;
  VerticalDirection verticalDir = VerticalDirection.down;
  TextDirection textDir = TextDirection.ltr;
  TextBaseline textBLine = TextBaseline.alphabetic;

  void _onChangedShowListType(ShowListType? value) {
    setState(() {
      _type = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row & Column'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              color: Colors.amber,
              child: _type == ShowListType.column
                  ? Column(
                      mainAxisSize: mySize,
                      mainAxisAlignment: myMainAlign,
                      crossAxisAlignment: myCrossAlign,
                      verticalDirection: verticalDir,
                      textDirection: textDir,
                      textBaseline: textBLine,
                      children: const [
                        Icon(
                          Icons.brightness_auto,
                          size: 40,
                        ),
                        Icon(
                          Icons.audiotrack,
                          size: 70,
                        ),
                        Icon(
                          Icons.auto_awesome,
                          size: 40,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: mySize,
                      mainAxisAlignment: myMainAlign,
                      crossAxisAlignment: myCrossAlign,
                      verticalDirection: verticalDir,
                      textDirection: textDir,
                      textBaseline: textBLine,
                      children: const [
                        Icon(
                          Icons.brightness_auto,
                          size: 40,
                        ),
                        Icon(
                          Icons.audiotrack,
                          size: 70,
                        ),
                        Icon(
                          Icons.auto_awesome,
                          size: 40,
                        ),
                      ],
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: FormRadioListTitle(
                    'Row',
                    ShowListType.row,
                    _type,
                    onChanged: _onChangedShowListType,
                  ),
                ),
                Expanded(
                  child: FormRadioListTitle(
                    'Column',
                    ShowListType.column,
                    _type,
                    onChanged: _onChangedShowListType,
                  ),
                ),
              ],
            ),
            _myDrop<MainAxisSize>(
              mySize,
              MainAxisSize.values,
              onchangeValue: (val) {
                setState(() {
                  mySize = val;
                });
              },
            ),
            _myDrop<MainAxisAlignment>(
              myMainAlign,
              MainAxisAlignment.values,
              onchangeValue: (val) {
                setState(() {
                  myMainAlign = val;
                });
              },
            ),
            _myDrop<CrossAxisAlignment>(
              myCrossAlign,
              CrossAxisAlignment.values,
              onchangeValue: (val) {
                setState(() {
                  myCrossAlign = val;
                });
              },
            ),
            _myDrop<VerticalDirection>(
              verticalDir,
              VerticalDirection.values,
              onchangeValue: (val) {
                setState(() {
                  verticalDir = val;
                });
              },
            ),
            _myDrop<TextDirection>(
              textDir,
              TextDirection.values,
              onchangeValue: (val) {
                setState(() {
                  textDir = val;
                });
              },
            ),
            _myDrop<TextBaseline>(
              textBLine,
              TextBaseline.values,
              onchangeValue: (val) {
                setState(() {
                  textBLine = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _myDrop<T>(T myValue, List<T> myList, {required onchangeValue}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              myValue.runtimeType.toString(),
              style: const TextStyle(fontSize: 17),
            ),
          ),
          DropdownButton<T>(
            borderRadius: BorderRadius.circular(10),
            value: myValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            onChanged: onchangeValue,
            items: myList.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString().split('.').last),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
