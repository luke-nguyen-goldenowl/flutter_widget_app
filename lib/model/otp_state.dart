import 'package:flutter/cupertino.dart';

class OTPState {
  DateTime start;
  bool error;
  bool isLoading;

  OTPState(
    this.start, {
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

  void setLoading() {
    isLoading = true;
  }
}
