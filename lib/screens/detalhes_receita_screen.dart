import 'package:flutter/material.dart';

import '../models/receita.dart';

class DetalhesReceitaScreen extends StatelessWidget {
  final Receita receita;

  const DetalhesReceitaScreen({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
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

              // Barra de informações (Tempo, Dificuldade, Calorias, Quantidade)
              _buildInfoRow(),
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
              _buildIngredientesList(),
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
              _buildModoPreparoList(),
              const SizedBox(height: 36),

              // Botão Começar receita
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Iniciando o preparo de: ${receita.nome}',
                          ),
                          backgroundColor: const Color(0xFF275A1B),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
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
  Widget _buildInfoRow() {
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
  Widget _buildIngredientesList() {
    if (receita.ingredientes.isEmpty) {
      return Text(
        'Nenhum ingrediente informado.',
        style: TextStyle(color: Colors.grey.shade600),
      );
    }

    return Column(
      children: receita.ingredientes.map((ingrediente) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E8224),
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
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF222222),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Lista de passos do modo de preparo numerados com círculo verde
  Widget _buildModoPreparoList() {
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
