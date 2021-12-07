class PageResponse<T> {
  bool isSuccess;
  bool hasMore;
  List<T>? data;

  PageResponse({required this.isSuccess, this.data, required this.hasMore});
}
