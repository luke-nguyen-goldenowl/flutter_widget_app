import 'package:flutter/material.dart';
import 'package:flutter_widget_app/model/my_category.dart';

class CustomCategory extends StatelessWidget {
  final MyCategory itemData;

  const CustomCategory({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.transparent,
            leading: Image.network(
              itemData.image,
              fit: BoxFit.fill,
              width: 100,
            ),
            title: Text(itemData.name),
            contentPadding: const EdgeInsets.all(5),
          ),
          const Divider()
        ],
      ),
    );
  }
}
