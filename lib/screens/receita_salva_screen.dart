import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/fundo_ondulado.dart';

/// Tela de confirmação exibida logo após o usuário favoritar uma receita.
///
/// Fiel ao node 104:569 do Figma: fundo #F1FBED, círculo #DCEED2 com
/// coração verde, título 32px, subtítulo cinza #928585, botão verde
/// #275915 com cantos bem arredondados, e link "Continuar navegando".
class ReceitaSalvaScreen extends StatelessWidget {
  const ReceitaSalvaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FundoOndulado(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Círculo verde claro com coração
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      color: AppColors.circuloVerdeClaro,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.iconeCoracaoVerde,
                      size: 42,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text('Receita salva!', style: AppTextStyles.tituloTela(size: 32)),
                  const SizedBox(height: 10),

                  Text(
                    'A receita foi adicionada aos\nseus favoritos!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtituloTela(
                      color: AppColors.textoSubtituloReceitaSalva,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão "Ver favoritos"
                  SizedBox(
                    width: double.infinity,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/favoritos');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: Text('Ver favoritos', style: AppTextStyles.textoBotao),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Link "Continuar navegando"
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Continuar navegando', style: AppTextStyles.link),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
