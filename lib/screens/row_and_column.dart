import 'package:flutter/material.dart';

enum ShowListType { column, row }

class RowAndColumn extends StatefulWidget {
  static const String routeName = '/row-&-column';

  const RowAndColumn({Key? key}) : super(key: key);

  @override
  State<RowAndColumn> createState() => RowAndColumnState();
}

class RowAndColumnState extends State<RowAndColumn> {
  ShowListType? _type = ShowListType.row;
  String? _mySize = 'max';
  String? _myMainAlign = 'start';
  String? _myCrossAlign = 'start';
  String? _verticalDir = 'down';
  String? _textDir = 'ltr';
  String? _textBLine = 'alphabetic';

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
                          mainAxisSize: _onChangeSize(),
                          mainAxisAlignment: _onChangeMainAlign(),
                          crossAxisAlignment: _onChangeCrossAlign(),
                          verticalDirection: _onChangeVertical(),
                          textDirection: _onChangeTextDir(),
                          textBaseline: _onChangeTextBL(),
                          children: const [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.brightness_auto,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: Icon(
                                Icons.audiotrack,
                                size: 70,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.auto_awesome,
                                size: 40,
                              ),
                            ),
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
                          mainAxisSize: _onChangeSize(),
                          mainAxisAlignment: _onChangeMainAlign(),
                          crossAxisAlignment: _onChangeCrossAlign(),
                          verticalDirection: _onChangeVertical(),
                          textDirection: _onChangeTextDir(),
                          textBaseline: _onChangeTextBL(),
                          children: const [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.brightness_auto,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: Icon(
                                Icons.audiotrack,
                                size: 70,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.auto_awesome,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<ShowListType>(
                  title: const Text('Row'),
                  value: ShowListType.row,
                  groupValue: _type,
                  onChanged: (ShowListType? value) {
                    setState(() {
                      _type = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<ShowListType>(
                  title: const Text(
                    'Column',
                  ),
                  value: ShowListType.column,
                  groupValue: _type,
                  onChanged: (ShowListType? value) {
                    setState(() {
                      _type = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'mainAxisSize',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: _mySize,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _mySize = newValue!;
                    });
                  },
                  items: <String>[
                    'max',
                    'min',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'mainAxisAlignment',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: _myMainAlign,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _myMainAlign = newValue!;
                    });
                  },
                  items: <String>[
                    'start',
                    'end',
                    'center',
                    'spaceAround',
                    'spaceBetween',
                    'spaceEvenly',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'crossAxisAlignment',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: _myCrossAlign,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _myCrossAlign = newValue!;
                    });
                  },
                  items: <String>[
                    'start',
                    'end',
                    'center',
                    'baseline',
                    'stretch',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'verticalDirection',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: _verticalDir,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _verticalDir = newValue!;
                    });
                  },
                  items: <String>[
                    'up',
                    'down',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'textDirection',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: _textDir,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _textDir = newValue!;
                    });
                  },
                  items: <String>[
                    'ltr',
                    'rtl',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'textBaseLine',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: _textBLine,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _textBLine = newValue!;
                    });
                  },
                  items: <String>[
                    'alphabetic',
                    'ideographic',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MainAxisSize _onChangeSize() {
    if (_mySize == 'max') {
      return MainAxisSize.max;
    } else {
      return MainAxisSize.min;
    }
  }

  MainAxisAlignment _onChangeMainAlign() {
    if (_myMainAlign == 'start') {
      return MainAxisAlignment.start;
    } else if (_myMainAlign == 'end') {
      return MainAxisAlignment.end;
    } else if (_myMainAlign == 'center') {
      return MainAxisAlignment.center;
    } else if (_myMainAlign == 'spaceAround') {
      return MainAxisAlignment.spaceAround;
    } else if (_myMainAlign == 'spaceBetween') {
      return MainAxisAlignment.spaceBetween;
    } else {
      return MainAxisAlignment.spaceEvenly;
    }
  }

  CrossAxisAlignment _onChangeCrossAlign() {
    if (_myCrossAlign == 'start') {
      return CrossAxisAlignment.start;
    } else if (_myCrossAlign == 'end') {
      return CrossAxisAlignment.end;
    } else if (_myCrossAlign == 'center') {
      return CrossAxisAlignment.center;
    } else if (_myCrossAlign == 'stretch') {
      return CrossAxisAlignment.stretch;
    } else {
      return CrossAxisAlignment.baseline;
    }
  }

  VerticalDirection _onChangeVertical() {
    if (_verticalDir == 'down') {
      return VerticalDirection.down;
    } else {
      return VerticalDirection.up;
    }
  }

  TextDirection _onChangeTextDir() {
    if (_textDir == 'ltr') {
      return TextDirection.ltr;
    } else {
      return TextDirection.rtl;
    }
  }

  TextBaseline _onChangeTextBL() {
    if (_textBLine == 'alphabetic') {
      return TextBaseline.alphabetic;
    } else {
      return TextBaseline.ideographic;
    }
  }
}

// class StarClipper extends CustomClipper<Path> {
//   /// The number of points of the star
//   final int points;
//   StarClipper(this.points);

//   // Degrees to radians conversion
//   double _degreeToRadian(double deg) => deg * (pi / 180.0);

//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double max = 2 * pi;

//     double width = size.width;
//     double halfWidth = width / 2;

//     double wingRadius = halfWidth;
//     double radius = halfWidth / 2;

//     double degreesPerStep = _degreeToRadian(360 / points);
//     double halfDegreesPerStep = degreesPerStep / 2;

//     path.moveTo(width, halfWidth);

//     for (double step = 0; step < max; step += degreesPerStep) {
//       path.lineTo(halfWidth + wingRadius * cos(step),
//           halfWidth + wingRadius * sin(step));
//       path.lineTo(halfWidth + radius * cos(step + halfDegreesPerStep),
//           halfWidth + radius * sin(step + halfDegreesPerStep));
//     }

//     path.close();
//     return path;
//   }

//   // If the new instance represents different information than the old instance, this method will return true, otherwise it should return false.
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     StarClipper starClipper = oldClipper as StarClipper;
//     return points != starClipper.points;
//   }
// }
