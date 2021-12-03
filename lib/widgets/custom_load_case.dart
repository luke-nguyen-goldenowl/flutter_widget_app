import 'package:flutter/material.dart';

class CustomLoadCase extends StatelessWidget {
  final bool isLoading;
  final bool isSuccess;
  final bool hasMore;
  final void Function() onRefresh;

  const CustomLoadCase({
    Key? key,
    required this.isLoading,
    required this.isSuccess,
    required this.hasMore,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isSuccess) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          onPressed: onRefresh,
          child: const Text(
            'Error, Tap To Reload',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
    } else if (isLoading) {
      return const Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: CircularProgressIndicator(),
      ));
    } else if (!hasMore) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'No More Item',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
