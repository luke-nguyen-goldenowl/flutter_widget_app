import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/model/my_category.dart';
import 'package:flutter_widget_app/model/page_state.dart';
import 'package:flutter_widget_app/widgets/custom_category.dart';
import 'package:flutter_widget_app/widgets/custom_empty_page.dart';
import 'package:flutter_widget_app/widgets/custom_load_case.dart';

class LoadMoreCategory extends StatefulWidget {
  static const String routeName = '/load-more-category';

  const LoadMoreCategory({Key? key}) : super(key: key);

  @override
  _LoadMoreCategoryState createState() => _LoadMoreCategoryState();
}

class _LoadMoreCategoryState extends State<LoadMoreCategory> {
  final ScrollController _controller = ScrollController();
  PageState<MyCategory> pageState = PageState<MyCategory>([]);

  @override
  void initState() {
    _controller.addListener(() {
      final bool isThresholdReached = _controller.position.extentAfter == 0;
      if (isThresholdReached && pageState.isSuccess) {
        _onLoadMore();
      }
    });
    _onLoadMore();
    super.initState();
  }

  void _onLoadMore() async {
    if (pageState.canLoad()) {
      if (mounted) {
        setState(() {
          pageState.setLoading();
        });
      }

      final result = await MockRepository.loadCategory(page: pageState.page);

      if (mounted) {
        setState(() {
          pageState.addData(result);
        });
      }
    }
  }

  void _onRefresh() {
    if (mounted) {
      setState(() {
        pageState.setRefresh();
      });
      _onLoadMore();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        controller: _controller,
        slivers: [
          SliverAppBar(
            title: const Text('Load More Category'),
            backgroundColor: Colors.grey[300],
            foregroundColor: Colors.black,
            pinned: true,
          ),
          SliverOffstage(
            offstage: pageState.data.isNotEmpty,
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: CustomEmptyPage(
                isLoading: pageState.isLoading,
                isSuccess: pageState.isSuccess,
                onRefresh: _onRefresh,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CustomCategory(itemData: pageState.data[index]);
              },
              childCount: pageState.data.length,
            ),
          ),
          SliverOffstage(
            offstage: pageState.data.isEmpty,
            sliver: SliverToBoxAdapter(
              child: CustomLoadCase(
                isLoading: pageState.isLoading,
                isSuccess: pageState.isSuccess,
                hasMore: pageState.hasMore,
                onRefresh: _onRefresh,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
