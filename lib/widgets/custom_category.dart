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
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.grey[300],
      shadowColor: Colors.deepPurple,
      elevation: 5,
      child: ListTile(
        leading: Image.network(
          itemData.image,
          fit: BoxFit.fill,
          width: 100,
        ),
        title: Text(itemData.name),
        contentPadding: const EdgeInsets.all(5),
      ),
    );
  }
}
