import 'package:flutter/material.dart';

class ListTitleView extends StatefulWidget {
  static const String routeName = '/list-title';

  const ListTitleView({Key? key}) : super(key: key);

  @override
  _ListTitleViewState createState() => _ListTitleViewState();
}

class _ListTitleViewState extends State<ListTitleView> {
  bool _selected = false;
  bool _leading = true;
  bool _trailing = true;
  bool _isThreeLine = false;
  bool _dense = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Title'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Selected'),
            value: _selected,
            onChanged: (val) {
              setState(() {
                _selected = val;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Leading'),
            value: _leading,
            onChanged: (val) {
              setState(() {
                _leading = val;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Trailing'),
            value: _trailing,
            onChanged: (val) {
              setState(() {
                _trailing = val;
              });
            },
          ),
          SwitchListTile(
            title: const Text('IsThreeLine'),
            value: _isThreeLine,
            onChanged: (val) {
              setState(() {
                _isThreeLine = val;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Dense'),
            value: _dense,
            onChanged: (val) {
              setState(() {
                _dense = val;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: const Text('Message Preview'),
          subtitle: const Text(
            'Hello World! Hello World! Hello World! Hello World! Hello World!',
          ),
          selected: _selected,
          leading: _leading
              ? CircleAvatar(
                  backgroundColor: Colors.blue[700],
                  child: const Icon(
                    Icons.messenger,
                    color: Colors.white,
                  ),
                )
              : null,
          trailing: _trailing
              ? const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              : null,
          isThreeLine: _isThreeLine,
          dense: _dense,
        ),
      ),
    );
  }
}
