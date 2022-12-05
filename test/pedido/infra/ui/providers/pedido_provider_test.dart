import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/pedido/domain/models/pedido.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';
import 'package:widget_tests/pedido/relacionados/item_pedido/domain/models/item_pedido.dart';
import 'package:widget_tests/produto/domain/models/produto.dart';

void main() {
  late Pedido pedidoPadrao;
  late Cliente clientePadrao;
  late Produto primeiroProduto;
  late ItemPedido primeiroItem;

  late PedidoProvider pedidoProvider;
  setUp(() {
    clientePadrao = Cliente(idCliente: 1, razaoSocial: 'A Ltda', fantasia: 'A', documento: '123');
    primeiroProduto = Produto(idProduto: 1, descricao: 'Prod A', preco: 1, precoComDesconto: 0.99);
    primeiroItem = ItemPedido(idPedido: 1, sequencia: 1, produto: primeiroProduto, quantidade: 1);
    pedidoPadrao = Pedido(
      idPedido: 1,
      cliente: clientePadrao,
      itens: [],
    );
    // Inicializa provider
    pedidoProvider = PedidoProvider();
  });
  test('DEVE lançar exception QUANDO não existir um pedido', () {
    expect(() => pedidoProvider.addItemPedido(primeiroItem), throwsA(isA<Exception>()));
  });
  test('DEVE adicionar um item QUANDO existir um pedido', () {
    pedidoProvider.setPedido(pedidoPadrao);
    pedidoProvider.addItemPedido(primeiroItem);
    expect(pedidoProvider.pedido!.itens.length, equals(1));
  });
}
