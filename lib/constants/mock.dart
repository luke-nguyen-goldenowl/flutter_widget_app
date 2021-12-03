import 'dart:math';

import 'package:flutter_widget_app/model/custom_item_model.dart';

class MockRepository {
  static Future<PageState<CustomItemModel>> mock(
    int currentPage,
    int itemPerPage,
  ) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    List<CustomItemModel> list = [];
    Random r = Random();
    bool isSuccess = r.nextDouble() <= 0.5;
    bool hasMore = currentPage < 5 ? true : false;
    if (isSuccess) {
      list.addAll(List.generate(
        itemPerPage,
        (index) => CustomItemModel(
            name:
                ((currentPage - 1) * itemPerPage + index).toDouble().toString(),
            id: (currentPage - 1) * itemPerPage + index),
      ));
    }
    if (hasMore && isSuccess) currentPage++;
    PageState<CustomItemModel> newPage = PageState(
      isSuccess: isSuccess,
      hasMore: hasMore,
      data: list,
      itemPerPage: itemPerPage,
      page: currentPage,
    );
    return newPage;
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
  bool isSuccess;
  bool hasMore;
  List<T> data;
  int page;
  int itemPerPage;
  PageState(
      {required this.isSuccess,
      required this.data,
      required this.hasMore,
      required this.itemPerPage,
      required this.page});
}
