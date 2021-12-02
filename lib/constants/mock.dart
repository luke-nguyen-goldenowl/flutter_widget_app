import 'dart:math';

class MockRepository {
  static Future<PageResponse> mock(int page, int itemPerPage) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    List<int> list = [];
    Random r = Random();
    bool isSuccess = r.nextDouble() <= 0.5;
    bool hasMore = page < 5 ? true : false;
    if (isSuccess) {
      list.addAll(List.generate(
          itemPerPage, (index) => (page - 1) * itemPerPage + index));
    }
    PageResponse newPage =
        PageResponse(isSuccess: isSuccess, hasMore: hasMore, data: list);
    return newPage;
  }
}

class PageResponse {
  bool isSuccess;
  bool hasMore;
  List<int> data;

  PageResponse(
      {required this.isSuccess, required this.data, required this.hasMore});
}
