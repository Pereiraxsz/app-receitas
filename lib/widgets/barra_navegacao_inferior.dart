import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Barra inferior com 4 abas: Início, Buscar, Favoritos e Perfil.
///
/// No Figma, os labels inativos são PRETOS (não cinza) e só o item
/// ativo fica verde (#306D36) — tanto o ícone quanto o texto.
class BarraNavegacaoInferior extends StatelessWidget {
  /// Índice da aba ativa: 0 = Início, 1 = Buscar, 2 = Favoritos, 3 = Perfil
  final int indiceAtual;
  final ValueChanged<int> onTocar;

  const BarraNavegacaoInferior({
    super.key,
    required this.indiceAtual,
    required this.onTocar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Color(0xFFEAEAEA), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _itemBarra(icone: Icons.home_outlined, iconeAtivo: Icons.home, rotulo: 'Início', indice: 0),
          _itemBarra(icone: Icons.search, iconeAtivo: Icons.search, rotulo: 'Buscar', indice: 1),
          _itemBarra(icone: Icons.favorite_border, iconeAtivo: Icons.favorite, rotulo: 'Favoritos', indice: 2),
          _itemBarra(icone: Icons.person_outline, iconeAtivo: Icons.person, rotulo: 'Perfil', indice: 3),
        ],
      ),
    );
  }

  Widget _itemBarra({
    required IconData icone,
    required IconData iconeAtivo,
    required String rotulo,
    required int indice,
  }) {
    final bool ativo = indice == indiceAtual;
    final Color cor = ativo ? AppColors.navAtivo : AppColors.textPrimary;

    return InkWell(
      onTap: () => onTocar(indice),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ativo ? iconeAtivo : icone, color: cor, size: 24),
          const SizedBox(height: 3),
          Text(rotulo, style: AppTextStyles.navLabel(ativo: ativo)),
        ],
      ),
    );
  }
}
