import 'package:flutter/foundation.dart';
import '../models/receita.dart';

/// Controlador central da lista de favoritos.
///
/// Usa um singleton simples com ChangeNotifier (nativo do Flutter, sem
/// precisar adicionar o pacote "provider" no pubspec.yaml). As telas
/// escutam esse controller com um ListenableBuilder e são reconstruídas
/// automaticamente quando uma receita é favoritada/desfavoritada.
class FavoritosController extends ChangeNotifier {
  FavoritosController._interno();

  /// Instância única compartilhada por todo o app.
  static final FavoritosController instance = FavoritosController._interno();

  final List<Receita> _favoritos = [];

  /// Lista de favoritos (somente leitura por fora da classe).
  List<Receita> get favoritos => List.unmodifiable(_favoritos);

  /// Verifica se uma receita já está favoritada.
  bool isFavorito(Receita receita) {
    return _favoritos.any((r) => r.id == receita.id);
  }

  /// Adiciona ou remove uma receita dos favoritos.
  void alternarFavorito(Receita receita) {
    if (isFavorito(receita)) {
      _favoritos.removeWhere((r) => r.id == receita.id);
    } else {
      _favoritos.add(receita);
    }
    notifyListeners();
  }
}
