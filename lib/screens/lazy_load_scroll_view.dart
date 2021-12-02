import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/widgets/custom_lazy_load_scroll_view.dart';
import 'package:flutter_widget_app/widgets/custom_layout.dart';

class MyLazyLoadScrollView extends StatefulWidget {
  static const String routeName = '/lazy-load-scroll-view';

  const MyLazyLoadScrollView({Key? key}) : super(key: key);

  @override
  _MyLazyLoadScrollViewState createState() => _MyLazyLoadScrollViewState();
}

class _MyLazyLoadScrollViewState extends State<MyLazyLoadScrollView> {
  List<int> data = [];
  final int itemPerPage = 10;
  late int page;
  bool isLoading = false;
  bool hasMore = true;
  bool isSuccess = true;

  @override
  void initState() {
    page = 1;
    _onLoadMore();
    super.initState();
  }

  Future<void> _onLoadMore() async {
    if (hasMore && !isLoading && isSuccess) {
      setState(() {
        isLoading = true;
      });

      final result = await MockRepository.mock(page, itemPerPage);

      setState(() {
        data.addAll(result.data);
        print(data);
        isSuccess = result.isSuccess;
        hasMore = result.hasMore;
        if (isSuccess && hasMore) page++;
        isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    if (mounted) {
      setState(() {
        hasMore = true;
        isSuccess = true;
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
      body: CustomLazyLoadScrollView(
        data: data,
        isLoading: isLoading,
        isSuccess: isSuccess,
        hasMore: hasMore,
        onLoadMore: _onLoadMore,
        onRefresh: _onRefresh,
        customLayout: CustomRender.grid,
      ),
    );
  }
}
