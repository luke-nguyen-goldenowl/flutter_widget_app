import 'package:flutter_widget_app/model/page_response.dart';

class PageState<T> {
  bool isLoading;
  bool isSuccess;
  bool hasMore;
  List<T> data;
  int page;

  PageState(
    this.data, {
    this.isLoading = false,
    this.isSuccess = true,
    this.hasMore = true,
    this.page = 1,
  });

  void addData(PageResponse<T> pageResponse) {
    isLoading = false;
    isSuccess = pageResponse.isSuccess;

    if (isSuccess) {
      hasMore = pageResponse.hasMore;
      data.addAll(pageResponse.data ?? []);
      page++;
    }
  }

  bool canLoad() {
    return isLoading == false && hasMore == true;
  }

  void setLoading() {
    isLoading = true;
  }

  void setRefresh() {
    hasMore = true;
    isSuccess = true;
  }
}
