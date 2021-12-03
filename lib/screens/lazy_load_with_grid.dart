import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/model/custom_item_model.dart';
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
  late PageState<CustomItemModel> pageState;

  @override
  void initState() {
    pageState = PageState(
      isLoading: false,
      isSuccess: true,
      hasMore: true,
      data: [],
      page: 1,
      itemPerPage: 10,
    );
    _onLoadMore();
    super.initState();
  }

  Future<void> _onLoadMore() async {
    if (pageState.isSuccess && !pageState.isLoading && pageState.hasMore) {
      setState(() {
        pageState.isLoading = true;
      });
      final result = await MockRepository.mock(pageState);
      setState(() {
        pageState = result;
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
        title: const Text('Lazy Load With Grid'),
      ),
      body: LazyLoadScrollView(
        isLoading: pageState.isLoading,
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
                      isLoading: pageState.isLoading,
                      isSuccess: pageState.isSuccess,
                      hasMore: pageState.hasMore,
                      onRefresh: _onRefresh,
                    ),
                  ],
                ),
              )
            : CustomEmptyPage(
                isLoading: pageState.isLoading,
                isSuccess: pageState.isSuccess,
                onRefresh: _onRefresh,
              ),
      ),
    );
  }
}
