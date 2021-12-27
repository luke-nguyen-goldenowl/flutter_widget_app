import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/screens/home_page.dart';

class CupetinoWidgets extends StatefulWidget {
  static const String routeName = '/cupertino-widgets';

  const CupetinoWidgets({Key? key}) : super(key: key);

  @override
  _CupetinoWidgetsState createState() => _CupetinoWidgetsState();
}

class _CupetinoWidgetsState extends State<CupetinoWidgets>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String _value = '';
  String _value1 = '';
  bool _isLoading = false;
  double _slideVal = 1;
  bool _light = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    super.initState();
  }

  Future<void> _showDialog() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    await Future.delayed(const Duration(seconds: 1));
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Alert Dialog?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Yes'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showDialogTransition() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: _animationController,
            secondaryRouteAnimation: _animationController,
            linearTransition: false,
            child: Center(
              child: Container(
                color: Colors.blueGrey,
                width: 400,
                height: 400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CupertinoButton(
                onPressed: () => _animationController.forward(),
                child: const Text('Forward'),
              ),
              CupertinoButton(
                onPressed: () => _animationController.reverse(),
                child: const Text('Reverse'),
              ),
              CupertinoButton(
                onPressed: () => _animationController.repeat(),
                child: const Text('Repeat'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showActionSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Action One'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Action Two'),
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            isDestructiveAction: true,
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _showPopupSurface() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CupertinoPopupSurface(
        child: Center(
          child: Container(
            height: 80,
            width: 80,
            color: Colors.orange,
            child: const Center(
              child: Text(
                "hello",
              ),
            ),
          ),
        ),
        isSurfacePainted: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          },
        ),
        middle: const Text('Cupertino Widgets 1'),
      ),
      child: CupertinoScrollbar(
        thickness: 6.0,
        thicknessWhileDragging: 10.0,
        radius: const Radius.circular(34.0),
        radiusWhileDragging: Radius.zero,
        isAlwaysShown: true,
        child: ListView(
          children: [
            if (_isLoading)
              const CupertinoActivityIndicator()
            else
              CupertinoButton(
                onPressed: _showDialog,
                child: const Text('Show Cupertino Alert Dialog'),
              ),
            CupertinoButton(
              onPressed: _showActionSheet,
              child: const Text('Show Cupertino Action Sheet'),
            ),
            CupertinoButton(
              onPressed: _showDialogTransition,
              child: const Text('Show Full Screen Cupertino Dialog Transition'),
            ),
            CupertinoButton(
              onPressed: _showPopupSurface,
              child: const Text('Show Cupertino Popup Surface'),
            ),
            CupertinoSearchTextField(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.cancel_sharp),
              onChanged: (String val) {
                setState(() {
                  _value = val;
                });
              },
              onSubmitted: (String val) {
                setState(() {
                  _value1 = val;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Value when text changed: ' + _value,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Value when submitted: ' + _value1,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            CupertinoSlider(
              value: _slideVal,
              onChanged: (val) {
                setState(() {
                  _slideVal = val;
                });
              },
              divisions: 10,
              min: 0.0,
              max: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CupertinoSwitch(
                value: _light,
                onChanged: (bool value) {
                  setState(() {
                    _light = value;
                  });
                },
              ),
            ),
            CupertinoTextField(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.blue,
                    Colors.red,
                  ],
                  tileMode: TileMode.repeated,
                ),
              ),
              prefix: const Icon(Icons.person),
              suffix: const Icon(Icons.check_circle),
              textInputAction: TextInputAction.search,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100,
                height: 300,
                child: CupertinoContextMenu(
                  actions: <Widget>[
                    CupertinoContextMenuAction(
                      child: const Text('Action one'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: const Text('Action two'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
