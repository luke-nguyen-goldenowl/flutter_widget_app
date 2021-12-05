import 'package:flutter/material.dart';
import 'package:flutter_widget_app/model/product.dart';

class CustomProduct extends StatelessWidget {
  final Product itemData;

  const CustomProduct({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            itemData.image,
            height: 180,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                itemData.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              itemData.price.toString() + ' VNĐ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              itemData.supplier,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
