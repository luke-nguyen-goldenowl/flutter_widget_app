import 'package:flutter/material.dart';

class RichTextView extends StatefulWidget {
  static const String routeName = '/rich-text-view';

  const RichTextView({Key? key}) : super(key: key);

  @override
  _RichTextViewState createState() => _RichTextViewState();
}

class _RichTextViewState extends State<RichTextView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: ' First ',
              style: Theme.of(context).textTheme.headline6,
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text: ' second ',
                  style: Theme.of(context).textTheme.headline4,
                ),
                WidgetSpan(
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  ),
                ),
                TextSpan(
                  text: ' third',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'One ',
              style: Theme.of(context).textTheme.headline6,
              children: [
                const TextSpan(
                  text: 'Two ',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      fontSize: 25),
                ),
                TextSpan(
                  text: 'Three ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextSpan(
                  text: 'Four ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const TextSpan(
                  text: 'Five ',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "BakbakOne",
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'G',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
                backgroundColor: Colors.pink[100],
              ),
              children: [
                TextSpan(
                  text: 'o',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontFamily: "BakbakOne",
                    backgroundColor: Colors.pink[50],
                  ),
                ),
                TextSpan(
                  text: 'o',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 40,
                    fontFamily: "BakbakOne",
                    backgroundColor: Colors.pink[200],
                  ),
                ),
                TextSpan(
                  text: 'g',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    backgroundColor: Colors.pink[100],
                  ),
                ),
                TextSpan(
                  text: 'l',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontFamily: "BakbakOne",
                    backgroundColor: Colors.pink[50],
                  ),
                ),
                TextSpan(
                  text: 'e',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    backgroundColor: Colors.pink[100],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
