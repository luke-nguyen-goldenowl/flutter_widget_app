import 'dart:math';

import 'package:flutter_widget_app/model/custom_item_model.dart';

class MockRepository {
  static Future<PageResponse> mock(PageState<CustomItemModel> pageState) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    Random r = Random();
    pageState.isSuccess = r.nextDouble() <= 0.5;

    if (pageState.isSuccess) {
      pageState.data.addAll(List.generate(
        pageState.itemPerPage,
        (index) => CustomItemModel(
            name: ((pageState.page - 1) * pageState.itemPerPage + index)
                .toDouble()
                .toString(),
            id: (pageState.page - 1) * pageState.itemPerPage + index),
      ));
    }

    pageState.hasMore = pageState.page < 5 ? true : false;

    if (pageState.hasMore && pageState.isSuccess) pageState.page++;

    pageState.isLoading = false;

    PageResponse result = PageResponse(
      isSuccess: pageState.isSuccess,
      hasMore: pageState.hasMore,
      data: pageState.data,
    );

    return result;
  }
}

class PageResponse<T> {
  bool isSuccess;
  bool hasMore;
  List<T> data;

  PageResponse(
      {required this.isSuccess, required this.data, required this.hasMore});
}

class PageState<T> {
  bool isLoading;
  bool isSuccess;
  bool hasMore;
  List<T> data;
  int page;
  int itemPerPage;
  PageState({
    required this.isLoading,
    required this.isSuccess,
    required this.hasMore,
    required this.data,
    required this.page,
    required this.itemPerPage,
  });
}
