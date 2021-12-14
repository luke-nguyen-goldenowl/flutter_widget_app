import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/model/otp_state.dart';
import 'package:flutter_widget_app/widgets/gradient_app_bar.dart';
import 'package:flutter_widget_app/widgets/otp_confirm_case.dart';
import 'package:flutter_widget_app/widgets/otp_digit_text_field.dart';
import 'package:flutter_widget_app/widgets/otp_loading_case.dart';

class MyOTPCountDown extends StatefulWidget {
  static const String routeName = '/otp-count-down';
  const MyOTPCountDown({Key? key}) : super(key: key);

  @override
  _MyOTPCountDownState createState() => _MyOTPCountDownState();
}

class _MyOTPCountDownState extends State<MyOTPCountDown> {
  late Timer _timer;
  final List<TextEditingController> _listCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  String value = '';

  final OTPState _otpState = OTPState(DateTime.now());

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() async {
    final result = await MockRepository.getOTPResponse();
    value = result.toString();
    DateTime end = DateTime.now().add(const Duration(seconds: 10));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) async {
        setState(() {
          _otpState.checkEndOfValue(end.second);
        });
        if (_otpState.isEnd ||
            (!_otpState.error && _listCtrl[5].text.isNotEmpty)) {
          timer.cancel();
        } else {
          if (mounted) {
            setState(() {
              _otpState.setConntDown();
            });
          }
        }
        if (_listCtrl[5].text.isNotEmpty) {
          if (mounted) {
            setState(() {
              _otpState.setLoading();
            });
          }
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            setState(() {
              _otpState.setError(result, _listCtrl);
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
        title: 'Đăng ký tài khoản',
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 20,
              left: 70,
              right: 70,
            ),
            child: Text(
              'Nhập mã OTP được gửi đến điện thoại qua tin nhắn',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          OTPTextField(
            value: value,
            onChanged: (val) {
              setState(() {
                value = val;
              });
              print(value);
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     OTPDigitTextField(first: true, controller: _listCtrl[0]),
          //     OTPDigitTextField(controller: _listCtrl[1]),
          //     OTPDigitTextField(controller: _listCtrl[2]),
          //     OTPDigitTextField(controller: _listCtrl[3]),
          //     OTPDigitTextField(controller: _listCtrl[4]),
          //     OTPDigitTextField(last: true, controller: _listCtrl[5]),
          //   ],
          // ),
          OTPLoadingCase(
            endOfValue: _listCtrl[5].text.isNotEmpty,
            isError: _otpState.error,
            isLoading: _otpState.isLoading,
          ),
          Container(
            margin: const EdgeInsets.all(30),
            child: OTPConfirmCase(
              start: _otpState.start.second,
              isEnd: _otpState.isEnd,
              onTap: () {
                _startTimer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
