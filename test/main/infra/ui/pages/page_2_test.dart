import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main/infra/ui/pages/page_2.dart';
import 'package:widget_tests/main/infra/ui/widgets/botao.dart';

import '../../../../utils/utils_for_tests.dart';

void main() {
  testWidgets('''
  DEVE    carregar o o widget Page 2 com o conteúdo padrão
  QUANDO  ele o parâmetro conteudo não for definido
  ''', (WidgetTester tester) async {
    // Infla o widget dentro do app
    await pumpMaterialWidget(tester: tester, widget: const Page2());
    // Verifica se tem um Scaffold
    expect(find.byType(Scaffold), findsOneWidget);
    // Verifica se tem um AppBar
    expect(find.byType(AppBar), findsOneWidget);
    // Verifica se tem os dois Text (um no tile da AppBar e outro no body)
    expect(find.byType(Text), findsNWidgets(2));
    // Verifica se tem o texto 'Page 2' (que está na AppBar)
    expect(find.text('Page 2'), findsOneWidget);
    // Verifica se tem o texto 'Nenhum conteúdo...' (que está no body)
    expect(find.text('Nenhum conteúdo...'), findsOneWidget);
    // Confirma que não tem nenhum [Botao] na tela
    expect(find.byType(Botao), findsNothing);
  });

  testWidgets('''
  DEVE    carregar o o widget Page 2 alterando o conteúdo
  QUANDO  ele for caregado definindo o parâmetro 'conteudo'
  ''', (WidgetTester tester) async {
    // Infla o widget dentro do app
    await pumpMaterialWidget(
      tester: tester,
      widget: const Page2(conteudo: 'ABC'),
    );
    // Verifica se tem um Scaffold
    expect(find.byType(Scaffold), findsOneWidget);
    // Verifica se tem um AppBar
    expect(find.byType(AppBar), findsOneWidget);
    // Verifica se tem os dois Text (um no tile da AppBar e outro no body)
    expect(find.byType(Text), findsNWidgets(2));
    // Verifica se tem o texto 'Page 1' (que está na AppBar)
    expect(find.text('Page 2'), findsOneWidget);
    // Verifica se tem o texto 'Conteúdo - Page 1' (que está no body)
    expect(find.text('ABC'), findsOneWidget);
    // Confirma que não tem nenhum [Botao] na tela
    expect(find.byType(Botao), findsNothing);
  });
}
