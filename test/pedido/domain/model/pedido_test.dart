import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/pedido/domain/models/pedido.dart';
import 'package:widget_tests/pedido/relacionados/item_pedido/domain/models/item_pedido.dart';
import 'package:widget_tests/produto/domain/models/produto.dart';

void main() {
  late Pedido pedidoPadrao;
  late Cliente clientePadrao;
  late Produto primeiroProduto;
  late Produto segundoProduto;
  late ItemPedido primeiroItem;
  late ItemPedido segundoItem;

  setUp(() {
    clientePadrao = Cliente(idCliente: 1, razaoSocial: 'A Ltda', fantasia: 'A', documento: '123');

    primeiroProduto = Produto(idProduto: 1, descricao: 'Prod A', preco: 1, precoComDesconto: 0.99);
    segundoProduto = Produto(idProduto: 2, descricao: 'Prod B', preco: 2, precoComDesconto: 1.99);

    primeiroItem = ItemPedido(idPedido: 1, sequencia: 1, produto: primeiroProduto, quantidade: 1);
    segundoItem = ItemPedido(idPedido: 1, sequencia: 2, produto: segundoProduto, quantidade: 1);

    pedidoPadrao = Pedido(
      idPedido: 1,
      cliente: clientePadrao,
      itens: [primeiroItem, segundoItem],
    );
  });
  test('Teste construtor', () {
    expect(pedidoPadrao.idPedido, equals(1));
    expect(pedidoPadrao.cliente, equals(clientePadrao));
    expect(pedidoPadrao.itens.length, equals(2));
  });
  test('Teste copyWith', () {
    Pedido pedidoCopy = pedidoPadrao.copyWith(idPedido: 2);
    expect(pedidoCopy.idPedido, equals(2));
    expect(pedidoCopy.cliente, equals(clientePadrao));
    expect(pedidoCopy.itens.length, equals(2));
  });
  test('Teste copyWith vazio', () {
    Pedido pedidoCopy = pedidoPadrao.copyWith();
    expect(pedidoCopy.idPedido, equals(1));
    expect(pedidoCopy.cliente, equals(clientePadrao));
    expect(pedidoCopy.itens.length, equals(2));
  });
  test('Teste toMap', () {
    Map<String, dynamic> pedidoMap = pedidoPadrao.toMap();
    expect(
        pedidoMap,
        equals({
          'idPedido': 1,
          'cliente': {'idCliente': 1, 'razaoSocial': 'A Ltda', 'fantasia': 'A', 'documento': '123'},
          'itens': [
            {
              'idPedido': 1,
              'sequencia': 1,
              'produto': {'idProduto': 1, 'descricao': 'Prod A', 'preco': 1, 'precoComDesconto': 0.99},
              'quantidade': 1
            },
            {
              'idPedido': 1,
              'sequencia': 2,
              'produto': {'idProduto': 2, 'descricao': 'Prod B', 'preco': 2, 'precoComDesconto': 1.99},
              'quantidade': 1
            }
          ]
        }));
  });
  test('Teste toJson', () {
    String pedidoJson = pedidoPadrao.toJson();
    expect(
        pedidoJson,
        equals(
            '{"idPedido":1,"cliente":{"idCliente":1,"razaoSocial":"A Ltda","fantasia":"A","documento":"123"},"itens":[{"idPedido":1,"sequencia":1,"produto":{"idProduto":1,"descricao":"Prod A","preco":1,"precoComDesconto":0.99},"quantidade":1},{"idPedido":1,"sequencia":2,"produto":{"idProduto":2,"descricao":"Prod B","preco":2,"precoComDesconto":1.99},"quantidade":1}]}'));
  });
  test('Teste fromMap', () {
    Map<String, dynamic> pedidoMap = pedidoPadrao.toMap();
    Pedido pedidoFromMap = Pedido.fromMap(pedidoMap);
    expect(pedidoFromMap.idPedido, equals(1));
  });
  test('Teste fromJson', () {
    String pedidoJson = pedidoPadrao.toJson();
    Pedido pedidoFromMap = Pedido.fromJson(pedidoJson);
    expect(pedidoFromMap.idPedido, equals(1));
  });
  test('Teste toString', () {
    String str = pedidoPadrao.toString();
    expect(
        str,
        equals(
            'Pedido(idPedido: 1, cliente: Cliente(idCliente: 1, razaoSocial: A Ltda, fantasia: A, documento: 123), itens: [ItemPedido(idPedido: 1, sequencia: 1, produto: Produto(idProduto: 1, descricao: Prod A, preco: 1, precoComDesconto: 0.99), quantidade: 1), ItemPedido(idPedido: 1, sequencia: 2, produto: Produto(idProduto: 2, descricao: Prod B, preco: 2, precoComDesconto: 1.99), quantidade: 1)])'));
  });
  test('Teste ==', () {
    Pedido pedidoCopy = pedidoPadrao.copyWith();
    expect(pedidoPadrao, equals(pedidoCopy));
    expect(pedidoPadrao.idPedido, equals(pedidoCopy.idPedido));
  });
  test('Teste hashcode', () {
    final hash = pedidoPadrao.hashCode;
    expect(hash, equals(9218733327951237888));
  });
}
