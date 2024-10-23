import 'package:flutter/material.dart';

class BeamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.red.withOpacity(0.5), // 위쪽은 조금 더 강한 빛
          Colors.red.withOpacity(0.2),
          Colors.transparent, // 아래로 갈수록 투명
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(size.width * 0.4, 4) // 상단 왼쪽 점 (좁게 시작)
      ..lineTo(size.width * 0.6, 4) // 상단 오른쪽 점 (좁게 끝)
      ..lineTo(size.width * 0.8, size.height) // 아래쪽 오른쪽으로 넓어짐
      ..lineTo(size.width * 0.2, size.height) // 아래쪽 왼쪽으로 넓어짐
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}