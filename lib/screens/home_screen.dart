// Importa os widgets visuais prontos do Flutter (Material Design)
import 'package:flutter/material.dart';
// Importa a lista mockada de receitas, pra usar os dados dela nesta tela
import 'package:nutrireceitas/data/receitas_mock.dart';
// Importa a tela de destino, pra onde vamos navegar ao clicar num card
import 'package:nutrireceitas/screens/lista_receitas_screen.dart';

// Declara a classe HomeScreen, que "é um tipo de" tela sem estado (StatelessWidget)
class HomeScreen extends StatelessWidget {
  // Construtor da tela; super.key repassa a chave de identificação pro Flutter
  const HomeScreen({super.key});

  @override // Indica que este método substitui o "build" da classe pai
  Widget build(BuildContext context) { // Método que descreve o que a tela desenha
    // Extrai as categorias únicas a partir da lista mockada de receitas
    List<String> categorias =
        receitas // Pega a lista de receitas
            .map((r) => r.categoria) // Transforma cada receita no valor da sua categoria
            .toSet() // Remove categorias repetidas (Set não permite duplicados)
            .toList(); // Converte de volta para lista

    return Scaffold( // Retorna a estrutura padrão de tela (barra + corpo)
      appBar: AppBar( // Define a barra superior da tela
        title: const Text('NutriReceitas'), // Texto exibido na barra superior
      ), // Fim do AppBar
      body: GridView.builder( // Corpo da tela: uma grade construída sob demanda
        padding: const EdgeInsets.all(12), // Espaçamento de 12px ao redor de toda a grade
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // Define o layout da grade
          crossAxisCount: 2, // Número fixo de colunas: 2
          crossAxisSpacing: 12, // Espaço horizontal entre os itens
          mainAxisSpacing: 12, // Espaço vertical entre os itens
        ), // Fim do gridDelegate
        itemCount: categorias.length, // Quantidade total de itens a desenhar na grade
        itemBuilder: (context, index) { // Função chamada uma vez para cada posição da grade
          String categoria = categorias[index]; // Pega a categoria correspondente a essa posição
          return Card( // Retorna um "cartão" visual com sombra
            elevation: 3, // Intensidade da sombra do card
            child: InkWell( // Torna o card inteiro clicável, com efeito visual de toque
              onTap: () { // Função executada quando o usuário toca no card
                Navigator.push( // Empilha (abre) uma nova tela por cima da atual
                  context, // Contexto atual, informando de onde a navegação parte
                  MaterialPageRoute( // Define a transição visual padrão entre telas
                    builder: (context) => ListaReceitasScreen(categoria: categoria), // Constrói a tela de destino, enviando a categoria escolhida
                  ), // Fim do MaterialPageRoute
                ); // Fim do Navigator.push
              }, // Fim do onTap
              child: Center( // Centraliza o conteúdo dentro do card
                child: Text( // Widget de texto
                  categoria, // Texto exibido: o nome da categoria
                  style: const TextStyle( // Define a aparência do texto
                    fontSize: 16, // Tamanho da fonte
                    fontWeight: FontWeight.bold, // Deixa o texto em negrito
                  ), // Fim do TextStyle
                  textAlign: TextAlign.center, // Centraliza o texto, caso quebre em mais de uma linha
                ), // Fim do Text
              ), // Fim do Center
            ), // Fim do InkWell
          ); // Fim do Card
        }, // Fim do itemBuilder
      ), // Fim do GridView.builder
    ); // Fim do Scaffold
  } // Fim do método build
} // Fim da classe HomeScreen