import 'package:flutter/material.dart';

class BottomAppBarView extends StatefulWidget {
  static const String routeName = '/bottom_app_bar';

  const BottomAppBarView({Key? key}) : super(key: key);

  @override
  State createState() => BottomAppBarViewState();
}

class BottomAppBarViewState extends State<BottomAppBarView> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar View'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: <Widget>[
          // SwitchListTile(
          //   title: const Text(
          //     'Floating Action Button',
          //   ),
          //   value: _showFab,
          //   onChanged: _onShowFabChanged,
          // ),
          _mySwitchLT('Floating Action Button', _showFab, _onShowFabChanged),
          SwitchListTile(
            title: const Text('Notch'),
            value: _showNotch,
            onChanged: _onShowNotchChanged,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Floating action button position'),
          ),
          _myRadioLT('Docked - End', FloatingActionButtonLocation.endDocked),
          _myRadioLT(
              'Docked - Center', FloatingActionButtonLocation.centerDocked),
          _myRadioLT('Floating - End', FloatingActionButtonLocation.endFloat),
          _myRadioLT(
              'Floating - Center', FloatingActionButtonLocation.centerFloat),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
              tooltip: 'Create',
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _BottomAppBarBuild(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
    );
  }

  Widget _myRadioLT(String text, FloatingActionButtonLocation fabL) {
    return RadioListTile<FloatingActionButtonLocation>(
      title: Text(text),
      value: fabL,
      groupValue: _fabLocation,
      onChanged: _onFabLocationChanged,
    );
  }

  Widget _mySwitchLT(String text, bool value, Function(bool) onchangeValue) {
    return SwitchListTile(
      title: const Text(
        'Floating Action Button',
      ),
      value: value,
      onChanged: (bool newValue) => onchangeValue,
    );
  }
}

class _BottomAppBarBuild extends StatelessWidget {
  const _BottomAppBarBuild({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.white,
      child: IconTheme(
        data: const IconThemeData(color: Colors.black),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
