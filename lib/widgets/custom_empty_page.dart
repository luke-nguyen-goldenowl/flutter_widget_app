import 'package:flutter/material.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage({
    Key? key,
    required this.isLoading,
    required this.isSuccess,
    required this.onRefresh,
  }) : super(key: key);

  final bool isLoading;
  final bool isSuccess;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'This List Is Empty',
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
          if (!isSuccess)
            TextButton(
              onPressed: onRefresh,
              child: const Text(
                'Error, Tap To Reload',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            )
          else if (isLoading)
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
