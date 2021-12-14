import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF07AA7C),
              Color(0xFF1EB268),
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
