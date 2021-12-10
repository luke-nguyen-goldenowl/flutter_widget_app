import 'dart:math';
import 'package:flutter_widget_app/constants/constants.dart';
import 'package:flutter_widget_app/constants/images.dart';
import 'package:flutter_widget_app/model/my_category.dart';
import 'package:flutter_widget_app/model/page_response.dart';
import 'package:flutter_widget_app/model/product.dart';

class MockRepository {
  //input: page, itemperpage
  //output: pageResponse
  static Future<PageResponse<Product>> loadProducts(
      {int page = 1, int itemPerPage = 10}) async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );

    Random r = Random();
    bool isSuccess = r.nextDouble() <= 0.5;
    List<Product> data = [];
    bool hasMore = page < 5 ? true : false;
    if (isSuccess) {
      data.addAll(List.generate(
        itemPerPage,
        (index) => Product(
          name: Constants.productNames[index],
          price: index * 11000 + 10000,
          image: MyImages.productImages[index],
          supplier: Constants.supplierNames[index],
        ),
      ));
    }

    PageResponse<Product> pageResponse = PageResponse(
      isSuccess: isSuccess,
      hasMore: hasMore,
      data: data,
    );

    return pageResponse;
  }

  static Future<PageResponse<MyCategory>> loadCategory(
      {int page = 1, int itemPerPage = 10}) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    Random r = Random();
    bool isSuccess = r.nextDouble() <= 0.5;

    bool hasMore = page < 5 ? true : false;

    List<MyCategory> data = [];
    if (isSuccess) {
      data.addAll(List.generate(
        itemPerPage,
        (index) => MyCategory(
          name: Constants.categoryNames[index],
          image: MyImages.categoryImages[index],
        ),
      ));
    }

    PageResponse<MyCategory> pageResponse = PageResponse(
      isSuccess: isSuccess,
      hasMore: hasMore,
      data: data,
    );

    return pageResponse;
  }

  static Future<int> getOTP() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    String otp = Random().nextInt(9).toString() +
        Random().nextInt(9).toString() +
        Random().nextInt(9).toString() +
        Random().nextInt(9).toString() +
        Random().nextInt(9).toString() +
        Random().nextInt(9).toString();
    print(otp);
    return int.parse(otp);
  }
}
