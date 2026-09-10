import 'package:flutter/material.dart';

import 'screens/lista_receitas_screen.dart';

void main() {
  runApp(const NutriReceitas());
}

class NutriReceitas extends StatelessWidget {
  const NutriReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriReceitas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF275A1B),
        ),
        useMaterial3: true,
      ),
      home: const ListaReceitasScreen(
        categoria: 'Sobremesas',
      ),
    );
  }
}