import 'package:flutter/material.dart';

class QrCodePainter extends CustomPainter {
  static const _matrix = [
    '111111100101101111111',
    '100000101110101000001',
    '101110100100101011101',
    '101110101011101011101',
    '101110100110101011101',
    '100000101010101000001',
    '111111101010101111111',
    '000000001101100000000',
    '101011111001011101101',
    '110100001111000100010',
    '001101111001111011100',
    '111001010110010001011',
    '010111101001101110100',
    '000000001011010010111',
    '111111101101011001100',
    '100000101001110111001',
    '101110101111001010111',
    '101110100100111101000',
    '101110101011010011101',
    '100000101110111100010',
    '111111101001001011111',
  ];

  final Color foreground;

  const QrCodePainter({this.foreground = const Color(0xFF171A2B)});

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.shortestSide / _matrix.length;
    final paint = Paint()..color = foreground;

    for (var row = 0; row < _matrix.length; row++) {
      for (var column = 0; column < _matrix[row].length; column++) {
        if (_matrix[row][column] == '1') {
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(
                column * cellSize,
                row * cellSize,
                cellSize * 0.78,
                cellSize * 0.78,
              ),
              Radius.circular(cellSize * 0.12),
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant QrCodePainter oldDelegate) {
    return oldDelegate.foreground != foreground;
  }
}
