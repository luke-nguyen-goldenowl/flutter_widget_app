import 'package:flutter/material.dart';
import 'package:flutter_widget_app/widgets/custom_item.dart';

enum CustomRender { list, grid }

class CustomLayout extends StatelessWidget {
  const CustomLayout({
    Key? key,
    required this.customLayout,
    required this.isLoading,
    required this.isSuccess,
    required this.hasMore,
    required this.onRefresh,
    required this.data,
  }) : super(key: key);

  final CustomRender customLayout;
  final bool isLoading;
  final bool isSuccess;
  final bool hasMore;
  final void Function() onRefresh;
  final List<int> data;

  @override
  Widget build(BuildContext context) {
    if (customLayout == CustomRender.list) {
      return ListView.builder(
        itemCount: data.length + 1,
        itemBuilder: (context, position) {
          if (position == data.length) {
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
          } else {
            return CustomListTitle(position);
          }
        },
      );
    } else {
      return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: data.length + 1,
        itemBuilder: (context, position) {
          if (position == data.length) {
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
          } else {
            return CustomGridTile(position);
          }
        },
      );
    }
  }
}
