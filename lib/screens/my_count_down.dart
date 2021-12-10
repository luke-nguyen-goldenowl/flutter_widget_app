import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/constants/mock.dart';
import 'package:flutter_widget_app/widgets/otp_digit_text_field.dart';

class MyOTPCountDown extends StatefulWidget {
  static const String routeName = '/otp-count-down';
  const MyOTPCountDown({Key? key}) : super(key: key);

  @override
  _MyOTPCountDownState createState() => _MyOTPCountDownState();
}

class _MyOTPCountDownState extends State<MyOTPCountDown> {
  late Timer _timer;
  int _start = 10;
  final _ctrlr1 = TextEditingController();
  final _ctrlr2 = TextEditingController();
  final _ctrlr3 = TextEditingController();
  final _ctrlr4 = TextEditingController();
  final _ctrlr5 = TextEditingController();
  final _ctrlr6 = TextEditingController();
  String _otpController = '';
  late int _otp;
  bool _offStage = true;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  Future<void> _startTimer() async {
    _otp = await MockRepository.getOTP();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_ctrlr6.text.isNotEmpty) {
          setState(() {
            _otpController = _ctrlr1.text +
                _ctrlr2.text +
                _ctrlr3.text +
                _ctrlr4.text +
                _ctrlr5.text +
                _ctrlr6.text;
          });
          if (int.tryParse(_otpController) == _otp) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Xác thực OTP thành công'),
              ),
            );
            _offStage = true;
            timer.cancel();
          } else {
            _offStage = false;
          }
        } else {
          _offStage = true;
        }
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  void _onRefresh() {
    if (mounted) {
      setState(() {
        _start = 10;
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
        const SliverAppBar(
          title: Text('OTP Count Down'),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                offstage: _offStage,
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
              if (_start == 0)
                GestureDetector(
                  onTap: () {
                    _onRefresh();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Text(
                      "Gửi lại OTP",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              else
                Text(
                  "Vui lòng chờ $_start giây để gửi lại OTP",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
