import 'package:flutter/material.dart';
import 'package:flutter_widget_app/widgets/custom_layout.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class CustomLazyLoadScrollView extends StatelessWidget {
  //static const String routeName = '/custom-lazy-load-scroll-view';

  const CustomLazyLoadScrollView({
    Key? key,
    required this.isLoading,
    required this.isSuccess,
    required this.hasMore,
    required this.data,
    required this.onLoadMore,
    required this.onRefresh,
    required this.customLayout,
  }) : super(key: key);

  final bool isLoading;
  final bool isSuccess;
  final bool hasMore;
  final List<int> data;
  final void Function() onLoadMore;
  final void Function() onRefresh;
  final CustomRender customLayout;

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      isLoading: isLoading,
      onEndOfPage: onLoadMore,
      child: data.isNotEmpty
          ? CustomLayout(
              customLayout: customLayout,
              isLoading: isLoading,
              isSuccess: isSuccess,
              hasMore: hasMore,
              onRefresh: onRefresh,
              data: data,
            )
          : Center(
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
            ),
    );
  }
}
