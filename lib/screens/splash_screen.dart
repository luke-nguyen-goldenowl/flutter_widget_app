import 'package:flutter/material.dart';
import 'package:flutter_widget_app/screens/home_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchSomething(context);
  }

  void fetchSomething(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.9],
          colors: [
            Color(0xFFFC5C7D),
            Color(0xFF6A82FB),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 90.0),
      child: Hero(
        tag: 'dash',
        child: Image.asset(
          'assets/images/flutter_logo.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
