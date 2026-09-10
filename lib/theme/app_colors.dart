import 'package:flutter/material.dart';

/// Paleta extraída DIRETO do Figma (via Dev Mode / MCP), pixel a pixel,
/// das telas: Busca (42:577), Favoritos (79:753) e Receita salva (104:569).
class AppColors {
  // Verde principal (botões, links, ícone ativo da navegação)
  static const Color primary = Color(0xFF275915); // botão "Ver favoritos" / link "Continuar navegando"
  static const Color navAtivo = Color(0xFF306D36); // cor do ícone/label ativo na barra inferior

  // Tela "Receita salva!"
  static const Color backgroundReceitaSalva = Color(0xFFF1FBED);
  static const Color ondaVerde = Color(0xFFD3E4C8); // formas onduladas decorativas
  static const Color circuloVerdeClaro = Color(0xFFDCEED2); // fundo do círculo atrás do coração
  static const Color iconeCoracaoVerde = Color(0xFF3C8B1F); // coração verde dentro do círculo
  static const Color textoSubtituloReceitaSalva = Color(0xFF928585);

  // Cards de receita (Busca e Favoritos)
  static const Color cardFundo = Color(0xFFF4F1F1);
  static const Color categoriaPillFundo = Color(0xFFFFF7DD); // fundo do "selo" de categoria
  static const Color favoritoAtivo = Color(0xFFE53935); // coração vermelho preenchido
  static const Color favoritoInativo = Color(0xFF1A1A1A); // coração contornado (preto/outline)

  // Tela de Busca
  static const Color bordaCampoBusca = Color(0xFF000000);
  static const Color placeholderBusca = Color(0xFFBDB1B1);
  static const Color filtroFundo = Color(0xFFF4F1F1);

  // Neutras
  static const Color background = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondaryFavoritos = Color(0xFF484141); // subtítulo "Suas receitas..."
  static const Color textSecondary = Color(0xFF757575);
}
