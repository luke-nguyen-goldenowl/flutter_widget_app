import 'dart:math';
import 'package:flutter/material.dart';

class CustomCoupons extends StatelessWidget {
  const CustomCoupons({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChangeValue,
    required this.codeVoucher,
    required this.exp,
  }) : super(key: key);

  final int value;
  final int groupValue;
  final void Function(int?) onChangeValue;
  final String codeVoucher;
  final DateTime exp;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CouponShapeBorder(),
      margin: const EdgeInsets.all(10.0),
      child: CustomPaint(
        painter: CustomDashLinePainter(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: Colors.green[100],
                width: 60,
                height: 60,
                child: Center(
                  child: Text(
                    '${value}k',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                    child: Text(
                      codeVoucher,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Giảm giá ${value}k cho đơn hàng',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 15, top: 10),
                    child: Text(
                      'Kết thúc ${exp.day}/${exp.month}/${exp.year}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChangeValue,
            ),
          ],
        ),
      ),
    );
  }
}

class CouponShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Offset topOffset = Offset(rect.width * 0.25, 0.0);
    Offset bottomOffset = Offset(rect.width * 0.25, rect.height);

    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight);
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10)))
      ..moveTo(rect.width * 0.25 - 10, 0)
      ..arcTo(Rect.fromCircle(center: topOffset, radius: 10), pi, -pi, false)
      ..moveTo(rect.width * 0.25 - 10, rect.height)
      ..arcTo(Rect.fromCircle(center: bottomOffset, radius: 10), 0, -pi, false)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class CustomDashLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 1;

    _drawDashedLine(canvas, size, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    const int dashHeight = 5;
    const int dashSpace = 5;
    double x = size.width * 0.25;
    double startY = 15;

    while (startY < size.height - 15) {
      canvas.drawLine(Offset(x, startY), Offset(x, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }
}

// class BorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Offset topCenter = Offset(size.width * 0.25 + 10, 0.0);
//     Offset bottomCenter = Offset(size.width * 0.25 + 10, size.height);
//     Offset topLeft = const Offset(7, 7);
//     Offset topRight = Offset(size.width - 7, 7);
//     Offset bottomRight = Offset(size.width - 7, size.height - 7);
//     Offset bottomLeft = Offset(7, size.height - 7);

//     Paint paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//     Path path = Path();

//     path.arcTo(Rect.fromCircle(center: topLeft, radius: 7), pi, pi / 2, false);
//     path.lineTo(size.width * 0.25, 0.0);
//     path.arcTo(Rect.fromCircle(center: topCenter, radius: 10), pi, -pi, false);
//     path.lineTo(size.width - 7, 0.0);
//     path.arcTo(
//         Rect.fromCircle(center: topRight, radius: 7), -pi / 2, pi / 2, false);
//     path.lineTo(size.width, size.height - 7);
//     path.arcTo(
//         Rect.fromCircle(center: bottomRight, radius: 7), 2 * pi, pi / 2, false);
//     path.lineTo(size.width * 0.25 + 20, size.height);
//     path.arcTo(
//         Rect.fromCircle(center: bottomCenter, radius: 10), 0, -pi, false);
//     path.lineTo(7, size.height);
//     path.arcTo(
//         Rect.fromCircle(center: bottomLeft, radius: 7), pi / 2, pi / 2, false);
//     path.lineTo(0.0, 7);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
