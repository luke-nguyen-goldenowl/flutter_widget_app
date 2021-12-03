import 'dart:math';

import 'package:flutter_widget_app/model/custom_item_model.dart';

class MockRepository {
  static Future<PageState<CustomItemModel>> mock(
      PageState<CustomItemModel> pageState) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    List<CustomItemModel> data = pageState.data;
    int page = pageState.page;
    int itemPerPage = pageState.itemPerPage;
    Random r = Random();

    bool isSuccess = r.nextDouble() <= 0.5;

    if (isSuccess) {
      data.addAll(List.generate(
        itemPerPage,
        (index) => CustomItemModel(
            name: ((page - 1) * itemPerPage + index).toDouble().toString(),
            id: (page - 1) * itemPerPage + index),
      ));
    }

    bool hasMore = page < 5 ? true : false;

    if (hasMore && isSuccess) page++;

    bool isLoading = false;

    PageState<CustomItemModel> result = PageState(
        isLoading: isLoading,
        isSuccess: isSuccess,
        hasMore: hasMore,
        data: data,
        page: page,
        itemPerPage: itemPerPage);
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
