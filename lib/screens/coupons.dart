import 'package:flutter/material.dart';
import 'package:flutter_widget_app/widgets/custom_coupons.dart';

class Coupons extends StatefulWidget {
  static const String routeName = '/coupons';
  const Coupons({Key? key}) : super(key: key);

  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  final int _coupon1 = 12;
  final int _coupon2 = 20;
  final int _coupon3 = 15;
  int _groupCoupon = 12;

  void _onChangedCoupon(int? coupon) {
    setState(() {
      _groupCoupon = coupon!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Coupons'),
      ),
      body: ListView(
        children: [
          CustomCoupons(
            value: _coupon1,
            groupValue: _groupCoupon,
            onChangeValue: _onChangedCoupon,
            exp: DateTime(2021, 12, 31),
            codeVoucher: 'GIOITHIEU',
          ),
          CustomCoupons(
            value: _coupon2,
            groupValue: _groupCoupon,
            onChangeValue: _onChangedCoupon,
            exp: DateTime(2021, 12, 31),
            codeVoucher: 'LANDAU',
          ),
          CustomCoupons(
            value: _coupon3,
            groupValue: _groupCoupon,
            onChangeValue: _onChangedCoupon,
            exp: DateTime(2021, 12, 31),
            codeVoucher: 'GIANGSINH',
          ),
        ],
      ),
    );
  }
}
