import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/model/otp_state.dart';
import 'package:flutter_widget_app/widgets/gradient_app_bar.dart';
import 'package:flutter_widget_app/widgets/otp_confirm_case.dart';

class MyOTPCountDown extends StatefulWidget {
  static const String routeName = '/otp-count-down';
  const MyOTPCountDown({Key? key}) : super(key: key);

  @override
  _MyOTPCountDownState createState() => _MyOTPCountDownState();
}

class _MyOTPCountDownState extends State<MyOTPCountDown> {
  late Timer _timer;
  final OTPState _otpState = OTPState(DateTime.now());
  late DateTime _end;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() async {
    _end = DateTime.now().add(const Duration(seconds: 10));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) async {
        if (_otpState.start.second == _end.second) {
          timer.cancel();
        } else {
          if (mounted) {
            setState(() {
              _otpState.setConntDown();
            });
          }
        }
      },
    );
  }

  void _onRefresh() {
    if (mounted) {
      setState(() {
        _otpState.isLoading = true;
      });
    }
    Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _otpState.setConntDown();
        _otpState.isLoading = false;
      });
    }
    _startTimer();
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
          const TextField(),
          Container(
            margin: const EdgeInsets.all(30),
            child: OTPConfirmCase(
              start: _otpState.start.second,
              end: _end.second,
              isLoading: _otpState.isLoading,
              onTap: _onRefresh,
            ),
          ),
        ],
      ),
    );
  }
}
