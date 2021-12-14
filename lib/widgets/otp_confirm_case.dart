import 'package:flutter/material.dart';

class OTPConfirmCase extends StatelessWidget {
  const OTPConfirmCase({
    Key? key,
    required this.start,
    required this.end,
    required this.isLoading,
    required this.onTap,
  }) : super(key: key);

  final int start;
  final int end;
  final bool isLoading;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (start == end) {
      return ElevatedButton(
        onPressed: onTap,
        child: const Text(
          "Gửi lại OTP",
        ),
      );
    } else {
      return Text(
        "Vui lòng chờ ${end - start} giây để gửi lại OTP",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      );
    }
  }
}
