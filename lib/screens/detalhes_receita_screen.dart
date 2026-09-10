import 'package:flutter/material.dart';

import '../models/receita.dart';

class DetalhesReceitaScreen extends StatefulWidget {
  final Receita receita;

  const DetalhesReceitaScreen({
    super.key,
    required this.receita,
  });

  @override
  State<DetalhesReceitaScreen> createState() => _DetalhesReceitaScreenState();
}

class _DetalhesReceitaScreenState extends State<DetalhesReceitaScreen> {
  bool _isFavorito = false;
  final Set<int> _ingredientesChecados = {};

  void _toggleFavorito() {
    setState(() {
      _isFavorito = !_isFavorito;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorito
              ? '${widget.receita.nome} adicionado aos favoritos!'
              : '${widget.receita.nome} removido dos favoritos.',
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF275A1B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _abrirModoPreparoInterativo() {
    if (widget.receita.modoPreparo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Esta receita não possui passos cadastrados.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        int passoAtual = 0;
        return StatefulBuilder(
          builder: (context, setModalState) {
            final totalPassos = widget.receita.modoPreparo.length;
            final isUltimoPasso = passoAtual == totalPassos - 1;

            return Padding(
              padding: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).padding.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cabeçalho do modal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Passo ${passoAtual + 1} de $totalPassos',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF275A1B),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Barra de progresso do preparo
                  LinearProgressIndicator(
                    value: (passoAtual + 1) / totalPassos,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF275A1B),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 24),

                  // Texto do passo atual
                  Text(
                    widget.receita.modoPreparo[passoAtual],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botões de navegação dos passos
                  Row(
                    children: [
                      if (passoAtual > 0)
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF275A1B)),
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              setModalState(() {
                                passoAtual--;
                              });
                            },
                            child: const Text(
                              'Anterior',
                              style: TextStyle(
                                color: Color(0xFF275A1B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      if (passoAtual > 0) const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF275A1B),
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (isUltimoPasso) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    '🎉 Parabéns! Receita concluída com sucesso!',
                                  ),
                                  backgroundColor: const Color(0xFF275A1B),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            } else {
                              setModalState(() {
                                passoAtual++;
                              });
                            }
                          },
                          child: Text(
                            isUltimoPasso ? 'Concluir' : 'Próximo passo',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final receita = widget.receita;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorito ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: _isFavorito ? Colors.red : Colors.black87,
            ),
            onPressed: _toggleFavorito,
          ),
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.black87,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Compartilhar: ${receita.nome}'),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem da receita com cantos arredondados
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  receita.imagem,
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Icon(
                        Icons.restaurant_menu_rounded,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),

              // Nome da receita
              Text(
                receita.nome,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 16),

              // Barra de 4 informações (Tempo, Dificuldade, Calorias, Quantidade)
              _buildInfoRow(receita),
              const SizedBox(height: 26),

              // Seção Ingredientes
              const Text(
                'Ingredientes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 14),
              _buildIngredientesList(receita),
              const SizedBox(height: 26),

              // Seção Modo de preparo
              const Text(
                'Modo de preparo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 14),
              _buildModoPreparoList(receita),
              const SizedBox(height: 36),

              // Botão Começar receita (Pílula verde escuro)
              Center(
                child: SizedBox(
                  width: 230,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF275A1B),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: _abrirModoPreparoInterativo,
                    child: const Text(
                      'Começar receita',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Barra de 4 informações com divisores verticais
  Widget _buildInfoRow(Receita receita) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoItem(
              icon: Icons.access_time_rounded,
              value: '${receita.tempoPreparo} min',
              label: 'Tempo',
            ),
            _buildVerticalDivider(),
            _buildInfoItem(
              icon: Icons.signal_cellular_alt_rounded,
              value: receita.dificuldade.isNotEmpty ? receita.dificuldade : 'Média',
              label: 'Dificuldade',
            ),
            _buildVerticalDivider(),
            _buildInfoItem(
              icon: Icons.local_fire_department_outlined,
              value: receita.calorias.isNotEmpty ? receita.calorias : '~700 kcal',
              label: 'Calorias',
            ),
            _buildVerticalDivider(),
            _buildInfoItem(
              icon: Icons.people_outline_rounded,
              value: receita.porcoes.isNotEmpty ? receita.porcoes : '8 porções',
              label: 'Quantidade',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: const Color(0xFF333333),
            ),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return VerticalDivider(
      color: Colors.grey.shade300,
      thickness: 1,
      width: 16,
    );
  }

  // Lista de ingredientes com badge circular verde e check branco
  Widget _buildIngredientesList(Receita receita) {
    if (receita.ingredientes.isEmpty) {
      return Text(
        'Nenhum ingrediente informado.',
        style: TextStyle(color: Colors.grey.shade600),
      );
    }

    return Column(
      children: receita.ingredientes.asMap().entries.map((entry) {
        final index = entry.key;
        final ingrediente = entry.value;
        final isChecked = _ingredientesChecados.contains(index);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                if (isChecked) {
                  _ingredientesChecados.remove(index);
                } else {
                  _ingredientesChecados.add(index);
                }
              });
            },
            child: Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: isChecked ? Colors.grey.shade400 : const Color(0xFF1E8224),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    ingrediente,
                    style: TextStyle(
                      fontSize: 15,
                      color: isChecked ? Colors.grey.shade500 : const Color(0xFF222222),
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // Lista de passos do modo de preparo numerados com círculo verde
  Widget _buildModoPreparoList(Receita receita) {
    if (receita.modoPreparo.isEmpty) {
      return Text(
        'Nenhum modo de preparo informado.',
        style: TextStyle(color: Colors.grey.shade600),
      );
    }

    final passos = receita.modoPreparo;
    return Column(
      children: List.generate(passos.length, (index) {
        final numero = index + 1;
        final passo = passos[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E8224),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$numero',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  passo,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF222222),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
