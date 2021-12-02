import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  final int position;

  const CustomListTitle(
    this.position, {
    Key? key,
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
        title: Text('Item $position'),
        subtitle: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text('This is the item in list demo LazyLoadScrollView'),
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
  final int position;

  const CustomGridTile(
    this.position, {
    Key? key,
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
            'Item $position',
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
