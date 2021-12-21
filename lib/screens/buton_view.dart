import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/screens/home_page.dart';
import 'package:flutter_widget_app/widgets/custom_coupons.dart';

class ButtonView extends StatefulWidget {
  static const String routeName = '/button-view';
  const ButtonView({Key? key}) : super(key: key);

  @override
  _ButtonViewState createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  final List<int> _listValue = [1, 2, 3];
  int? _value;
  int _popupValue = 1;
  String _elevatedButton = 'Elevated Button';
  final List<bool> _isSelected = [true, false, false];

  Widget _space() {
    return const SizedBox(
      height: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button View'),
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.cyanAccent,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          },
        ),
        actions: [
          CloseButton(
            color: Colors.redAccent[700],
            onPressed: () {},
          ),
          PopupMenuButton(
            tooltip: _popupValue.toString(),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("First"),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text("Second"),
                value: 2,
              ),
            ],
            onSelected: (int val) {
              setState(() {
                _popupValue = val;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          DropdownButton(
            value: _value,
            hint: const Text('Dropdown'),
            iconSize: 40,
            items: _listValue.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text('Dropdowm ' + value.toString()),
              );
            }).toList(),
            onChanged: (int? newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
          DropdownButtonFormField(
            value: _value,
            hint: const Text('Dropdown Form Field'),
            iconSize: 40,
            items: _listValue.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text('Dropdowm Form Field ' + value.toString()),
              );
            }).toList(),
            onChanged: (int? newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box),
            splashRadius: 20,
            iconSize: 40,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _elevatedButton = 'Pressed';
              });
            },
            onLongPress: () {
              setState(() {
                _elevatedButton = 'LongPressed';
              });
            },
            child: Text(
              _elevatedButton,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            label: const Text('Elevated Button Icon'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Text Button'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            label: const Text('Text Button Icon'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined Button'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            label: const Text('Outlined Button Icon'),
          ),
          _space(),
          CupertinoButton(
            child: const Text('Cupertino Button'),
            onPressed: () {},
            color: Colors.grey,
          ),
          _space(),
          MaterialButton(
            onPressed: () {},
            child: const Text('Material Button'),
            color: Colors.grey,
            shape: CouponShapeBorder(),
          ),
          RawMaterialButton(
            onPressed: () {},
            child: const Text('Raw Material Button'),
            shape: CouponShapeBorder(),
            fillColor: Colors.grey,
          ),
          _space(),
          ToggleButtons(
            borderWidth: 3,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == index;
                }
              });
            },
            isSelected: _isSelected,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Option 1',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Option 2',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Option 3',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
