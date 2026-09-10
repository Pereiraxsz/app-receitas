import 'package:flutter/material.dart';
import '../services/favoritos_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/barra_navegacao_inferior.dart';
import '../widgets/receita_card.dart';

/// Tela "Meus favoritos" — fiel ao node 79:753 do Figma.
///
/// Título "Meus favoritos" (36px, centralizado), subtítulo cinza
/// (#484141, centralizado), lista de ReceitaCard com coração vermelho
/// preenchido (já favoritado).
class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: FavoritosController.instance,
          builder: (context, _) {
            final favoritos = FavoritosController.instance.favoritos;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 4),
                  child: Text(
                    'Meus favoritos',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.tituloTela(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Suas receitas favoritas em um só lugar',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtituloTela(),
                  ),
                ),
                const SizedBox(height: 20),

                Expanded(
                  child: favoritos.isEmpty
                      ? const _EstadoVazio()
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          itemCount: favoritos.length,
                          itemBuilder: (context, index) {
                            final receita = favoritos[index];
                            return ReceitaCard(
                              receita: receita,
                              isFavorito: true,
                              onTap: () {
                                // TODO: navegar para a tela de Detalhe (P4)
                                // Navigator.pushNamed(context, '/detalhe', arguments: receita);
                              },
                              onFavoritar: () {
                                FavoritosController.instance.alternarFavorito(receita);
                              },
                            );
                          },
                        ),
                ),

                BarraNavegacaoInferior(
                  indiceAtual: 2,
                  onTocar: (index) {
                    // TODO: integrar com routes.dart do time (P1)
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EstadoVazio extends StatelessWidget {
  const _EstadoVazio();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.favorite_border, size: 56, color: AppColors.favoritoInativo),
            const SizedBox(height: 12),
            Text(
              'Você ainda não favoritou nenhuma receita.',
              textAlign: TextAlign.center,
              style: AppTextStyles.subtituloTela(),
            ),
          ],
        ),
      ),
    );
  }
}
