import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main/infra/ui/widgets/botao.dart';
import '../../../../utils/utils_for_tests.dart';

void main() {
  testWidgets('''
  DEVE    encontrar um titulo correspondente ao widget carregado 
  QUANDO  for passado o mesmo título como parâmetro
  ''', (WidgetTester tester) async {
    // Infla o widget dentro do app
    await pumpMaterialWidget(
      tester: tester,
      widget: Botao(
        titulo: 'Teste1',
        onClick: (() {}),
      ),
    );

    expect(find.text('Teste1'), findsOneWidget);
  });
}
