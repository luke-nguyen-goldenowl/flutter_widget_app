import 'package:flutter/material.dart';

class FormRadioListTitle<T> extends StatelessWidget {
  const FormRadioListTitle(this.text, this.value, this.groupValue,
      {Key? key, required this.onChanged})
      : super(key: key);

  final String text;
  final T value;
  final T groupValue;
  final Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      title: Text(text),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
