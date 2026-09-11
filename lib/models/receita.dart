class Receita {
  final String nome;
  final String categoria;
  final String imagem;
  final List<String> ingredientes;
  final String modoPreparo;
  final int tempoPreparo;

  Receita({
    required this.nome,
    required this.categoria,
    required this.imagem,
    required this.ingredientes,
    required this.modoPreparo,
    required this.tempoPreparo,
  });
}