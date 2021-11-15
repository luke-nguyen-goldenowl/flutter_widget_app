import 'dart:ui';
import 'package:flutter/material.dart';

class WrapAndChipView extends StatefulWidget {
  static const String routeName = '/wrap-and-chip-view';

  const WrapAndChipView({Key? key}) : super(key: key);

  @override
  State createState() => WrapAndChipViewState();
}

class WrapAndChipViewState extends State<WrapAndChipView> {
  bool _selectedSmall = false;
  bool _selectedLarge = false;
  bool _slctAndroid = false;
  bool _slctIOS = false;
  Map<String, OutlinedBorder> mapShape = {
    'Stadium': const StadiumBorder(),
    'Rectangle': const RoundedRectangleBorder()
  };
  String _myShape = 'Stadium';
  bool _showDeleteIcon = false;
  bool _showEvelation = true;
  bool _showAvatar = true;
  bool _spacing = true;
  bool _runSpacing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap And Chip View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myTitle('Chip Chip'),
            Wrap(
              spacing: _spacing ? 30 : 0,
              runSpacing: _runSpacing ? 10 : 0,
              children: [
                _myChip('Chip'),
                _myChip('ActionChip'),
                _myChip('RawChip'),
              ],
            ),
            _myTitle('Choice Chip'),
            Wrap(
              spacing: _spacing ? 20 : 0,
              runSpacing: _runSpacing ? 10 : 0,
              children: [
                _myChoiceChip('Disable', false),
                _myChoiceChip(
                  'Small',
                  _selectedSmall,
                  onSelected: (val) {
                    setState(() {
                      _selectedSmall = val;
                    });
                  },
                ),
                _myChoiceChip(
                  'Large',
                  _selectedLarge,
                  onSelected: (val) {
                    setState(() {
                      _selectedLarge = val;
                    });
                  },
                ),
              ],
            ),
            _myTitle('Input Chip'),
            Wrap(
              spacing: _spacing ? 20 : 0,
              runSpacing: _runSpacing ? 10 : 0,
              children: [
                _myInputChip('Disable', false),
                _myInputChip(
                  'IOS',
                  _slctIOS,
                  onSelected: (val) {
                    setState(() {
                      _slctIOS = val;
                    });
                  },
                ),
                _myInputChip(
                  'Android',
                  _slctAndroid,
                  onSelected: (val) {
                    setState(() {
                      _slctAndroid = val;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: const Text('elevation'),
                  value: _showEvelation,
                  onChanged: (val) {
                    setState(() {
                      _showEvelation = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: SwitchListTile(
                  title: const Text('avatar'),
                  value: _showAvatar,
                  onChanged: (val) {
                    setState(() {
                      _showAvatar = val;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: const Text('deleteIcon'),
                  value: _showDeleteIcon,
                  onChanged: (val) {
                    setState(() {
                      _showDeleteIcon = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    isExpanded: true,
                    underline: Container(
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    value: _myShape,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 100,
                    onChanged: (String? newvalue) {
                      setState(() {
                        _myShape = newvalue!;
                      });
                    },
                    items: ['Stadium', 'Rectangle'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: const Text('spacing'),
                  value: _spacing,
                  onChanged: (val) {
                    setState(() {
                      _spacing = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: SwitchListTile(
                  title: const Text('runSpacing'),
                  value: _runSpacing,
                  onChanged: (val) {
                    setState(() {
                      _runSpacing = val;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _myTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _myChip(String name) {
    return Chip(
      label: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      avatar: _showAvatar
          ? CircleAvatar(
              backgroundColor: Colors.blue[700],
              child: const Icon(Icons.person_outline),
            )
          : null,
      shape: mapShape[_myShape],
      elevation: _showEvelation ? 10 : 0,
      deleteIcon: _showDeleteIcon ? const Icon(Icons.cancel) : const Icon(null),
      onDeleted: () {},
    );
  }

  Widget _myChoiceChip(String name, bool value, {onSelected}) {
    return ChoiceChip(
      avatar: _showAvatar
          ? CircleAvatar(
              backgroundColor: Colors.blue[700],
              child: const Icon(Icons.person_outline),
            )
          : null,
      label: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      selected: value,
      onSelected: onSelected,
      shape: mapShape[_myShape],
      elevation: _showEvelation ? 10 : 0,
    );
  }

  Widget _myInputChip(String name, bool value, {onSelected}) {
    return InputChip(
      label: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      selected: value,
      onSelected: onSelected,
      shape: mapShape[_myShape],
      elevation: _showEvelation ? 10 : 0,
      deleteIcon: _showDeleteIcon ? const Icon(Icons.cancel) : const Icon(null),
      onDeleted: () {},
    );
  }
}
