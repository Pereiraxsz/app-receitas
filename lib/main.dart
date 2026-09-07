import 'package:flutter/material.dart';

void main() {
  runApp(const AppReceitas());
}

class AppReceitas extends StatelessWidget {
  const AppReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App de Receitas'),
        ),
        body: const Center(
          child: Text('Projeto em desenvolvimento'),
        ),
      ),
    );
  }
}