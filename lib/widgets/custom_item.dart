import 'package:flutter/material.dart';
import 'package:flutter_widget_app/model/custom_item_model.dart';

class CustomListTitle extends StatelessWidget {
  final CustomItemModel itemData;

  const CustomListTitle({
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
        leading: const CircleAvatar(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        title: Text('Item ' + itemData.id.toString()),
        subtitle: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text('This is the item ' +
              itemData.name +
              ' in list demo LazyLoadScrollView'),
        ),
        trailing: const Icon(
          Icons.mail,
          color: Colors.purpleAccent,
        ),
        contentPadding: const EdgeInsets.all(5),
      ),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  final CustomItemModel itemData;

  const CustomGridTile({
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
      child: GridTile(
        header: const CircleAvatar(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        child: Center(
          child: Text(
            'Item ' + itemData.name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        footer: const Icon(
          Icons.mail,
          color: Colors.purpleAccent,
        ),
      ),
    );
  }
}
