import 'dart:math';

class MockResponsetory {
  static Future<PageResponse> mock(int page, int itemPerPage) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    List<int> list = [];
    list.addAll(List.generate(
        itemPerPage, (index) => (page - 1) * itemPerPage + index));
    bool hasMore = page < 5 ? true : false;
    Random r = Random();
    bool isSuccess = r.nextDouble() <= 0.5;
    //TODO: trượt màn hình hiện "đang tải thêm"
    //- API để load từng trang một
    //- Các trạng thái: đang load, load lỗi, load thành công.
    //- Kiểm tra User đã scroll xuống dưới cùng, chỉ gọi future 1 lần.
    //- Thêm animation theo các trường hợp:
    // + Chưa load trang đầu tiên: Rỗng, đang load, load thành công, load lỗi.
    // + Đã load được trang đầu tiên: load thành công, đang load, load lỗi.
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
