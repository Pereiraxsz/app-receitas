import 'package:flutter/material.dart';
import 'package:nutrireceitas/screens/home_screen.dart';

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
      home: const HomeScreen(),
    );
  }
}