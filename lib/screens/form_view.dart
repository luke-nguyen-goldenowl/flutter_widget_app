import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  static const String routeName = '/form-view';

  const FormView({Key? key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  bool _hintText = true;
  bool _labelText = true;
  bool _helpText = true;
  bool _errorText = false;
  bool _counterText = true;
  bool _prefix = true;
  bool _suffix = true;
  bool _prefixIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form View'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SwitchListTile(
                  title: const Text('Hint Text'),
                  value: _hintText,
                  onChanged: (val) {
                    setState(() {
                      _hintText = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Label Text'),
                  value: _labelText,
                  onChanged: (val) {
                    setState(() {
                      _labelText = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Help Text'),
                  value: _helpText,
                  onChanged: (val) {
                    setState(() {
                      _helpText = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Error Text'),
                  value: _errorText,
                  onChanged: (val) {
                    setState(() {
                      _errorText = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Counter Text'),
                  value: _counterText,
                  onChanged: (val) {
                    setState(() {
                      _counterText = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Prefix'),
                  value: _prefix,
                  onChanged: (val) {
                    setState(() {
                      _prefix = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Suffix'),
                  value: _suffix,
                  onChanged: (val) {
                    setState(() {
                      _suffix = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Prefix Icon'),
                  value: _prefixIcon,
                  onChanged: (val) {
                    setState(() {
                      _prefixIcon = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        children: [
          _myTextField(),
          _myTextField(),
        ],
      ),
    );
  }

  _myTextField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.blue,
            ),
          ),
          hintText: _hintText ? "Hint Text" : null,
          labelText: _labelText ? "Label Text" : null,
          helperText: _helpText ? "Help Text" : null,
          errorText: _errorText ? "Error Text" : null,
          counterText: _counterText ? '232' : null,
          prefix: _prefix ? const Text('Prefix') : null,
          suffix: _suffix ? const Text('Suffix') : null,
          prefixIcon: _prefixIcon ? const Icon(Icons.alarm) : null,
        ),
      ),
    );
  }
}
