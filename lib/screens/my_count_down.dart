import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/model/otp_state.dart';
import 'package:flutter_widget_app/widgets/otp_confirm_case.dart';
import 'package:flutter_widget_app/widgets/otp_digit_text_field.dart';

class MyOTPCountDown extends StatefulWidget {
  static const String routeName = '/otp-count-down';
  const MyOTPCountDown({Key? key}) : super(key: key);

  @override
  _MyOTPCountDownState createState() => _MyOTPCountDownState();
}

class _MyOTPCountDownState extends State<MyOTPCountDown> {
  late Timer _timer;
  final _ctrlr1 = TextEditingController();
  final _ctrlr2 = TextEditingController();
  final _ctrlr3 = TextEditingController();
  final _ctrlr4 = TextEditingController();
  final _ctrlr5 = TextEditingController();
  final _ctrlr6 = TextEditingController();
  final OTPState _otpState = OTPState();

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  Future<void> _startTimer() async {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_ctrlr6.text.isNotEmpty) {
          final result = MockRepository.getOTPResponse(
            listInput: [
              _ctrlr1.text,
              _ctrlr2.text,
              _ctrlr3.text,
              _ctrlr4.text,
              _ctrlr5.text,
              _ctrlr6.text,
            ],
          );
          setState(() {
            _otpState.error = result;
          });
          if (!_otpState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Xác thực OTP thành công'),
              ),
            );
            timer.cancel();
          }
        } else {
          _otpState.error = false;
        }
        if (_otpState.start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          if (mounted) {
            setState(() {
              _otpState.conntDown();
            });
          }
        }
      },
    );
  }

  void _onRefresh() {
    if (mounted) {
      setState(() {
        _otpState.refresh();
      });
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: const Text('OTP Count Down'),
          backgroundColor: Colors.green[300],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPDigitTextField(
                      first: true, last: false, controller: _ctrlr1),
                  OTPDigitTextField(
                      first: false, last: false, controller: _ctrlr2),
                  OTPDigitTextField(
                      first: false, last: false, controller: _ctrlr3),
                  OTPDigitTextField(
                      first: false, last: false, controller: _ctrlr4),
                  OTPDigitTextField(
                      first: false, last: false, controller: _ctrlr5),
                  OTPDigitTextField(
                      first: false, last: true, controller: _ctrlr6),
                ],
              ),
              Offstage(
                offstage: !_otpState.error,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Mã OTP không chính xác',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              OTPConfirmCase(
                value: _otpState.start,
                ontap: _onRefresh,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
