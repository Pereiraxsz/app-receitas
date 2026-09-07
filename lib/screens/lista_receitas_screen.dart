import 'package:flutter/material.dart';

import '../data/receitas_mock.dart';
import '../widgets/receita_card.dart';

class ListaReceitasScreen extends StatelessWidget {
  final String categoria;

  const ListaReceitasScreen({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    final receitasFiltradas = receitas
        .where((receita) => receita.categoria == categoria)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoria,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: receitasFiltradas.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma receita encontrada.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 20,
              ),
              itemCount: receitasFiltradas.length,
              itemBuilder: (context, index) {
                return ReceitaCard(
                  receita: receitasFiltradas[index],
                );
              },
            ),
    );
  }
}