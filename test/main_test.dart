import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main/infra/ui/widgets/botao.dart';
import 'package:widget_tests/pedido/infra/ui/widgets/lista_itens_pedido.dart';
import 'package:widget_tests/pedido/infra/ui/widgets/produto_tile.dart';
import 'utils/utils_for_tests.dart';

void main() {
  group('Testa a tela inicial', () {
    testWidgets('''
      DEVE    encontrar as caracteristicas correspondentes ao WrapMaterialApp 
      QUANDO  o WrapMaterialApp for carregado
      ''', (WidgetTester tester) async {
      // Infla a main
      await pumpMaterialWidget(tester: tester);
      // Verificações
      // Busca por um texto 'Home' no widget
      expect(find.text('Home'), findsOneWidget);
      // Busca por um widget do tipo 'CircularProgressIndicator'
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // Aguarda carregamento da Future de inicialização do .env
      await tester.pumpAndSettle(const Duration(seconds: 1));
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
      // Infla a main
      await pumpMaterialWidget(tester: tester);
      // Verificações
      // Aguarda carregamento da Future de inicialização do .env
      await tester.pumpAndSettle(const Duration(seconds: 1));
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
      // Infla a main
      await pumpMaterialWidget(tester: tester);
      // Verificações
      // Aguarda carregamento da Future de inicialização do .env
      await tester.pumpAndSettle(const Duration(seconds: 1));
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
      // Infla a main
      await pumpMaterialWidget(tester: tester);
      // Verificações
      // Aguarda carregamento da Future de inicialização do .env
      await tester.pumpAndSettle(const Duration(seconds: 1));
      // Clica em Botao com a key 'home-botao-3'
      await tester.tap(find.byKey(const Key('home-botao-3')));
    });
  });

  group('Testa fluxo de pedido', () {
    testWidgets('''
      DEVE    xxx
      QUANDO  xxx
      ''', (WidgetTester tester) async {
      // Infla a main
      await pumpMaterialWidget(tester: tester);
      //
      //
      // Constata que está na HomePage
      // Aguarda carregamento da Future de inicialização do .env
      await tester.pumpAndSettle(const Duration(seconds: 1));
      // Clica em no botão de iniciar pedido (key 'home-botao-add-pedido')
      await tester.tap(find.byKey(const Key('home-botao-add-pedido')));
      // Aguarda carregamento do push para a CapaPedidoPage
      await tester.pumpAndSettle();
      //
      //
      // Constata que está na CapaPedidoPage
      expect(find.text('Pedido'), findsOneWidget);
      expect(find.text('Cliente'), findsOneWidget);
      expect(find.text('Itens do pedido'), findsOneWidget);
      expect(find.text('Nenhum item adicionado ao pedido'), findsOneWidget);
      expect(find.text('Resumo'), findsOneWidget);
      expect(find.text('Qtd de itens: 0'), findsOneWidget);
      expect(find.text('Valor total do pedido: R\$ 0'), findsOneWidget);
      expect(find.byType(ListaItensPedido), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
      expect(find.byKey(const Key('add-item-pedido')), findsOneWidget);
      // Clica em no botão de adicionar itens
      await tester.tap(find.byKey(const Key('add-item-pedido')));
      // Aguarda carregamento do push para a ListaItensPedidoPage
      await tester.pumpAndSettle();
      //
      //
      // Constata que está na CatalogoProdutosPage
      expect(find.text('Catálogo de produtos'), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
      expect(find.byType(ProdutoTile), findsWidgets);
      expect(find.byKey(const Key('salvar-itens-selecionados')), findsOneWidget);
      var qtdProd1 = find.byKey(const Key('tile-prod-id-1-qtd')).evaluate().first.widget as Text;
      expect(qtdProd1.data, equals("0"));
      var qtdProd2 = find.byKey(const Key('tile-prod-id-2-qtd')).evaluate().first.widget as Text;
      expect(qtdProd2.data, equals("0"));
      // Adiciona qtd 1 do produto 1
      await tester.tap(find.byKey(const Key('tile-prod-1-add')));
      await tester.pumpAndSettle();
      qtdProd1 = find.byKey(const Key('tile-prod-id-1-qtd')).evaluate().first.widget as Text;
      expect(qtdProd1.data, equals("1"));
      // Adiciona qtd 2 do produto 1
      await tester.tap(find.byKey(const Key('tile-prod-1-add')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('tile-prod-1-add')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('tile-prod-1-dcc')));
      await tester.pumpAndSettle();
      qtdProd1 = find.byKey(const Key('tile-prod-id-1-qtd')).evaluate().first.widget as Text;
      expect(qtdProd1.data, equals("2"));
      // Verifica que o produto 2 continua igual
      qtdProd2 = find.byKey(const Key('tile-prod-id-2-qtd')).evaluate().first.widget as Text;
      expect(qtdProd2.data, equals("0"));
      // Salvar itens selecionados no catálogo
      await tester.tap(find.byKey(const Key('salvar-itens-selecionados')));
      await tester.pumpAndSettle();
      //
      //
      // Constata que voltamos para CapaPedidoPage considerando o(s) item(s) adicionados
      expect(find.text('Pedido'), findsOneWidget);
      expect(find.text('Cliente'), findsOneWidget);
      expect(find.text('Itens do pedido'), findsOneWidget);
      expect(find.text('Nenhum item adicionado ao pedido'), findsNothing);
      expect(find.text('Qtd de itens: 1'), findsOneWidget);
      expect(find.text('Valor total do pedido: R\$ 2.0'), findsOneWidget);
    });
  });
}
