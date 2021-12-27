import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/model/page_state.dart';
import 'package:flutter_widget_app/model/product.dart';
import 'package:flutter_widget_app/widgets/custom_empty_page.dart';
import 'package:flutter_widget_app/widgets/custom_load_case.dart';
import 'package:flutter_widget_app/widgets/custom_product.dart';

class LoadMoreProducts extends StatefulWidget {
  static const String routeName = '/load-more-product';

  const LoadMoreProducts({Key? key}) : super(key: key);

  @override
  _LoadMoreProductsState createState() => _LoadMoreProductsState();
}

class _LoadMoreProductsState extends State<LoadMoreProducts> {
  final ScrollController _controller = ScrollController();
  PageState<Product> pageState = PageState<Product>([]);

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

      final result = await MockRepository.loadProducts(page: pageState.page);

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
            title: const Text(
              'Load More Product',
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            pinned: true,
            centerTitle: true,
            actions: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                label: const Text('Lọc'),
              )
            ],
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
          SliverOffstage(
            offstage: pageState.data.isEmpty,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CustomProduct(itemData: pageState.data[index]);
                },
                childCount: pageState.data.length,
              ),
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
