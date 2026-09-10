import 'package:flutter/material.dart';

import '../models/receita.dart';
import '../screens/detalhes_receita_screen.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;
  final bool isFavorito;
  final VoidCallback? onTap;
  final VoidCallback? onFavoritar;

  const ReceitaCard({
    super.key,
    required this.receita,
    this.isFavorito = false,
    this.onTap,
    this.onFavoritar,
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
        onTap: onTap ??
            () {
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
            Stack(
              children: [
                Image.network(
                  receita.imagem,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(
                          Icons.restaurant_menu_rounded,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
                if (onFavoritar != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.white.withValues(alpha: 0.85),
                      shape: const CircleBorder(),
                      child: IconButton(
                        icon: Icon(
                          isFavorito
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorito ? Colors.red : Colors.black87,
                          size: 22,
                        ),
                        onPressed: onFavoritar,
                      ),
                    ),
                  ),
              ],
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