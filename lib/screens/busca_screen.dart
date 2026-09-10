import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/receita.dart';
import '../services/favoritos_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/barra_navegacao_inferior.dart';
import '../widgets/receita_card.dart';

/// Tela de Busca — fiel ao node 42:577 do Figma.
///
/// Layout completo: campo de busca, chips de "Sugestões", grid de
/// "Filtros" (visual, sem lógica ainda) e lista de "Resultados" usando
/// o mesmo ReceitaCard da tela de Favoritos.
class BuscaScreen extends StatefulWidget {
  const BuscaScreen({super.key});

  @override
  State<BuscaScreen> createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  final TextEditingController _controller = TextEditingController();
  String _termo = '';
  String? _chipSelecionado;

  // Chips de sugestão, na mesma ordem do protótipo.
  static const List<String> _sugestoes = [
    'Frango', 'Salada', 'Smoothie', 'Omelete', 'Panqueca', 'Sopa', 'Bolo',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Receita> get _resultados {
    Iterable<Receita> lista = mockReceitas;

    if (_chipSelecionado != null) {
      final chip = _chipSelecionado!.toLowerCase();
      lista = lista.where((r) =>
          r.nome.toLowerCase().contains(chip) ||
          r.categoria.toLowerCase().contains(chip));
    }

    if (_termo.trim().isNotEmpty) {
      final termoBusca = _termo.toLowerCase();
      lista = lista.where((r) {
        final nomeCombina = r.nome.toLowerCase().contains(termoBusca);
        final ingredienteCombina =
            r.ingredientes.any((i) => i.toLowerCase().contains(termoBusca));
        return nomeCombina || ingredienteCombina;
      });
    }

    return lista.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                children: [
                  Text(
                    'Buscar receitas',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.tituloTela(),
                  ),
                  const SizedBox(height: 20),

                  // Campo de busca (outline preto, rounded 30 — igual ao Figma)
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.bordaCampoBusca, width: 1),
                    ),
                    child: TextField(
                      controller: _controller,
                      onChanged: (valor) => setState(() => _termo = valor),
                      style: AppTextStyles.placeholder.copyWith(color: AppColors.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'Buscar receitas...',
                        hintStyle: AppTextStyles.placeholder,
                        prefixIcon: const Icon(Icons.search, color: AppColors.textPrimary),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sugestões (chips)
                  Text('Sugestões', style: AppTextStyles.tituloSecao),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _sugestoes.map((s) {
                      final selecionado = _chipSelecionado == s;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _chipSelecionado = selecionado ? null : s;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: selecionado ? AppColors.primary : AppColors.background,
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(
                              color: selecionado ? AppColors.primary : AppColors.textPrimary,
                            ),
                          ),
                          child: Text(s, style: AppTextStyles.chip(selecionado: selecionado)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Filtros (visual, igual ao Figma — lógica pode ser adicionada depois)
                  Text('Filtros', style: AppTextStyles.tituloSecao),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: const [
                      _BotaoFiltro(icone: Icons.access_time, rotulo: 'Tempo'),
                      _BotaoFiltro(icone: Icons.local_fire_department_outlined, rotulo: 'Calorias'),
                      _BotaoFiltro(icone: Icons.grid_view_rounded, rotulo: 'Categoria'),
                      _BotaoFiltro(icone: Icons.bar_chart, rotulo: 'Dificuldade'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Resultados
                  Text('Resultados', style: AppTextStyles.tituloSecao),
                  const SizedBox(height: 12),

                  AnimatedBuilder(
                    animation: FavoritosController.instance,
                    builder: (context, _) {
                      final resultados = _resultados;

                      if (resultados.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                            child: Text(
                              'Nenhuma receita encontrada.',
                              style: AppTextStyles.subtituloTela(),
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: resultados.map((receita) {
                          final jaFavoritado = FavoritosController.instance.isFavorito(receita);
                          return ReceitaCard(
                            receita: receita,
                            isFavorito: jaFavoritado,
                            onTap: () {
                              // TODO: navegar para a tela de Detalhe (P4)
                            },
                            onFavoritar: () {
                              final estavaFavoritado = jaFavoritado;
                              FavoritosController.instance.alternarFavorito(receita);
                              if (!estavaFavoritado) {
                                Navigator.pushNamed(context, '/receita-salva');
                              }
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),

            BarraNavegacaoInferior(
              indiceAtual: 1,
              onTocar: (index) {
                // TODO: integrar com routes.dart do time (P1)
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Botão de filtro visual (Tempo / Calorias / Categoria / Dificuldade).
/// A lógica de filtro real pode ser plugada depois no onTap.
class _BotaoFiltro extends StatelessWidget {
  final IconData icone;
  final String rotulo;

  const _BotaoFiltro({required this.icone, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.filtroFundo,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icone, size: 18, color: AppColors.textPrimary),
          const SizedBox(width: 8),
          Text(rotulo, style: AppTextStyles.chip(selecionado: false)),
        ],
      ),
    );
  }
}
