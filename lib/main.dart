import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NutriReceitas'),
        ),
        body: const Center(
          child: Text('Projeto em desenvolvimento'),
        ),
      ),
    );
  }
}