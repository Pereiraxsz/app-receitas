import 'package:flutter_test/flutter_test.dart';

import 'package:nutrireceitas/main.dart';
import 'package:nutrireceitas/screens/detalhes_receita_screen.dart';

void main() {
  testWidgets('Carrega app e navega para detalhes da receita', (WidgetTester tester) async {
    await tester.pumpWidget(const NutriReceitas());
    await tester.pumpAndSettle();

    expect(find.text('Bolo de banana'), findsOneWidget);

    await tester.tap(find.text('Bolo de banana'));
    await tester.pumpAndSettle();

    expect(find.byType(DetalhesReceitaScreen), findsOneWidget);
    expect(find.text('Ingredientes'), findsOneWidget);
    expect(find.text('Modo de preparo'), findsOneWidget);
    expect(find.text('Começar receita'), findsOneWidget);
    expect(find.text('2 bananas'), findsOneWidget);
    expect(find.text('Amasse as bananas'), findsOneWidget);
  });
}
