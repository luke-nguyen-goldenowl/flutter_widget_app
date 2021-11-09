import 'package:flutter/material.dart';

enum ShowListType { column, row }
//enum MainAxisAlignment {start, end, center, spaceAround, spaceBetween, spaceEvenly}

class RowAndColumn extends StatefulWidget {
  static const String routeName = '/row-&-column';

  const RowAndColumn({Key? key}) : super(key: key);

  @override
  State<RowAndColumn> createState() => RowAndColumnState();
}

class RowAndColumnState extends State<RowAndColumn> {
  ShowListType? _type = ShowListType.row;
  MainAxisSize mySize = MainAxisSize.max;
  MainAxisAlignment myMainAlign = MainAxisAlignment.start;
  CrossAxisAlignment myCrossAlign = CrossAxisAlignment.start;
  VerticalDirection verticalDir = VerticalDirection.down;
  TextDirection textDir = TextDirection.ltr;
  TextBaseline textBLine = TextBaseline.alphabetic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row & Column'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _type == ShowListType.column
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.amber,
                        child: Column(
                          mainAxisSize: mySize,
                          mainAxisAlignment: myMainAlign,
                          crossAxisAlignment: myCrossAlign,
                          verticalDirection: verticalDir,
                          textDirection: textDir,
                          textBaseline: textBLine,
                          children: [
                            _myIcon(40, Icons.brightness_auto),
                            _myIcon(70, Icons.audiotrack),
                            _myIcon(40, Icons.auto_awesome),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.amber,
                        child: Row(
                          mainAxisSize: mySize,
                          mainAxisAlignment: myMainAlign,
                          crossAxisAlignment: myCrossAlign,
                          verticalDirection: verticalDir,
                          textDirection: textDir,
                          textBaseline: textBLine,
                          children: [
                            _myIcon(40, Icons.brightness_auto),
                            _myIcon(70, Icons.audiotrack),
                            _myIcon(40, Icons.auto_awesome),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Row(
            children: [
              _myRadioLT('Row', ShowListType.row),
              _myRadioLT('Column', ShowListType.column),
            ],
          ),
          _myDrop<MainAxisSize>(
            'mainAxisSize',
            mySize,
            MainAxisSize.values,
            onchangeValue: (val) {
              setState(() {
                mySize = val;
              });
            },
          ),
          // _myDrop<MainAxisAlignment>(
          //     'mainAxisAlignment', myMainAlign, MainAxisAlignment.values),
          // _myDrop<CrossAxisAlignment>(
          //     'crossAxisAlignment', myCrossAlign, CrossAxisAlignment.values),
          // _myDrop<VerticalDirection>(
          //     'verticalDirection', verticalDir, VerticalDirection.values),
          // _myDrop<TextDirection>(
          //     'textDirection', textDir, TextDirection.values),
          // _myDrop<TextBaseline>('textBaseline', textBLine, TextBaseline.values),
        ],
      ),
    );
  }

  Widget _myDrop<T>(String text, T myValue, List<T> myList,
      {required void onchangeValue}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          DropdownButton<T>(
            borderRadius: BorderRadius.circular(10),
            value: myValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            // selectedItemBuilder: (BuildContext context) {
            //   return myList.map<Widget>((T value) {
            //     return Text(value.toString().split('.').last);
            //   }).toList();
            // },
            onChanged: onchangeValue<T>,
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

  Widget _myRadioLT(String text, ShowListType showType) {
    return Expanded(
      child: RadioListTile<ShowListType>(
        title: Text(text),
        value: showType,
        groupValue: _type,
        onChanged: (ShowListType? value) {
          setState(() {
            _type = value;
          });
        },
      ),
    );
  }

  Widget _myIcon(double size, IconData myIcon) {
    return SizedBox(
      height: size,
      width: size,
      child: Icon(
        myIcon,
        size: size,
      ),
    );
  }
}
