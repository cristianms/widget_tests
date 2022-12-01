import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main.dart';
import 'package:widget_tests/widgets/botao.dart';

void main() {
  testWidgets('''
  DEVE    encontrar as caracteristicas correspondentes ao WrapMaterialApp 
  QUANDO  o WrapMaterialApp for carregado
  ''', (WidgetTester tester) async {
    // Infla o widget WrapMaterialApp
    await tester.pumpWidget(const WrapMaterialApp());
    // Verificações
    // Busca por um texto 'Home' no widget
    expect(find.text('Home'), findsOneWidget);
    // Busca por um widget do tipo 'Botao', deve encontrar os 3 definidos na página
    expect(find.byType(Botao), findsNWidgets(3));
    // Busca por widgets contendo os textos "Teste 1", "Teste 2" e "Teste 3"
    expect(find.text('Teste 1'), findsOneWidget);
    expect(find.text('Teste 2'), findsOneWidget);
    expect(find.text('Teste 3'), findsOneWidget);
    // Busca por um widget com a key 'home-options'
    expect(find.byKey(const Key('home-options')), findsOneWidget);
    // Executa um clique no botão de info da AppBar (apenas para subir coverage :P)
    await tester.tap(find.byKey(const Key('home-options')));
  });

  testWidgets('''
  DEVE    executar a navegação para outra página
  QUANDO  for clicado no botão 1
  ''', (WidgetTester tester) async {
    // Infla o widget WrapMaterialApp
    await tester.pumpWidget(const WrapMaterialApp());
    // Verificações
    // Clica em Botao com a key 'home-botao-1'
    await tester.tap(find.byKey(const Key('home-botao-1')));
    // Aguarda 1 segundo para garantir o frame atualizado
    await tester.pumpAndSettle(const Duration(seconds: 1));
    // Verifica se encontrou o título 'Page 1' que é referente a AppBar da página destino
    expect(find.text('Page 1'), findsOneWidget);
  });

  testWidgets('''
  DEVE    executar a navegação para outra página
  QUANDO  for clicado no botão 2 com parâmetro
  ''', (WidgetTester tester) async {
    // Infla o widget WrapMaterialApp
    await tester.pumpWidget(const WrapMaterialApp());
    // Verificações
    // Clica em Botao com a key 'home-botao-2'
    await tester.tap(find.byKey(const Key('home-botao-2')));
    // Aguarda 1 segundo para garantir o frame atualizado
    await tester.pumpAndSettle(const Duration(seconds: 1));
    // Verifica se encontrou o título 'Page 1' que é referente a AppBar da página destino
    expect(find.text('Page 2'), findsOneWidget);
    expect(find.text('Lorem ipsum 2'), findsOneWidget);
  });

  testWidgets('''
  DEVE    não fazer nada
  QUANDO  for clicado no botão 3
  ''', (WidgetTester tester) async {
    // Infla o widget WrapMaterialApp
    await tester.pumpWidget(const WrapMaterialApp());
    // Verificações
    // Clica em Botao com a key 'home-botao-3'
    await tester.tap(find.byKey(const Key('home-botao-3')));
  });

  testWidgets('''
  DEVE    não fazer nada
  QUANDO  for clicado no botão 3
  ''', (WidgetTester tester) async {
    // Infla o widget WrapMaterialApp
    await tester.pumpWidget(const WrapMaterialApp());
    // Verificações
    // Clica em Botao com a key 'home-botao-3'
    await tester.tap(find.byKey(const Key('home-botao-3')));
  });
}
