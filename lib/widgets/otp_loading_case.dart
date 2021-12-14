import 'package:flutter/material.dart';

class OTPLoadingCase extends StatelessWidget {
  const OTPLoadingCase(
      {Key? key,
      this.endOfValue = false,
      this.isLoading = false,
      this.isError = false})
      : super(key: key);

  final bool endOfValue;
  final bool isLoading;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    if (endOfValue && !isError && !isLoading) {
      Future.delayed(Duration.zero, () => _showAlert(context));
    }
    if (endOfValue) {
      if (isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (isError) {
        return const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Mã OTP không chính xác',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  void _showAlert(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Center(child: Text('Xác nhận OTP thành công')),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
        );
      },
    );
  }
}
