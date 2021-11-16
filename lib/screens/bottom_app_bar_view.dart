import 'package:flutter/material.dart';
import 'package:flutter_widget_app/widgets/form_radio_list_title.dart';

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
      _fabLocation = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Bottom App Bar View'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SwitchListTile(
                  title: const Text(
                    'Floating Action Button',
                  ),
                  value: _showFab,
                  onChanged: _onShowFabChanged,
                ),
                SwitchListTile(
                  title: const Text('Notch'),
                  value: _showNotch,
                  onChanged: _onShowNotchChanged,
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Floating action button position'),
                ),
                FormRadioListTitle(
                  'Docked - End',
                  FloatingActionButtonLocation.endDocked,
                  _fabLocation,
                  onChanged: _onFabLocationChanged,
                ),
                FormRadioListTitle(
                  'Docked - Center',
                  FloatingActionButtonLocation.centerDocked,
                  _fabLocation,
                  onChanged: _onFabLocationChanged,
                ),
                FormRadioListTitle(
                  'Floating - End',
                  FloatingActionButtonLocation.endFloat,
                  _fabLocation,
                  onChanged: _onFabLocationChanged,
                ),
                FormRadioListTitle(
                  'Floating - Center',
                  FloatingActionButtonLocation.centerFloat,
                  _fabLocation,
                  onChanged: _onFabLocationChanged,
                ),
              ],
            ),
          ),
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
