import 'package:flutter/material.dart';

import 'screens/lista_receitas_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListaReceitasScreen(
        categoria: 'Massas',
      ),
    );
  }
}