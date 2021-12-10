import 'package:flutter/material.dart';

class OTPConfirmCase extends StatelessWidget {
  const OTPConfirmCase({Key? key, required this.value, required this.ontap})
      : super(key: key);

  final int value;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    if (value == 0) {
      return GestureDetector(
        onTap: ontap,
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
      );
    } else {
      return Text(
        "Vui lòng chờ $value giây để gửi lại OTP",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      );
    }
  }
}
