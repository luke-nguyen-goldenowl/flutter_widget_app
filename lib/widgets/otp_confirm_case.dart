import 'package:flutter/material.dart';

class OTPConfirmCase extends StatelessWidget {
  const OTPConfirmCase({
    Key? key,
    required this.start,
    required this.isEnd,
    required this.onTap,
  }) : super(key: key);

  final int start;
  final bool isEnd;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    if (isEnd) {
      return ElevatedButton(
        onPressed: onTap,
        child: const Text(
          "Gửi lại OTP",
        ),
      );
    } else {
      return Text(
        "Vui lòng chờ $start giây để gửi lại OTP",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      );
    }
  }
}
