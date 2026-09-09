import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Reproduz as formas onduladas verdes que aparecem no canto
/// superior-esquerdo e inferior-direito da tela "Receita salva!".
///
/// É um widget decorativo simples (não precisa ser pixel-perfect ao
/// Figma) — usa CustomPainter para desenhar duas curvas suaves.
class FundoOndulado extends StatelessWidget {
  final Widget child;

  const FundoOndulado({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundReceitaSalva,
      child: Stack(
        children: [
          // Onda no canto superior esquerdo
          Positioned(
            top: 0,
            left: 0,
            child: CustomPaint(
              size: const Size(220, 220),
              painter: _OndaPainter(alinhamentoTopo: true),
            ),
          ),
          // Onda no canto inferior direito
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(220, 220),
              painter: _OndaPainter(alinhamentoTopo: false),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _OndaPainter extends CustomPainter {
  final bool alinhamentoTopo;

  _OndaPainter({required this.alinhamentoTopo});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.ondaVerde
      ..style = PaintingStyle.fill;

    final path = Path();

    if (alinhamentoTopo) {
      path.moveTo(0, 0);
      path.lineTo(size.width * 0.75, 0);
      path.quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.35,
        0,
        size.height * 0.85,
      );
      path.close();
    } else {
      path.moveTo(size.width, size.height);
      path.lineTo(size.width * 0.25, size.height);
      path.quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.65,
        size.width,
        size.height * 0.15,
      );
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
