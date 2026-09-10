class Receita {
  final String nome;
  final String categoria;
  final String imagem;
  final int tempoPreparo;
  final String dificuldade;
  final String calorias;
  final String porcoes;
  final List<String> ingredientes;
  final List<String> modoPreparo;

  Receita({
    required this.nome,
    required this.categoria,
    required this.imagem,
    required this.tempoPreparo,
    this.dificuldade = 'Fácil',
    this.calorias = '',
    this.porcoes = '',
    this.ingredientes = const [],
    this.modoPreparo = const [],
  });
}