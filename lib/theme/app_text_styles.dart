import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Estilos de texto padronizados com a fonte "Jost" (a mesma usada no
/// protótipo do Figma). Usa o pacote google_fonts, que baixa a fonte
/// automaticamente na primeira execução (não precisa adicionar arquivo
/// de fonte manualmente no projeto).
class AppTextStyles {
  // Título grande de tela (ex: "Meus favoritos", "Buscar receitas")
  static TextStyle tituloTela({double size = 36}) => GoogleFonts.jost(
        fontSize: size,
        fontWeight: FontWeight.w500, // Jost Medium
        color: AppColors.textPrimary,
      );

  // Subtítulo de tela (semibold, cinza)
  static TextStyle subtituloTela({Color? color}) => GoogleFonts.jost(
        fontSize: 14,
        fontWeight: FontWeight.w600, // Jost SemiBold
        color: color ?? AppColors.textSecondaryFavoritos,
      );

  // Títulos de seção (ex: "Sugestões", "Filtros", "Resultados")
  static TextStyle tituloSecao = GoogleFonts.jost(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Nome da receita nos cards
  static TextStyle nomeReceita = GoogleFonts.jost(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Categoria da receita (dentro do selo amarelo)
  static TextStyle categoriaReceita = GoogleFonts.jost(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  // Tempo / calorias nos cards
  static TextStyle infoReceita = GoogleFonts.jost(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  // Texto de botão (branco)
  static TextStyle textoBotao = GoogleFonts.jost(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Link "Continuar navegando"
  static TextStyle link = GoogleFonts.jost(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  // Label da barra de navegação inferior
  static TextStyle navLabel({required bool ativo}) => GoogleFonts.jost(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ativo ? AppColors.navAtivo : AppColors.textPrimary,
      );

  // Chips de sugestão / placeholder de busca
  static TextStyle chip({required bool selecionado}) => GoogleFonts.jost(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: selecionado ? Colors.white : AppColors.textPrimary,
      );

  static TextStyle placeholder = GoogleFonts.jost(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.placeholderBusca,
  );
}
