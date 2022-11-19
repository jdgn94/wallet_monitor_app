import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/colorSchema.dart';

class BackgroundUtil extends StatelessWidget {
  const BackgroundUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        containerPainter(_FigureFour()),
        containerPainter(_FigureTree()),
        containerPainter(_FigureTwo()),
        containerPainter(_FigureOne()),
      ],
    );
  }

  CustomPaint containerPainter(CustomPainter painter) {
    return CustomPaint(
      painter: painter,
      child: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class _FigureOne extends CustomPainter {
  ColorSchemaApp colorSchema = ColorSchemaApp();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorSchema.primaryMoreLight
      ..strokeWidth = .5
      ..style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(0, size.height * .1);
    path.lineTo(size.width * .25, size.height * .15);
    path.lineTo(size.width, size.height * .04);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _FigureTwo extends CustomPainter {
  ColorSchemaApp colorSchema = ColorSchemaApp();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorSchema.primaryLight
      ..strokeWidth = .5
      ..style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(0, size.height * .15);
    path.lineTo(size.width * .25, size.height * .2);
    path.lineTo(size.width, size.height * .09);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _FigureTree extends CustomPainter {
  ColorSchemaApp colorSchema = ColorSchemaApp();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorSchema.primaryDark
      ..strokeWidth = .5
      ..style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(0, size.height * .2);
    path.lineTo(size.width * .25, size.height * .25);
    path.lineTo(size.width, size.height * .14);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _FigureFour extends CustomPainter {
  ColorSchemaApp colorSchema = ColorSchemaApp();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorSchema.primaryMoreDark
      ..strokeWidth = .5
      ..style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(0, size.height * .25);
    path.lineTo(size.width * .25, size.height * .30);
    path.lineTo(size.width, size.height * .19);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
