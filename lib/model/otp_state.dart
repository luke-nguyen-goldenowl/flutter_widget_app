import 'package:flutter/cupertino.dart';

class OTPState {
  DateTime start;
  bool error;
  bool isLoading;
  bool isEnd;

  OTPState(
    this.start, {
    this.isEnd = false,
    this.error = false,
    this.isLoading = false,
  });

  void setError(int otp, List<TextEditingController> list) {
    isLoading = false;
    String otpInput = '';
    for (int i = 0; i < list.length; i++) {
      otpInput += list[i].text;
    }
    if (int.parse(otpInput) == otp) {
      error = false;
    } else {
      error = true;
    }
  }

  void setConntDown() {
    start = DateTime.now();
  }

  void checkEndOfValue(int end) {
    if (start.second == end) {
      isEnd = true;
    } else {
      isEnd = false;
    }
  }

  void setLoading() {
    isLoading = true;
  }
}
