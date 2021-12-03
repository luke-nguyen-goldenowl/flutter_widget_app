import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/widgets/custom_empty_page.dart';
import 'package:flutter_widget_app/widgets/custom_item.dart';
import 'package:flutter_widget_app/widgets/custom_load_case.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LazyLoadWithGrid extends StatefulWidget {
  static const String routeName = '/lazy-load-with-grid';

  const LazyLoadWithGrid({Key? key}) : super(key: key);

  @override
  _LazyLoadWithGridState createState() => _LazyLoadWithGridState();
}

class _LazyLoadWithGridState extends State<LazyLoadWithGrid> {
  late PageState pageState;
  bool isLoading = false;

  @override
  void initState() {
    pageState = PageState(
        isSuccess: true, data: [], hasMore: true, itemPerPage: 10, page: 1);
    _onLoadMore();
    super.initState();
  }

  Future<void> _onLoadMore() async {
    if (pageState.hasMore && !isLoading && pageState.isSuccess) {
      setState(() {
        isLoading = true;
      });

      final result =
          await MockRepository.mock(pageState.page, pageState.itemPerPage);

      setState(() {
        pageState.data.addAll(result.data);
        print(pageState.data.toString());
        pageState.isSuccess = result.isSuccess;
        pageState.hasMore = result.hasMore;
        pageState.page = result.page;
        isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    if (mounted) {
      setState(() {
        pageState.hasMore = true;
        pageState.isSuccess = true;
      });
      _onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Load Scroll View'),
      ),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: _onLoadMore,
        child: pageState.data.isNotEmpty
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: pageState.data.length,
                      itemBuilder: (context, index) {
                        return CustomGridTile(itemData: pageState.data[index]);
                      },
                    ),
                    CustomLoadCase(
                      isLoading: isLoading,
                      isSuccess: pageState.isSuccess,
                      hasMore: pageState.hasMore,
                      onRefresh: _onRefresh,
                    ),
                  ],
                ),
              )
            : CustomEmptyPage(
                isLoading: isLoading,
                isSuccess: pageState.isSuccess,
                onRefresh: _onRefresh,
              ),
      ),
    );
  }
}