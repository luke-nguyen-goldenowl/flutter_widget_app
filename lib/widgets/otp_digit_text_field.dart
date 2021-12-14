import 'package:flutter/material.dart';

class OTPTextField extends StatefulWidget {
  const OTPTextField({
    Key? key,
    this.value = '',
    this.onChanged,
    this.length = 6,
  }) : super(key: key);

  final String value;
  final Function(String)? onChanged;
  final int length;

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  List<TextEditingController> listValue = [];

  @override
  void initState() {
    _onSetValue();
    super.initState();
  }

  _onSetValue() {
    for (int i = 0; i < widget.length; i++) {
      listValue.add(TextEditingController());
      listValue[i].addListener(() {
        widget.onChanged;
      });
      listValue[i].notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: widget.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: OTPDigitTextField(
              controller: listValue[index],
            ),
          );
        },
      ),
    );
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children:  [
    //     OTPDigitTextField(first: true, controller: listValue[0]),
    //     OTPDigitTextField(controller: listValue[1]),
    //     OTPDigitTextField(controller: listValue[2]),
    //     OTPDigitTextField(controller: listValue[3]),
    //     OTPDigitTextField(controller: listValue[4]),
    //     OTPDigitTextField(last: true, controller: listValue[5]),
    //   ],
    // );
  }
}

class OTPDigitTextField extends StatelessWidget {
  final bool first;
  final bool last;
  final TextEditingController controller;
  const OTPDigitTextField(
      {Key? key,
      this.first = false,
      this.last = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: TextField(
          controller: controller,
          style: const TextStyle(fontSize: 35),
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(),
            // enabledBorder: OutlineInputBorder(
            //     borderSide: const BorderSide(width: 2, color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10)),
            // focusedBorder: OutlineInputBorder(
            //     borderSide: const BorderSide(width: 2, color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
