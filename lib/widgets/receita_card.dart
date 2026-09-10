import 'package:flutter/material.dart';

import '../models/receita.dart';
import '../screens/detalhes_receita_screen.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;

  const ReceitaCard({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesReceitaScreen(
                receita: receita,
              ),
            ),
          );
        },
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            receita.imagem,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Text(
              receita.nome,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  '${receita.tempoPreparo} min',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}